import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_appbar/custom_appbar.dart';
import '../authentication/controller/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key here
      appBar: CustomAppBar(
        appBarContent: "Home",
        iconData: Icons.menu,
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer(); // Open drawer using key
        },
      ),
      drawer: Drawer(
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
      ),
      body: const Center(child: Text("Home Screen Content")),
    );
  }
}
