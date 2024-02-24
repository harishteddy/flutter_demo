import 'package:flutter/material.dart';
import 'ThirdScreen.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("harish"),
      ),
       body:Padding(
         padding: const EdgeInsets.all(16.0),
         child:Column(
             children:[
               TextFormField(
                   controller: _emailController,
                   decoration: InputDecoration(
                   labelText: 'Enter your text',
                   border: OutlineInputBorder(),
                 ),
                 obscureText: true,
                 onChanged: (text) {
                   print('First text field: $text (${text.characters.length})');
                 },
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                   onPressed: () {
                     setState(() {

                     });
                   },
                   child: Text('Submit'),
                 ),
               ),
             ]
         ),
       )

    );
  }
}



































 /* bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.deepPurple.withOpacity(.2)),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "username is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    border: InputBorder.none,
                    hintText: "Username",
                    labelText: "Name"),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.deepPurple.withOpacity(.2)),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "password is required";
                  }
                  return null;
                },
                obscureText: !isVisible,
                decoration: InputDecoration(
                    icon: const Icon(Icons.lock),
                    border: InputBorder.none,
                    hintText: "Password",
                    labelText: 'password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off))),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your text',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              onChanged: (text) {
                print('First text field: $text (${text.characters.length})');
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
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





















*/


/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ThirdScreen.dart';

class SecondScreen extends StatefulWidget{
  @override
  _SecondScreenState createState() => _SecondScreenState();
}
class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    bool isVisible = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.deepPurple.withOpacity(.2)),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "username is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: InputBorder.none,
                  hintText: "Username",
                  labelText: "Name"
                ),


              ),
            ),


            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.deepPurple.withOpacity(.2)),
              child: TextFormField(
                //controller: password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "password is required";
                  }
                  return null;
                },
                obscureText: !isVisible,
                decoration: InputDecoration(
                    icon: const Icon(Icons.lock),
                    border: InputBorder.none,
                    hintText: "Password",
                    labelText: 'password',
                     suffixIcon: IconButton(
                        onPressed: () {
                         //In here we will create a click to show and hide the password a toggle button
                         setState(() { //toggle button
                          isVisible = !isVisible;
                         });
                      },
                       icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off))
                ),
              ),
            ),






            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your text',
                 border: OutlineInputBorder(),
              ),
              obscureText: true,
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

*/
