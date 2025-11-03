import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '',
      email = '',
      mobile = '',
      password = '',
      confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (v) => name = v,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (v) => email = v,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile'),
                onChanged: (v) => mobile = v,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (v) => password = v,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                onChanged: (v) => confirmPassword = v,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text('Continue / Sign Up'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/choose_role');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
