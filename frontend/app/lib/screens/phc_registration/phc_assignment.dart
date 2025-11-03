import 'package:flutter/material.dart';

class PHCAssignmentPage extends StatefulWidget {
  @override
  _PHCAssignmentPageState createState() => _PHCAssignmentPageState();
}

class _PHCAssignmentPageState extends State<PHCAssignmentPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedState;
  String? _selectedDistrict;
  String? _selectedVillage;
  final _phcController = TextEditingController();
  final _roleController = TextEditingController();

  final List<String> _states = ['Maharashtra', 'Karnataka', 'Tamil Nadu'];
  final Map<String, List<String>> _districts = {
    'Maharashtra': ['Pune', 'Mumbai', 'Nagpur'],
    'Karnataka': ['Bengaluru', 'Mysuru', 'Mangaluru'],
    'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai'],
  };
  final Map<String, List<String>> _villages = {
    'Pune': ['Kothrud', 'Hinjewadi', 'Shivajinagar'],
    'Mumbai': ['Andheri', 'Bandra', 'Dadar'],
    'Nagpur': ['Sitabuldi', 'Civil Lines', 'Mahal'],
    'Bengaluru': ['Whitefield', 'Indiranagar', 'Jayanagar'],
    'Mysuru': ['Vijayanagar', 'Chamundi', 'Hebbal'],
    'Mangaluru': ['Bolar', 'Kadri', 'Bejai'],
    'Chennai': ['T. Nagar', 'Velachery', 'Adyar'],
    'Coimbatore': ['RS Puram', 'Gandhipuram', 'Peelamedu'],
    'Madurai': ['Simmakkal', 'Thirupparankundram', 'Anna Nagar'],
  };

  @override
  void dispose() {
    _phcController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PHC Assignment'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // State Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'State',
                  prefixIcon: Icon(Icons.map_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: _selectedState,
                items: _states
                    .map(
                      (state) =>
                          DropdownMenuItem(value: state, child: Text(state)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedState = value;
                    _selectedDistrict = null;
                    _selectedVillage = null;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a state' : null,
              ),
              const SizedBox(height: 16),

              // District Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'District',
                  prefixIcon: Icon(Icons.location_city_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: _selectedDistrict,
                items:
                    (_selectedState != null
                            ? _districts[_selectedState]!
                            : <String>[])
                        .map(
                          (district) => DropdownMenuItem<String>(
                            value: district,
                            child: Text(district),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDistrict = value;
                    _selectedVillage = null;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a district' : null,
              ),
              const SizedBox(height: 16),

              // Village Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Village',
                  prefixIcon: Icon(Icons.home_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: _selectedVillage,
                items:
                    (_selectedDistrict != null
                            ? _villages[_selectedDistrict]!
                            : <String>[])
                        .map(
                          (village) => DropdownMenuItem<String>(
                            value: village,
                            child: Text(village),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedVillage = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a village' : null,
              ),
              const SizedBox(height: 16),

              // PHC Name / Code
              TextFormField(
                controller: _phcController,
                decoration:InputDecoration(
                  labelText: 'PHC Name / Code',
                  prefixIcon: Icon(Icons.local_hospital_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter PHC Name/Code'
                    : null,
              ),
              const SizedBox(height: 16),

              // Role in PHC
              TextFormField(
                controller: _roleController,
                decoration: InputDecoration(
                  labelText: 'Role in PHC',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter your role' : null,
              ),
              const SizedBox(height: 32),

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
                      Navigator.pushNamed(context, '/phc/assign_workers');
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
