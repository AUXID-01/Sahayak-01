import 'package:flutter/material.dart';

class PHCCampaignSchedulesPage extends StatelessWidget {
  final List<Map<String, String>> campaigns = [
    {'name': 'Polio Drive', 'date': '5 Nov 2025'},
    {'name': 'Malaria Testing', 'date': '14 Nov 2025'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campaign Schedules'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: campaigns.length,
        itemBuilder: (context, index) {
          final c = campaigns[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.event_note),
              title: Text(c['name']!),
              subtitle: Text('Date: ${c['date']}'),
            ),
          );
        },
      ),
    );
  }
}
