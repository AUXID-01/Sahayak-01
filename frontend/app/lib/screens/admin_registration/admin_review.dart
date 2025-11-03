import 'package:flutter/material.dart';

class AdminReviewPage extends StatelessWidget {
  final Map<String, dynamic>? adminData;

  const AdminReviewPage({super.key, this.adminData});

  @override
  Widget build(BuildContext context) {
    // Sample fallback data for demo (you can replace this with actual passed data)
    final data =
        adminData ??
        {
          'Official ID': 'ADM-1001',
          'Name': 'Arjun Mehta',
          'Contact': '+91 9876543210',
          'Department Level': 'District Level',
          'Organization': 'Health & Family Welfare',
          'Permissions': 'Moderate Access',
          'PHC Staff': 'Dr. Meera Sharma (PHC-101)',
          'ASHA Worker': 'Rekha Devi (ASHA-201)',
          'Auto-Approve': true,
          'Resources': 'Assigned primary health kits and reporting tools',
        };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Admin Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please review all details before confirming:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),

            // Review Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 24),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "${entry.key}:",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              entry.value.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Edit'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Confirm & Proceed'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/admin/dashboard');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
