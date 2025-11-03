import 'package:flutter/material.dart';

class PHCInventoryAlertsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Alerts'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.medical_services_outlined, color: Colors.red),
              title: Text('Vaccine doses'),
              trailing: Text('Low: 32 left'),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.local_pharmacy_outlined,
                color: Colors.orange,
              ),
              title: Text('PHC Kits'),
              trailing: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
