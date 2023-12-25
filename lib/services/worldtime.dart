import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time = '';
  String url;
  bool isDayTime = true;
  String flag;

  WorldTime({required this.location, required this.url, required this.flag});

  Future<void> getData() async {
    try{
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      int offset = int.parse(data['utc_offset'].substring(1, 3)) * 60 + int.parse(data['utc_offset'].substring(4, 6));
      //print(datetime + "\n" +  offset.toString());

      DateTime now = DateTime.parse(datetime).add(Duration(minutes: offset));
      time = DateFormat.jm().format(now).toString();
      isDayTime = (now.hour >= 6 && now.hour < 18) ? true : false;

      print("worldtime time: $time");
    }
    catch(e){
      print(e);
    }
    
  }
}