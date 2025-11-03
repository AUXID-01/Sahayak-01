import 'package:flutter/material.dart';

class ASHATasksPage extends StatelessWidget {
  final List<String> tasks = [
    "Home visit: Vaccination follow-up",
    "Fill out health survey",
    "Attend PHC briefing at 2pm",
    "Check immunization supplies",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks'), backgroundColor: Colors.teal),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.check_circle_outline, color: Colors.teal),
              title: Text(tasks[index]),
              trailing: Checkbox(
                value: false,
                onChanged: (val) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Mark as done is demo only (not saved)"),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
