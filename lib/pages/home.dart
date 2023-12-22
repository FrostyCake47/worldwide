import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

/*class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //data = ModalRoute.of(context)!.settings.arguments as Map;
    var arguments = ModalRoute.of(context)?.settings.arguments;
    data = arguments is Map ? arguments : {};
    String time = data["time"];
    print("data is $data");*/

class _HomeState extends State<Home> {
  Map? data = {};
  Object? parameters;

  @override
  Widget build(BuildContext context) {
    //parameters = ModalRoute.of(context)!.settings.arguments;
    //data = jsonDecode(jsonEncode(parameters));

    data = ModalRoute.of(context)!.settings.arguments as Map?;
    //String location = data?['location'] ?? "its coming null";

    String location = "";

    /*if(data?['location'] == null){
      Navigator.pushReplacementNamed(context, '/loading');
    }
    else{
      String location = data?['location'] ?? "its coming null";
    }*/
    print(location);
    

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Text("Ola seniora"),
        centerTitle: true,
        
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10,), 
             TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/choose_location");
              }, 
              child: Text("Change location")),
              Container(
                child: Column(
                  children: <Widget>[
                    Text("India"),
                    Text(location),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}