import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getusworldtime() async{
    WorldTime instance=WorldTime(location: "Kolkata",url: "Asia/Kolkata",flag:"India.png");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      "location":instance.location,
      "time":instance.time,
      "flag":instance.flag,
      "isDaytime":instance.isDaytime,
    });
  }
  @override
  void initState() {
    super.initState();
    getusworldtime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
