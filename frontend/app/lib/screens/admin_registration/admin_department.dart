import 'package:flutter/material.dart';

class AdminDepartmentPage extends StatefulWidget {
  @override
  _AdminDepartmentPageState createState() => _AdminDepartmentPageState();
}

class _AdminDepartmentPageState extends State<AdminDepartmentPage> {
  final _formKey = GlobalKey<FormState>();
  final _orgController = TextEditingController();
  String? _selectedRegion;
  String? _selectedPermission;

  final List<String> _regions = [
    'State Level',
    'District Level',
    'Zone Level',
    'Block Level',
  ];

  final List<String> _permissions = [
    'Full Access',
    'Moderate Access',
    'Limited Access',
    'View Only',
  ];

  @override
  void dispose() {
    _orgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin: Department Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Administrative Level Dropdown
              DropdownButtonFormField<String>(
                decoration:InputDecoration(
                  labelText: 'Administrative Level',
                  hintText: 'Select level (State, District, etc.)',
                  prefixIcon: Icon(Icons.map_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: _selectedRegion,
                items: _regions
                    .map(
                      (region) =>
                          DropdownMenuItem(value: region, child: Text(region)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRegion = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a level' : null,
              ),
              const SizedBox(height: 20),

              // Organization Text Field
              TextFormField(
                controller: _orgController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Organization / Department Name',
                  hintText: 'e.g., Health Department',
                  prefixIcon: Icon(Icons.apartment),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter the organization name'
                    : null,
              ),
              const SizedBox(height: 20),

              // Permission Level Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Admin Permission Level',
                  hintText: 'Choose permission type',
                  prefixIcon: Icon(Icons.admin_panel_settings),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: _selectedPermission,
                items: _permissions
                    .map(
                      (level) =>
                          DropdownMenuItem(value: level, child: Text(level)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPermission = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a permission level' : null,
              ),
              const SizedBox(height: 40),

              // Submit Button
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
                      Navigator.pushNamed(context, '/admin/assign_staff');
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
