import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

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
      String offset_hrs = data["utc_offset"].substring(1, 3);
      String offset_min = data["utc_offset"].substring(4, 6);
      //Create DateTime object
      DateTime now = DateTime.parse(datetime);
      //add offset hrs and offset minutes to datetime
      now = now.add(Duration(
          hours: int.parse(offset_hrs), minutes: int.parse(offset_min)));
      time = now.toString();
    }
    catch(e){
      time="Could not get the time";
    }


  }
}