import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '', password = '';

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      // In a real app, do authentication.
      // For demo, maybe route user to choose_role or a dashboard.
      Navigator.pushNamed(context, '/choose_role');
      // Or if you want to differentiate, direct to a dashboard based on saved role.
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Signed in!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (val) =>
                    val!.contains('@') ? null : 'Enter a valid email',
                onChanged: (val) => email = val,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (val) => val!.length >= 6 ? null : 'Min 6 chars',
                onChanged: (val) => password = val,
              ),
              SizedBox(height: 24),
              ElevatedButton(child: Text('Sign In'), onPressed: _signIn),
              TextButton(
                child: Text('Don\'t have an account? Sign Up'),
                onPressed: () => Navigator.pushNamed(context, '/signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
