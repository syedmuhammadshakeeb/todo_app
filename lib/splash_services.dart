import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/todo_list.dart';

class SplashServices{
  toDOSplash(BuildContext, context){
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>todoList() ));
    });
  }
}