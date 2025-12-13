import 'package:flutter/material.dart';
import 'package:shrine/admin/admin_products.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.print),
            title: const Text("Manage Printers"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminProductsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Manage Users"),
            onTap: () {
              // add later
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt),
            title: const Text("View Orders"),
            onTap: () {
              // add later
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
