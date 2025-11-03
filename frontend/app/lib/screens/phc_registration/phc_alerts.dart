import 'package:flutter/material.dart';

class PHCAlertsPage extends StatelessWidget {
  final List<String> alerts = [
    'Low vaccine inventory',
    'Upcoming health camp tomorrow',
    'Immunization task overdue!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alerts'), backgroundColor: Colors.teal),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: alerts.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.notifications_active, color: Colors.orange),
          title: Text(alerts[index]),
        ),
      ),
    );
  }
}
