import 'package:badnames/pages/home.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> routes(){
  return  <String,WidgetBuilder>{
    'home':(BuildContext context)=>HomePage()

  };

}