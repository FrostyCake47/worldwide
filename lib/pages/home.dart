import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Text("Ola seniora"),
        centerTitle: true,
        
      ),

      body: Column(
        children: <Widget>[
          const SizedBox(height: 10,), 
           TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/choose_location");
            }, 
            child: Text("Change location") )
        ],
      ),
    );
  }
}