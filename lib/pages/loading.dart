import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async
  {
    //get the resonse from api endpoint
    Response response=await get('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
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
     print(now);


  }
  @override
  void initState() {
    super.initState();

    getTime();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading screen"),
    );
  }
}
