import 'package:flutter/material.dart';

class PHCPatientRegistryPage extends StatelessWidget {
  final List<Map<String, String>> patients = [
    {'name': 'Sunita Devi', 'age': '28', 'status': 'Active'},
    {'name': 'Ravi Kumar', 'age': '35', 'status': 'Inactive'},
    {'name': 'Priya Verma', 'age': '4', 'status': 'Child Care'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Registry'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final p = patients[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(p['name']!),
              subtitle: Text('Age: ${p['age']} - ${p['status']}'),
            ),
          );
        },
      ),
    );
  }
}
