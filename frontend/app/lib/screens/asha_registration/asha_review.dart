import 'package:flutter/material.dart';

class ASHAReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve data passed from previous pages
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // fallback for testing (in case no args yet)
    final personal =
        args?['personal'] ??
        {'id': '1234-5678-9012', 'gender': 'Female', 'dob': '15/08/1990'};
    final work =
        args?['work'] ??
        {
          'state': 'Maharashtra',
          'district': 'Pune',
          'village': 'Kothrud',
          'phc': 'PHC-045',
          'area': 'Ward 12',
          'supervisor': 'Dr. Mehta',
        };
    final training =
        args?['training'] ?? {'years': '5', 'lastTraining': '12/03/2024'};

    return Scaffold(
      appBar: AppBar(title: Text('Review Details')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- PERSONAL INFO ---
            Text(
              'Personal Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Aadhaar/ID', personal['id']),
                    _buildInfoRow('Gender', personal['gender']),
                    _buildInfoRow('Date of Birth', personal['dob']),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // --- WORK DETAILS ---
            Text(
              'Work Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('State', work['state']),
                    _buildInfoRow('District', work['district']),
                    _buildInfoRow('Village', work['village']),
                    _buildInfoRow('PHC Code', work['phc']),
                    _buildInfoRow('Area/Ward', work['area']),
                    _buildInfoRow('Supervisor', work['supervisor']),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // --- TRAINING DETAILS ---
            Text(
              'Training Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Years Served', training['years']),
                    _buildInfoRow(
                      'Last Training Date',
                      training['lastTraining'],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.check_circle_outline),
                label: Text('Confirm & Proceed'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/asha/dashboard');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // helper widget for neat label-value display
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$label:', style: TextStyle(fontWeight: FontWeight.w600)),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}
