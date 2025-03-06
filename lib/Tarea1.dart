import 'package:flutter/material.dart';
import 'dart:math';

class Tarea1 extends StatefulWidget {
  const Tarea1({super.key});

  @override
  State<Tarea1> createState() => _Tarea1State();
}

class _Tarea1State extends State<Tarea1> {
  // Generamos los colores aleatorios al inicio
  late List<List<Color>> colors;
  late List<List<Color>> textColors;

  @override
  void initState() {
    super.initState();
    colors = List.generate(
      6,
          (index) => List.generate(
        5,
            (index) => Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
      ),
    );
    textColors = List.generate(
      6,
          (index) => List.generate(
        5,
            (index) => Colors.black, // Inicializamos los textos en color negro
      ),
    );
  }

  // Función para intercambiar colores en la columna 1
  void swapColorColumn1(int row) {
    setState(() {
      int invertedRow = 5 - row; // Fila inversa
      Color temp = colors[row][0];
      colors[row][0] = colors[invertedRow][0];
      colors[invertedRow][0] = temp;
    });
  }

  // Función para intercambiar colores en la última columna con la diagonal
  void swapColorDiagonal(int row) {
    setState(() {
      Color temp = colors[row][4]; // Última columna
      colors[row][4] = colors[row][row]; // Diagonal
      colors[row][row] = temp;
      colors[row][4] = Color.fromARGB(
          255,
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256)
      );
    });
  }

  // Función para invertir los colores de la columna 2 (texto y fondo)
  void swapTextAndCellColor(int row, int col) {
    setState(() {
      Color cellColor = colors[row][col]; // Color de la celda
      Color textColor = textColors[row][col]; // Color del texto

      // Intercambiamos los colores entre el fondo (celda) y el texto
      colors[row][col] = textColor; // Ahora la celda tiene el color del texto
      textColors[row][col] = cellColor; // El texto toma el color de la celda
    });
  }

  // Cambio de color aleatorio para toda la cuadrícula
  void changeAllColors() {
    setState(() {
      Random random = Random();
      for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 5; j++) {
          colors[i][j] = Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
          textColors[i][j] = Colors.black; // Dejamos el texto en negro para todas las celdas
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla
    double screenHeight = MediaQuery.of(context).size.height - 75;
    double screenWidth = MediaQuery.of(context).size.width;

    // Ajustar el tamaño de las celdas para que encajen sin scroll
    double cellHeight = screenHeight / 6; // Dividir el alto de la pantalla entre las 6 filas
    double cellWidth = screenWidth / 5;  // Dividir el ancho de la pantalla entre las 5 columnas

    return Scaffold(
      appBar: AppBar(
        title: Text('GridLayout sin Scroll'),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // 5 columnas
            childAspectRatio: cellWidth / cellHeight, // Ajustar el aspecto de la celda
          ),
          itemCount: 30, // 6 filas * 5 columnas = 30 celdas
          itemBuilder: (context, index) {
            int row = index ~/ 5;
            int col = index % 5;

            return GestureDetector(
              onTap: () {
                if (col == 0) {
                  swapColorColumn1(row); // Columna 1: Intercambiar colores
                } else if (col == 4) {
                  swapColorDiagonal(row); // Columna 5: Intercambiar con diagonal
                } else if (col == 1) {
                  swapTextAndCellColor(row, col); // Columna 2: Invertir fondo y texto
                } else if (col == 3) {
                  changeAllColors(); // Columna 4: Cambiar colores aleatoriamente
                }
              },
              child: Container(
                margin: EdgeInsets.all(0), // Espacio entre celdas
                decoration: BoxDecoration(
                  color: colors[row][col], // Color de la celda

                ),
                child: Center(
                  child: col == 1
                      ? Text(
                    'Texto',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: textColors[row][col], // Color del texto
                    ),
                  )
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
