import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminPersonalInfoPage extends StatefulWidget {
  const AdminPersonalInfoPage({super.key});

  @override
  _AdminPersonalInfoPageState createState() => _AdminPersonalInfoPageState();
}

class _AdminPersonalInfoPageState extends State<AdminPersonalInfoPage> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin: Personal Info')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Official ID field
            TextFormField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: 'Official ID',
                hintText: 'Enter your official ID',
                prefixIcon: Icon(Icons.badge_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Name field
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Contact number field
            TextFormField(
              controller: _contactController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10), // limit to 10 digits
              ],
              decoration: InputDecoration(
                labelText: 'Contact Number',
                hintText: 'Enter your mobile number',
                prefixIcon: Icon(Icons.phone_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Next button
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.arrow_forward),
                label: Text('Next'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
                  final userId = args?['user_id'] ?? '';

                  Navigator.pushNamed(
                    context,
                    '/admin/department',
                    arguments: {
                      'user_id': userId,
                      'personal': {
                        'id': _idController.text.trim(),
                        'name': _nameController.text.trim(),
                        'contact': _contactController.text.trim(),
                      },
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
