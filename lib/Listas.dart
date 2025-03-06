import 'package:flutter/material.dart';

///Clase sin acualizacion de estado
class Listas extends StatefulWidget {
  const Listas({super.key, required this.name, required this.num});

  final String name;
  final String num;

  @override
  State<Listas> createState() => _ListasState();
}

class _ListasState extends State<Listas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //aqui va lo de AlertDialog
        children: [
          buildContainer1('Nombre con apellidos', '2'),
          buildContainer2(),
          ///const NewWidget1()
        ],
      ),
    );
  }

  Container buildContainer2() {
    return Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex:8,
                      child: Text('Nombre con Apellidos')
                  ),
                  Expanded(
                      flex: 4,
                      child: Text('1')
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex:10,
                      child: Text('Descripcion')
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                  )
                ],
              ),

            ],
          ),
        );
  }
///Funciones para actualizar el estado de nuestra vista
  Container buildContainer1(name, number) {
    return Container(
          color: Colors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex:8,
                      child: Text(name)
                  ),
                  Expanded(
                      flex: 4,
                      child: Text(number)
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex:10,
                      child: Text('Descripcion')
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                  )
                ],
              ),
            ],
          ),
        );
  }
}

