import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  void getData() async
  {
    String Username= await Future.delayed(Duration(seconds: 3),(){
      return "Hema";
    });

    String UserData= await Future.delayed(Duration(seconds: 2),(){
  return "CTAE";
    }
  );
    print("$Username - $UserData");

  void initState() {
  super.initState();
    print("called initstate");
    getData();
    print("get data called");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
