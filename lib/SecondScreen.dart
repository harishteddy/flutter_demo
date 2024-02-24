import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ThirdScreen.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter your text',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                print('First text field: $text (${text.characters.length})');
              },

            ),
            SizedBox(height: 16.0), // Adding some space between the text field and button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
                // Add your button click logic here
                print('Button clicked!');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
