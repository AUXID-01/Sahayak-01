import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String email = '';
  String mobile = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // First Name
              TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
                onChanged: (v) => firstName = v,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Please enter your first name' : null,
              ),

              // Last Name
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last Name'),
                onChanged: (v) => lastName = v,
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Please enter your last name' : null,
              ),

              // Email
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (v) => email = v,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Please enter your email';
                  if (!v.contains('@') || !v.contains('.')) return 'Enter a valid email address';
                  return null;
                },
              ),

              // Mobile
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
                onChanged: (v) => mobile = v,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Please enter your mobile number';
                  final clean = v.replaceAll(RegExp(r'\D'), '');
                  if (clean.length < 10) return 'Enter a valid 10-digit mobile number';
                  return null;
                },
              ),

              // Password
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (v) => password = v,
                validator: (v) =>
                    v == null || v.length < 6 ? 'Minimum 6 characters required' : null,
              ),

              // Confirm Password
              TextFormField(
                decoration: const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                onChanged: (v) => confirmPassword = v,
                validator: (v) =>
                    v != password ? 'Passwords do not match' : null,
              ),

              const SizedBox(height: 32),

              // Continue Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Continue / Sign Up'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      '/choose_role',
                      arguments: {
                        'first_name': firstName.trim(),
                        'last_name': lastName.trim(),
                        'email': email.trim(),
                        'phone_number': mobile.trim(),
                        'password': password.trim(),
                      },
                    );
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
