import 'package:flutter/material.dart';

class AdminBroadcastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Broadcast'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Broadcast message',
                hintText: 'Type your announcement...',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.campaign),
              label: Text('Send Broadcast'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Broadcast sent (demo)")),
                );
                controller.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
