import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:worldwide/services/worldtime.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void worldSetup() async {
    WorldTime india = WorldTime(name: "India", url: 'Asia/Kolkata');
    await india.getData();
    print(india.time);
  }
  
  @override
  void initState() {
    super.initState();
    worldSetup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading screen"),
      ),
    );
  }
}