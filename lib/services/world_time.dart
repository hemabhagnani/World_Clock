import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async
  {
    try {
      //get the resonse from api endpoint

      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');

      //decode string to map
      Map data = jsonDecode(response.body);
      //get the time and offset
      String datetime = data["datetime"];
      int offset_hrs = int.parse(data['utc_offset'].substring(1,3));
      int offset_min = int.parse(data['utc_offset'].substring(4,6));

      if (data['utc_offset'].substring(0, 1) == "-") {
        offset_hrs = -offset_hrs;
        offset_min = -offset_min;
      }
      //Create DateTime object
      DateTime now = DateTime.parse(datetime);
      //add offset hrs and offset minutes to datetime
      now = now.add(Duration(
          hours: offset_hrs, minutes: offset_min));
      isDaytime=(now.hour >5 && now.hour<20) ? true:false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      time="Could not get the time";
    }


  }
}