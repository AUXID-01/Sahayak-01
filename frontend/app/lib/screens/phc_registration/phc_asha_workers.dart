import 'package:flutter/material.dart';

class PHCAshaWorkersPage extends StatelessWidget {
  final List<Map<String, String>> ashaWorkers = [
    {'name': 'Aarti Sharma', 'area': 'Ward 1'},
    {'name': 'Pramod Rani', 'area': 'Village Center'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ASHA Workers'), backgroundColor: Colors.teal),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: ashaWorkers.length,
        itemBuilder: (context, index) {
          final w = ashaWorkers[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.local_hospital_outlined),
              title: Text(w['name']!),
              subtitle: Text('Area: ${w['area']}'),
            ),
          );
        },
      ),
    );
  }
}
