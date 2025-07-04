import 'package:asl/app/view/common_widgets/custom_text_field/custom_text_field.dart';
import 'package:asl/app/view/screens/home/widgets/sort_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../controller/home_controller.dart';

class SearchFilterSection extends StatelessWidget {
  const SearchFilterSection({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //===================+Search Section============
        Expanded(
          flex: 8,
          child: CustomTextField(
            onChanged: homeController.filterProductByName,
            // fillColor: AppColors.gray,
            fieldBorderColor: AppColors.gray,
            hintText: "Search",
            prefixIcon: const Icon(Icons.search),
            inputTextStyle: const TextStyle(color: Colors.black),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => SortSheet.show(context, homeController),
            child: const Icon(Icons.filter_list_sharp),
          ),
        ),
      ],
    );
  }
}