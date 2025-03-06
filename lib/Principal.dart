import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  //Crear variables
  bool c1 = false;
  //Fin de espacio para  variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              //Sobreponer widgets sobre si
              children: [
                Expanded(
                  flex: 8,
                  ///InkWel le da la acción de un btn a cualquier widget
                  child: InkWell(
                    onTap: (){
                      //(){} -> Esta combinación significa funcion interna
                      //Reaizar la accion de cambio de color al contenedo hijo
                      setState(() {
                        c1 = c1 ? false : true;
                      });
                    },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height/3,
                    color: c1 ? Colors.red : Colors.yellow,
                    child: Text(
                      'Color Rojo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  )
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height/3,
                    color: Colors.purple,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height/3,
                    color: Colors.blue,
                  ),
                )
              ],
            )),
          Expanded(
              flex: 2,
              child: Row(
                //Sobreponer widgets sobre si
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height/3,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height/3,
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height/3,
                      color: Colors.red,
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Row(
                //Sobreponer widgets sobre si
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height/3,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height/3,
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height/3,
                      color: Colors.red,
                    ),
                  )
                ],
              )),

        ],
      )

    );
  }
}
