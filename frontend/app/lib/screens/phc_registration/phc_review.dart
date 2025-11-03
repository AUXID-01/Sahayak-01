import 'package:flutter/material.dart';

class PHCReviewPage extends StatelessWidget {
  const PHCReviewPage({Key? key}) : super(key: key);

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
    // Demo Data Here
    final Map<String, dynamic> phcData = {
      'id': 'DEMO123',
      'gender': 'Female',
      'dob': '11/11/1980',
      'state': 'Demo State',
      'district': 'Demo District',
      'village': 'Demo Village',
      'phcName': 'Demo PHC',
      'role': 'Nurse',
      'qualification': 'BSc Nursing',
      'joinDate': '10/10/2010',
      'experience': '12',
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
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/phc/dashboard');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
