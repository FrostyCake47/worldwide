import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldwide/services/worldtime.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> worldSetup() async {
    print("currently in loading (worldSetup)");
    WorldTime instance = WorldTime(location: "India", url: 'Asia/Kolkata', flag: 'india.png');
    await instance.getData();

    if(!mounted) return;
    Navigator.pushReplacementNamed(context, "/home", 
    arguments: {'time':instance.time, 
                'location':instance.location,
                'isDaytime':instance.isDayTime.toString()});
  }

  @override
  void initState() {
    super.initState();
    worldSetup();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitSpinningLines(color: Colors.amber,)
      ),
    );
  }
}