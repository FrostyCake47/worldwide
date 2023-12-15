// ignore_for_file: prefer_const_constructors

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:worldwide/pages/choose_location.dart';
import 'package:worldwide/pages/home.dart';
import 'package:worldwide/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/home",
  routes: {
    "/" : (context) => Loading(),
    "/home" : (context) => Home(),
    "/choose_location" : (context) => ChooseLocation(),
  },
  debugShowCheckedModeBanner: false,
));

