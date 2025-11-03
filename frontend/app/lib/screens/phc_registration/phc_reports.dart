import 'package:flutter/material.dart';

class PHCReportsPage extends StatelessWidget {
  final Map<String, String> stats = {
    'Reports submitted': '23',
    'Active campaigns': '2',
    'Missing data alerts': '4',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports'), backgroundColor: Colors.teal),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: stats.entries
              .map(
                (e) => Card(
                  child: ListTile(
                    leading: Icon(Icons.insert_chart, color: Colors.deepPurple),
                    title: Text(e.key),
                    trailing: Text(e.value),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
