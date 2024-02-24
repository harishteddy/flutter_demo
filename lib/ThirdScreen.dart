import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final textFieldValueHolder = TextEditingController();
  String result = '';

  getTextInputData() {
    setState(() {


      result = textFieldValueHolder.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.network(
              'https://cdnt.netcoresmartech.com/34442/1620966157.png', // Replace with the URL of your image
              width: 400,
              height: 200,
              // You can customize other properties like width, height, fit, etc.
            ),
            Container(
              width: 400,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: textFieldValueHolder,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Enter Some Text',
                  border: OutlineInputBorder(), // Add this line for border
                ),
              ),
            ), // Remove the extra comma here



            ElevatedButton(
              onPressed: () {
                getTextInputData();
                //Navigator.pop(context); // Navigate back to the previous screen
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFC107),
                onPrimary: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              child: Text('Get Text Field Entered Data'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Entered Text is = $result", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
