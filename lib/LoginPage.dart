
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'DashboardScreen.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_loginFormKey.currentState?.validate() ?? false) {
      // Valid form, handle login logic
      String email = _emailController.text;
      String password = _passwordController.text;
     /* Fluttertoast.showToast(
        msg: "Login successful!\nEmail: $email\nPassword: $password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.green,
        textColor: Colors.black,
      );*/
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
      // Implement your login logic here
      print('Login Successful!\nEmail: $email\nPassword: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}