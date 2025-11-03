import 'package:flutter/material.dart';

class ASHASchedulePage extends StatelessWidget {
  final Map<String, List<String>> schedule = {
    'Monday': ['10:00 - Home visits', '14:00 - PHC meeting'],
    'Tuesday': ['09:00 - Fieldwork', '17:00 - Report submission'],
    'Wednesday': ['11:00 - Vaccine delivery'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Schedule'), backgroundColor: Colors.teal),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: schedule.entries.map((day) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(day.key, style: TextStyle(fontWeight: FontWeight.bold)),
                  ...day.value.map(
                    (evt) => Padding(
                      padding: EdgeInsets.only(left: 12, top: 6),
                      child: Text(evt),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
