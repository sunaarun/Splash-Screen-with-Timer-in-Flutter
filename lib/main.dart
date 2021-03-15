import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash_screen/secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    startSplashScreenTimer(); // calling startSplashScreenTimer method,to start the timer
  }

  startSplashScreenTimer() async { // Because we using Timer and it is a Future Object, we used async keyword
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
    /*
     1-Create a variable type Duration, and set Duration to 5 seconds,
     2-Create a  Timer here, which takes two arguments, first duration,
     and callback which is in our case is navigationToNextPage which will be called after the duration {5 seconds here },
     Note: we have to import 'dart:async' so we can use Timer class
     */
  }

  void navigationToNextPage() async {
    Navigator.pushAndRemoveUntil(
      context, new MaterialPageRoute(builder: (context) =>
    new secondPage()),
          (Route<dynamic> route) => false,//
    );
    /*
      1- use Navigator to switch between routes or activities in Flutter app,
      2- Navigator.push : to push to new route or activity
      3- we called Navigator.pushAndRemoveUntil to pus to the next Route,which is in this case 'secondPage'
      Note: we used pushAndRemoveUntil to push the given route onto navigator and remove all the previous routes from stack or
      until the predicate returns true.

     */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            SizedBox(height: 100,),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Text('Splash 😍', style:TextStyle(color: Colors.black, fontSize: 20)),
            ),
          SizedBox(height: 50,),
            CircularProgressIndicator(
              backgroundColor: Colors.pink[300],
            ),
            Container(
                padding: EdgeInsets.only(top: 20, bottom: 50),
                child: Text('Splash Screen Example', style: TextStyle(color: Colors.amber, fontSize: 25),))
          ]
        ),
      ),
    );
  }
}
