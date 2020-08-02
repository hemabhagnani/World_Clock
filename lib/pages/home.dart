import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;
    String imagepath= data["isDaytime"]? "https://cdn.pixabay.com/photo/2016/11/18/16/01/tree-1835519_960_720.jpg":"https://cdn.pixabay.com/photo/2019/09/08/15/29/moon-4461260_960_720.jpg";
    String topcolor=data["isDaytime"] ? 'Colors.blue':'Colors.blue[900]';
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: NetworkImage("$imagepath"),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
          child: SafeArea(
            child:Column(

              children: <Widget>[
                FlatButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(Icons.edit_location,color:Colors.white),
                    label:Text("Edit Location",style:TextStyle(
                      color: Colors.white

                    )),
                ),
                SizedBox(height: 2.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                    data["location"],
                    style: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 2.0,
                        color:Colors.white,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Text(
                  data["time"],
                  style:TextStyle(
                    fontSize: 40.0,
                    letterSpacing: 2.0,
                    color:Colors.white
                  )
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
