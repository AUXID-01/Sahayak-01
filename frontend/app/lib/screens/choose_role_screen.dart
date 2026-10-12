import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  Future<void> registerUser(
      BuildContext context, Map<String, dynamic> userData, String role) async {
    final firstName = userData['first_name'] ?? '';
    final lastName = userData['last_name'] ?? '';
    final email = userData['email'] ?? '';
    final phoneNumber = userData['phone_number'] ?? '';
    final password = userData['password'] ?? '';

    final payload = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone_number": phoneNumber,
      "user_type": role,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registering user...')),
    );

    final result = await AuthService().registerBaseUser(payload);

    if (result['success'] == true) {
      final data = result['data'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ ${data['message'] ?? "Account created"}'),
          backgroundColor: Colors.teal,
        ),
      );

      final userId = data['user_id'];
      if (role == 'asha_worker') {
        Navigator.pushNamed(context, '/asha/personal_info',
            arguments: {"user_id": userId});
      } else if (role == 'phc_staff') {
        Navigator.pushNamed(context, '/phc/personal_info',
            arguments: {"user_id": userId});
      } else if (role == 'admin') {
        Navigator.pushNamed(context, '/admin/personal_info',
            arguments: {"user_id": userId});
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ ${result['message'] ?? "Registration failed"}'),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> userData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Optional debug print to verify correct data being passed
    print('🧩 Received userData: $userData');

    return Scaffold(
      appBar: AppBar(title: const Text('Select Your Role')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RoleCard(
              icon: Icons.local_hospital,
              label: 'ASHA Worker',
              onTap: () => registerUser(context, userData, 'asha_worker'),
            ),
            RoleCard(
              icon: Icons.people,
              label: 'PHC Staff',
              onTap: () => registerUser(context, userData, 'phc_staff'),
            ),
            RoleCard(
              icon: Icons.admin_panel_settings,
              label: 'Admin',
              onTap: () => registerUser(context, userData, 'admin'),
            ),
          ],
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: Colors.blue.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 48, color: Colors.blue),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
