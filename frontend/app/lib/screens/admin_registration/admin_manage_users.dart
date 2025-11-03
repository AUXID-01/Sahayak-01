import 'package:flutter/material.dart';

class AdminManageUsersPage extends StatelessWidget {
  final List<String> users = [
    'Seema Devi (ASHA)',
    'Dr. Kumar (PHC)',
    'Rakesh Patel (Admin)',
    // mock data
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Users'), backgroundColor: Colors.teal),
      body: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.account_circle_outlined),
          title: Text(users[index]),
          subtitle: Text(
            index == 0
                ? 'ASHA Worker'
                : index == 1
                ? 'PHC Staff'
                : 'Admin',
          ),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("User editing not implemented (demo)")),
              );
            },
          ),
        ),
      ),
    );
  }
}
