import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.location,this.url});

  Future<void> getTime() async
  {
    //get the resonse from api endpoint
    print("insie");
    Response response=await get('http://worldtimeapi.org/api/timezone/Europe/Berlin');
    print("outside");
    //decode string to map
    Map data=jsonDecode(response.body);
    //get the time and offset
    String datetime=data["datetime"];
    String offset_hrs= data["utc_offset"].substring(1,3);
    String offset_min= data["utc_offset"].substring(4,6);
    //Create DateTime object
    DateTime now = DateTime.parse(datetime);
    //add offset hrs and offset minutes to datetime
    now =now.add(Duration(hours:int.parse(offset_hrs),minutes:int.parse(offset_min)));
    time=now.toString();


  }
}