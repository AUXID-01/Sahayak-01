import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/validators.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();
  String email = '', password = '';
  bool _isLoading = false;

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final result = await _authService.login(email, password);

      if (result['success'] == true) {
        final data = result['data'];
        final user = data['user'];
        final userType = user?['user_type'] ?? user?['role'];
        final userId = user?['user_id'] ?? user?['id'];

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ ${data['message'] ?? "Login successful"}'),
            backgroundColor: Colors.teal,
          ),
        );

        // Navigate directly to the respective dashboard
        if (userType == 'asha_worker') {
          Navigator.pushReplacementNamed(
            context,
            '/asha/dashboard',
            arguments: {"user_id": userId, "user": user},
          );
        } else if (userType == 'phc_staff') {
          Navigator.pushReplacementNamed(
            context,
            '/phc/dashboard',
            arguments: {"user_id": userId, "user": user},
          );
        } else if (userType == 'admin') {
          Navigator.pushReplacementNamed(
            context,
            '/admin/dashboard',
            arguments: {"user_id": userId, "user": user},
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('⚠️ Unknown user type: $userType')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ ${result['message'] ?? "Login failed"}'),
            backgroundColor: Colors.red.shade700,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: AppValidators.email,
                onChanged: (val) => email = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: AppValidators.password,
                onChanged: (val) => password = val,
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _signIn,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: const Text('Sign In'),
                    ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
