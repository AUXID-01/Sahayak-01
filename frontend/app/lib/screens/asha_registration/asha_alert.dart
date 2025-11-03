import 'package:flutter/material.dart';

class ASHAAlertsPage extends StatelessWidget {
  final List<Map<String, String>> alerts = [
    {'alert': 'Measles vaccination campaign starts tomorrow!', 'time': 'Today'},
    {'alert': 'New supplies will arrive by Friday.', 'time': 'Yesterday'},
    {'alert': 'Patient in Ward 7 requests home visit.', 'time': '2 days ago'},
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
          leading: Icon(
            Icons.notifications_active_outlined,
            color: Colors.orange,
          ),
          title: Text(alerts[index]['alert']!),
          subtitle: Text(alerts[index]['time']!),
        ),
      ),
    );
  }
}
