import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  //final List<String> entries = ['A', 'B', 'C','Item 1', 'Item 2', 'Item 3','Item 1', 'Item 2', 'Item 3','Item 1', 'Item 2', 'Item 3','Item 1', 'Item 2', 'Item 3','Item 1', 'Item 2', 'Item 3','Item 1', 'Item 2', 'Item 3'];
  List<List<String>> listsData = [
    ['Item 1', 'Item 2', 'Item 3'],
    ['Item A', 'Item B', 'Item C', 'Item D'],
    ['Item X', 'Item Y', 'Item Z'],
    ['Item P', 'Item Q', 'Item R'],
    ['Item M', 'Item N', 'Item O'],
  ];
      @override
      Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
      title: Text('Test Screen'),
      ),
      body: ListView.builder(
      itemCount: listsData.length,
      itemBuilder: (context, index) {
      return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      ListTile(
      title: Text('List ${index + 1}'),
      ),
      Divider(),
      ListView.builder(
      itemCount: listsData[index].length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, innerIndex) {
      return ListTile(
      title: Text(listsData[index][innerIndex]),
      );
      },
      ),
      ],
      );
      },
      ),
      );
      }
      }
















      /*body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${entries[index]}'),
          ); // ListTile
        },
      ), // ListView.builder*/


