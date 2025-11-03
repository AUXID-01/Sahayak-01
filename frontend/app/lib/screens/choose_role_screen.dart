import 'package:flutter/material.dart';
import '../widgets/role_card.dart';

class ChooseRoleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Your Role')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: RoleCard(
                icon: Icons.local_hospital,
                label: "ASHA Worker",
                onTap: () =>
                    Navigator.pushNamed(context, '/asha/personal_info'),
              ),
            ),
            Expanded(
              child: RoleCard(
                icon: Icons.people,
                label: "PHC Staff",
                onTap: () => Navigator.pushNamed(context, '/phc/personal_info'),
              ),
            ),
            Expanded(
              child: RoleCard(
                icon: Icons.admin_panel_settings,
                label: "Admin",
                onTap: () =>
                    Navigator.pushNamed(context, '/admin/personal_info'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
