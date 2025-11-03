import 'package:flutter/material.dart';

class ASHAReportsPage extends StatelessWidget {
  final Map<String, String> stats = {
    'Home visits': '18',
    'Vaccinations': '12',
    'Alerts handled': '5',
    'Reports submitted': '6',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: stats.entries
              .map(
                (e) => Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.insert_chart_outlined,
                      color: Colors.cyan,
                    ),
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
