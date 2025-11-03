import 'package:flutter/material.dart';

class ASHAProfilePage extends StatelessWidget {
  // Demo data; in real use, pass a user object or fetch dynamically
  final String name = "Seema Devi";
  final String aadhaar = "1234-5678-9012";
  final String gender = "Female";
  final String dob = "12/09/1988";
  final String state = "Uttar Pradesh";
  final String district = "Aligarh";
  final String village = "Chanda";
  final String phcCode = "PHC001";
  final String supervisor = "Dr. Kumar";
  final String yearsServed = "5";
  final String lastTraining = "Feb 2024";
  final String areaWard = "Ward 7";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASHA Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit profile or open edit dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Edit Profile (not implemented)")),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile avatar
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.blue.shade200,
                child: Icon(Icons.person, size: 54, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Divider(height: 32),
              buildProfileRow("Aadhaar / ID:", aadhaar),
              buildProfileRow("Gender:", gender),
              buildProfileRow("DOB:", dob),
              buildProfileRow("State:", state),
              buildProfileRow("District:", district),
              buildProfileRow("Village:", village),
              buildProfileRow("PHC Code:", phcCode),
              buildProfileRow("Supervisor:", supervisor),
              buildProfileRow("Area/Ward Assigned:", areaWard),
              buildProfileRow("Years Served:", yearsServed),
              buildProfileRow("Last Training:", lastTraining),
              SizedBox(height: 24),
              ElevatedButton.icon(
                icon: Icon(Icons.logout),
                label: Text('Logout'),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/signin',
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileRow(String label, String value) => Padding(
    padding: EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 130,
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(child: Text(value)),
      ],
    ),
  );
}
