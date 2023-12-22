import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String name;
  String time = '';
  String url;

  WorldTime({required this.name, required this.url});

  Future<void> getData() async {
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    int offset = int.parse(data['utc_offset'].substring(1, 3)) * 60 + int.parse(data['utc_offset'].substring(4, 6));
    //print(datetime + "\n" +  offset.toString());

    DateTime now = DateTime.parse(datetime).add(Duration(minutes: offset));
    time = DateFormat.jm().format(now).toString();
    print("worldtime time: $time");
    
  }
}