import 'package:flutter/material.dart';
class secondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),

          Container(
              padding: EdgeInsets.all(40),
              child: Text('We are in the second page now  😎', style: TextStyle(color: Colors.blueGrey, fontSize: 25),))
        ],
      ),

    );
  }
}
