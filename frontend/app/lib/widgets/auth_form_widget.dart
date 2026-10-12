import 'package:flutter/material.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const AuthHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.local_hospital_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 48, color: Colors.teal),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
