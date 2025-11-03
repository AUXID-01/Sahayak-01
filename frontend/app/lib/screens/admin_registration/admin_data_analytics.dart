import 'package:flutter/material.dart';

class AdminAnalyticsPage extends StatelessWidget {
  final Map<String, String> analytics = {
    'Active Visits Today': '72',
    'Pending Reports': '31',
    'Vaccines Administered': '220',
    'Alerts Raised': '8',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Analytics'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: analytics.entries
            .map(
              (e) => Card(
                child: ListTile(
                  leading: Icon(Icons.analytics, color: Colors.deepPurple),
                  title: Text(e.key),
                  trailing: Text(e.value),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
