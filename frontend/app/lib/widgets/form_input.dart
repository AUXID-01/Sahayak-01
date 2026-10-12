import 'package:flutter/material.dart';

class FormInputWrapper extends StatelessWidget {
  final String label;
  final Widget child;
  final String? helperText;

  const FormInputWrapper({
    super.key,
    required this.label,
    required this.child,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          child,
          if (helperText != null) ...[
            const SizedBox(height: 4),
            Text(
              helperText!,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ],
      ),
    );
  }
}
