import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:js';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data = {};

  @override
  Widget build(BuildContext context) {
    //if(data?['location'] == null) build(context);
    print("currently in home");
    data = ModalRoute.of(context)!.settings.arguments as Map?;
    print(data?['time']);
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Text("World Time"),
        centerTitle: true,
        
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
            const SizedBox(height: 20,), 
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFFFFB300),
                              Color(0xFFFFC107),
                              Color(0xFFFFCA28),
                            ],
                          ),
                        ),
                      ),
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/choose_location");
                      },
                      child: const Text('Change Location'),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey[900]),
                
                  child: Column(
                    children: <Widget>[
                      Text("India",
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 20,
                        fontFamily: "Robato",
                      ),),
                
                      Text(data?['time']! ?? "cmon", style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 40,
                        fontFamily: "Robato",
                      ),),
                    ],
                  ),
                ),
              ),
              
          ],
        ),
      ),
    );
  }
}