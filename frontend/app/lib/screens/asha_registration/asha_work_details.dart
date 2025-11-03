import 'package:flutter/material.dart';

class ASHAWorkDetailsPage extends StatefulWidget {
  @override
  _ASHAWorkDetailsPageState createState() => _ASHAWorkDetailsPageState();
}

class _ASHAWorkDetailsPageState extends State<ASHAWorkDetailsPage> {
  String? _selectedState;
  String? _selectedDistrict;

  final _villageController = TextEditingController();
  final _phcController = TextEditingController();
  final _areaController = TextEditingController();
  final _supervisorController = TextEditingController();

  final List<String> _states = [
    'Maharashtra',
    'Karnataka',
    'Kerala',
    'Tamil Nadu',
    'Gujarat',
  ];
  final Map<String, List<String>> _districts = {
    'Maharashtra': ['Pune', 'Mumbai', 'Nagpur'],
    'Karnataka': ['Bangalore', 'Mysore', 'Hubli'],
    'Kerala': ['Kochi', 'Trivandrum', 'Kozhikode'],
    'Tamil Nadu': ['Chennai', 'Madurai', 'Coimbatore'],
    'Gujarat': ['Ahmedabad', 'Surat', 'Vadodara'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ASHA: Work Details')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // State dropdown
            DropdownButtonFormField<String>(
              value: _selectedState,
              decoration: InputDecoration(
                labelText: 'State',
                prefixIcon: Icon(Icons.location_city_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: _states
                  .map(
                    (state) =>
                        DropdownMenuItem(value: state, child: Text(state)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedState = value;
                  _selectedDistrict = null; // reset district
                });
              },
            ),
            SizedBox(height: 20),

            // District dropdown (based on selected state)
            DropdownButtonFormField<String>(
              value: _selectedDistrict,
              decoration: InputDecoration(
                labelText: 'District',
                prefixIcon: Icon(Icons.map_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: _selectedState == null
                  ? []
                  : _districts[_selectedState]!
                        .map(
                          (district) => DropdownMenuItem(
                            value: district,
                            child: Text(district),
                          ),
                        )
                        .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDistrict = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Village input
            TextFormField(
              controller: _villageController,
              decoration: InputDecoration(
                labelText: 'Village',
                hintText: 'Enter village name',
                prefixIcon: Icon(Icons.home_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),

            // PHC Code input
            TextFormField(
              controller: _phcController,
              decoration: InputDecoration(
                labelText: 'PHC Code',
                hintText: 'Enter PHC code',
                prefixIcon: Icon(Icons.local_hospital_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Area/Ward input
            TextFormField(
              controller: _areaController,
              decoration: InputDecoration(
                labelText: 'Area / Ward Assigned',
                hintText: 'Enter assigned area or ward',
                prefixIcon: Icon(Icons.apartment_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Supervisor input
            TextFormField(
              controller: _supervisorController,
              decoration: InputDecoration(
                labelText: 'Supervisor Name / ID (Optional)',
                hintText: 'Enter supervisor name or ID',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Next button
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.arrow_forward),
                label: Text('Next'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, '/asha/training'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
