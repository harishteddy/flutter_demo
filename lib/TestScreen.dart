import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<String> entries = ['One', 'Two', 'Three','Four', 'Five', 'SIX','Seven', 'NiNE', 'Ten','Item 1', 'Item 2', 'Item 3','Item 1', 'Item 2', 'Item 3','Item 1', 'Item 2', 'Item 3','Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.teal[50],
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                entries[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Handle action tap
                print('${entries[index]} tapped');
              },
              trailing: Icon(Icons.arrow_forward, color: Colors.teal),
            ),
          );
        },
      ),
    );
  }
}













  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${entries[index]}'),

            onTap: () {
              // Handle action tap
              print('${entries[index]} tapped');
            },
          ); // ListTile
        },
      ), // ListView.builder
    ); // Scaffold
  }
}
*/


