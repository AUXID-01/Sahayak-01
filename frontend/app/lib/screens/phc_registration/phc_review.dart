import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class PHCReviewPage extends StatelessWidget {
  const PHCReviewPage({super.key});

  Widget _buildReviewItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final userId = args?['user_id'];
    final personal = args?['personal'] as Map<String, dynamic>? ?? {};
    final assignment = args?['assignment'] as Map<String, dynamic>? ?? {};
    final professional = args?['professional'] as Map<String, dynamic>? ?? {};

    // Dynamic data with fallback
    final Map<String, dynamic> phcData = {
      'id': personal['id'] ?? 'DEMO123',
      'gender': personal['gender'] ?? 'Female',
      'dob': personal['dob'] ?? '11/11/1985',
      'state': assignment['state'] ?? 'Maharashtra',
      'district': assignment['district'] ?? 'Pune',
      'village': assignment['village'] ?? 'Kothrud',
      'phcName': assignment['phcName'] ?? 'PHC-001',
      'role': assignment['role'] ?? 'Medical Officer',
      'qualification': professional['qualification'] ?? 'MBBS / Nursing',
      'joinDate': professional['joinDate'] ?? '10/10/2020',
      'experience': professional['experience'] ?? '5',
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Review Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PHC Staff Review',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Personal Info',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Divider(),
            _buildReviewItem('Aadhaar / ID', phcData['id'] ?? ''),
            _buildReviewItem('Gender', phcData['gender'] ?? ''),
            _buildReviewItem('Date of Birth', phcData['dob'] ?? ''),
            const SizedBox(height: 16),
            const Text(
              'Assignment Info',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Divider(),
            _buildReviewItem('State', phcData['state'] ?? ''),
            _buildReviewItem('District', phcData['district'] ?? ''),
            _buildReviewItem('Village', phcData['village'] ?? ''),
            _buildReviewItem('PHC Name/Code', phcData['phcName'] ?? ''),
            _buildReviewItem('Role in PHC', phcData['role'] ?? ''),
            const SizedBox(height: 16),
            const Text(
              'Professional Info',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Divider(),
            _buildReviewItem('Qualification', phcData['qualification'] ?? ''),
            _buildReviewItem('Join Date', phcData['joinDate'] ?? ''),
            _buildReviewItem('Experience (years)', phcData['experience'] ?? ''),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle_outline),
                label: const Text(
                  'Confirm & Proceed',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  if (userId != null && userId.toString().isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Saving PHC staff details...')),
                    );

                    final payload = {
                      'user_id': userId,
                      'date_of_birth': phcData['dob'] ?? '01/01/1985',
                      'gender': phcData['gender'] ?? 'Female',
                      'address': {
                        'state': phcData['state'] ?? '',
                        'district': phcData['district'] ?? '',
                        'village': phcData['village'] ?? '',
                      },
                      'training_completed': [phcData['qualification'] ?? 'Medical Staff'],
                      'permissions': ['Patient Registry', 'Inventory Alerts', 'ASHA Coordination'],
                    };

                    await AuthService().registerPhcDetails(payload);
                  }

                  Navigator.pushReplacementNamed(context, '/phc/dashboard');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
