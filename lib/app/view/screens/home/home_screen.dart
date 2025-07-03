import 'package:flutter/material.dart';

import '../../common_widgets/custom_appbar/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarContent: "Home",
        iconData: Icons.arrow_back,
      ),
    );
  }
}
