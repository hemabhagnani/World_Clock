import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time="Loading";
  void getusworldtime() async{
    WorldTime instance=WorldTime(location: "Kolkata",url: "Europe/Berlin");
    await instance.getTime();
    print(instance.time);
    setState(() {
      time=instance.time;
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
      body: SafeArea(
        child: Text(time),
      ),
    );
  }
}
