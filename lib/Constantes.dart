//Crear las cariables que se usan en todas las cistas y
//su valor siempre va a ser el mismo

import 'package:flutter/material.dart';


const String user = "hector";
const String pass = "123+";

const String name = "Hector Alejandro Gil Zarate";


const color1 = Colors.black;
const color2 = Colors.white;

const List nombres = [
  '1#Nombre1#Apellido1#Apellido2#1#1',
  '2#Nombre1#Apellido1#Apellido2#1#1',
  '3#Nombre1#Apellido1#Apellido2#1#1',
  '4#Nombre1#Apellido1#Apellido2#1#1',
];

List dameLista(){
  List name = [];
  for(int i = 0; i<10; i++){
    name.add('$i#Nombre$i#Apellido1#Apellido2#$i#1');

  }
  return name;
}