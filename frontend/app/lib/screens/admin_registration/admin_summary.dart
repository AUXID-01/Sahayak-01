import 'package:flutter/material.dart';

class AdminSystemSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('System Summary'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overview:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('- 250 Active users'),
            Text('- 45 PHCs onboarded'),
            Text('- 1,200 Immunizations tracked'),
            Text('- System health: OK'),
          ],
        ),
      ),
    );
  }
}
