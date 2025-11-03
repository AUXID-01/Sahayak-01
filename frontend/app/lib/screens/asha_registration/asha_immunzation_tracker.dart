import 'package:flutter/material.dart';

class ASHAImmunizationTrackerPage extends StatelessWidget {
  final List<Map<String, String>> people = [
    {'name': 'Akash', 'vaccine': 'BCG', 'due': 'Oct 27'},
    {'name': 'Priya', 'vaccine': 'Polio', 'due': 'Nov 2'},
    {'name': 'Rahul', 'vaccine': 'DPT', 'due': 'Nov 4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Immunization Tracker'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: people.length,
        itemBuilder: (context, index) {
          final entry = people[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.vaccines_outlined, color: Colors.teal),
              title: Text('${entry['name']} – ${entry['vaccine']}'),
              subtitle: Text('Due: ${entry['due']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Marked as vaccinated (demo)")),
                  );
                },
                child: Text('Done'),
              ),
            ),
          );
        },
      ),
    );
  }
}
