
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/controller/auth_controller.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(''),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {

              Get.find<AuthController>().signOut();

            },
          ),
        ],
      ),
    );
  }
}
