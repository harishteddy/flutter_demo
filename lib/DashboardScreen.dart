import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartech_base/smartech_base.dart';
import 'package:smartech_nudges/netcore_px.dart';
import 'SecondScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:harish_demo/MyHomePage.dart';
import 'package:harish_demo/MoviesListScreen.dart';
import 'package:harish_demo/TestScreen.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.count(
       crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 16.0, // Spacing between columns
        mainAxisSpacing: 16.0, // Spacing between rows
        padding: EdgeInsets.all(16.0),
        children: [
          DashboardItem(
            title: 'Item 1',
            icon: Icons.home,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestScreen()),
                //MaterialPageRoute(builder: (context) => TaskListScreen()),
              );

            },
          ),
          DashboardItem(
            title: 'Item 2',
            icon: Icons.settings,
            onTap: () {
              try {
                const url = 'https://netcorecloud.com';
                launch(url);
                print('Item 2 tapped!');
              } catch (e) {
                print('Error launching URL: $e');
              }
              // Handle item tap
              print('Item 2 tapped!');
            },
          ),
          DashboardItem(
            title: 'Item 3',
            icon: Icons.camera,
            onTap: () {
              // Handle item tap
              print('Item 3 tapped!');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoviesListScreen()),
              );

            },
          ),
          DashboardItem(
            title: 'Item 4',
            icon: Icons.mail,
            onTap: () {

              Smartech().logoutAndClearUserIdentity(true);
              NetcorePX.instance.clearUserId();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );

              // Handle item tap
              print('Item 4 tapped!');
            },
          ),
          // Add more DashboardItem widgets as needed
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DashboardItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}