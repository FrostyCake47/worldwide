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
  Future<void> worldSetup() async {
    print("currently in loading (worldSetup)");
    WorldTime instance = WorldTime(name: "India", url: 'Asia/Kolkata');
    await instance.getData();

    print("printing instance time ${instance.time}");
    if(!mounted) return;
    Navigator.pushReplacementNamed(context, "/home", arguments: {'time':instance.time});
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
      
      body: Center(
        child: FutureBuilder(
          future: worldSetup(),
          builder: (context, snapshot) {
            // You can show a loading indicator here if needed
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}