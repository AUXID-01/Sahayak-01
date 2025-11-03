import 'package:flutter/material.dart';

class AdminResourceAllocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resource Allocation'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.medical_services, color: Colors.green),
              title: Text('Vaccine doses'),
              trailing: Text('Available: 240'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.folder_shared, color: Colors.blue),
              title: Text('PHC Kits'),
              trailing: Text('Assigned: 45'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home_repair_service, color: Colors.orange),
              title: Text('Field Supplies'),
              trailing: Text('Need restock'),
            ),
          ],
        ),
      ),
    );
  }
}
