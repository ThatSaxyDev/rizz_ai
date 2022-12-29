import 'package:flutter/material.dart';

class Constants {
  static const String uri = 'https://rizz-server.onrender.com';
}

double height(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context){
  return MediaQuery.of(context).size.width;
}