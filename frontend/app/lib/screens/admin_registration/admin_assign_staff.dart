import 'package:flutter/material.dart';

class AdminAssignStaffPage extends StatefulWidget {
  const AdminAssignStaffPage({super.key});

  @override
  _AdminAssignStaffPageState createState() => _AdminAssignStaffPageState();
}

class _AdminAssignStaffPageState extends State<AdminAssignStaffPage> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedPhcStaff;
  String? _selectedAshaWorker;
  bool _autoApprove = false;
  final _resourcesController = TextEditingController();

  final List<String> _phcStaffList = [
    'Dr. Meera Sharma (PHC-101)',
    'Nurse Ramesh Patel (PHC-102)',
    'Dr. Anjali Rao (PHC-103)',
  ];

  final List<String> _ashaWorkerList = [
    'Rekha Devi (ASHA-201)',
    'Suman Kumari (ASHA-202)',
    'Kavita Singh (ASHA-203)',
  ];

  @override
  void dispose() {
    _resourcesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign PHC Staff / ASHA Workers'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Link or approve PHC staff and ASHA workers',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),

              // PHC Staff Dropdown
              DropdownButtonFormField<String>(
                initialValue: _selectedPhcStaff,
                decoration: InputDecoration(
                  labelText: 'Select PHC Staff',
                  prefixIcon: Icon(Icons.local_hospital_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: _phcStaffList
                    .map(
                      (staff) =>
                          DropdownMenuItem(value: staff, child: Text(staff)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPhcStaff = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a PHC staff' : null,
              ),
              const SizedBox(height: 20),

              // ASHA Worker Dropdown
              DropdownButtonFormField<String>(
                initialValue: _selectedAshaWorker,
                decoration: InputDecoration(
                  labelText: 'Select ASHA Worker',
                  prefixIcon: Icon(Icons.woman_2_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: _ashaWorkerList
                    .map(
                      (asha) =>
                          DropdownMenuItem(value: asha, child: Text(asha)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedAshaWorker = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select an ASHA worker' : null,
              ),
              const SizedBox(height: 20),

              // Auto Approve Switch
              SwitchListTile(
                title: const Text('Auto-Approve Assignment'),
                subtitle: const Text(
                  'Enable this to automatically approve links',
                ),
                value: _autoApprove,
                onChanged: (val) {
                  setState(() {
                    _autoApprove = val;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Resource Allocation Input
              TextFormField(
                controller: _resourcesController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Resource Allocation Notes',
                  hintText: 'e.g., Assign kits, transport budget, or schedules',
                  prefixIcon: Icon(Icons.inventory_2_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text('Next', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
                      final userId = args?['user_id'] ?? '';
                      final personal = args?['personal'] ?? {};
                      final department = args?['department'] ?? {};

                      Navigator.pushNamed(
                        context,
                        '/admin/review',
                        arguments: {
                          'user_id': userId,
                          'personal': personal,
                          'department': department,
                          'staff': {
                            'phcStaff': _selectedPhcStaff ?? '',
                            'ashaWorker': _selectedAshaWorker ?? '',
                            'autoApprove': _autoApprove,
                            'resources': _resourcesController.text.trim(),
                          },
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
