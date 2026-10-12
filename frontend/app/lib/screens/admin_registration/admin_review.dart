import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class AdminReviewPage extends StatelessWidget {
  final Map<String, dynamic>? adminData;

  const AdminReviewPage({super.key, this.adminData});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final userId = args?['user_id'];
    final personal = args?['personal'] as Map<String, dynamic>? ?? {};
    final department = args?['department'] as Map<String, dynamic>? ?? {};
    final staff = args?['staff'] as Map<String, dynamic>? ?? {};

    // Dynamic data with fallback
    final data =
        adminData ??
        {
          'Official ID': personal['id'] ?? 'ADM-1001',
          'Name': personal['name'] ?? 'Admin User',
          'Contact': personal['contact'] ?? '+91 9876543210',
          'Department Level': department['region'] ?? 'District Level',
          'Organization': department['organization'] ?? 'Health & Family Welfare',
          'Permissions': department['permission'] ?? 'Moderate Access',
          'PHC Staff': staff['phcStaff'] ?? 'Dr. Meera Sharma (PHC-101)',
          'ASHA Worker': staff['ashaWorker'] ?? 'Rekha Devi (ASHA-201)',
          'Auto-Approve': staff['autoApprove'] ?? true,
          'Resources': staff['resources'] ?? 'Assigned primary health kits and reporting tools',
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
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    if (userId != null && userId.toString().isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Saving Administrator details...')),
                      );

                      final payload = {
                        'user_id': userId,
                        'roles': ['regionaladmin'],
                        'permissions': [department['permission'] ?? 'Moderate Access'],
                        'regions_managed': [department['region'] ?? 'District Level'],
                      };

                      await AuthService().registerAdminDetails(payload);
                    }

                    Navigator.pushReplacementNamed(context, '/admin/dashboard');
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
