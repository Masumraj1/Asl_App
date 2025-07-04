import 'package:asl/app/view/screens/home/drawer/side_drawer.dart';
import 'package:asl/app/view/screens/home/widgets/sort_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/enums/status.dart';
import '../../../core/routes/route_path.dart';
import '../../common_widgets/custom_appbar/custom_appbar.dart';
import '../../common_widgets/custom_product_card/custom_product_card.dart';
import '../../common_widgets/custom_text_field/custom_text_field.dart';
import '../../common_widgets/empty_item/empty_item.dart';
import '../../common_widgets/error_widget/error_widgets.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController homeController = Get.find<HomeController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        if (homeController.hasMoreData && !homeController.isLoadingMore.value) {
          homeController.getProduct(page: homeController.currentPage + 1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final aspectRatio = screenWidth / (screenWidth * 1.8);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      //================Home Appbar=============
      appBar: CustomAppBar(
        appBarContent: "Home",
        iconData: Icons.menu,
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      //=============Drawer===========
      drawer: const SideDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Obx(() {
          final status = homeController.rxRequestStatus.value;

          if (status == Status.loading && homeController.productList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (status == Status.error) {
            return Center(
              child: ErrorScreen(homeController: homeController),
            );
          }

          if (homeController.searchedProducts.isEmpty) {
            return EmptyItem();
          }

          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: CustomTextField(
                      onChanged: homeController.filterProductByName,
                      fillColor: AppColors.gray,
                      fieldBorderColor: AppColors.white,
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      inputTextStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () => SortSheet.show(context, homeController)
                      ,
                      child: const Icon(Icons.filter_list_sharp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Total items: ${homeController.searchedProducts.length}",
                  style: TextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.gray,
                  onRefresh: () => homeController.getProduct(page: 1),
                  child: GridView.builder(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: aspectRatio,
                    ),
                    itemCount: homeController.searchedProducts.length +
                        (homeController.hasMoreData ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == homeController.searchedProducts.length) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      final data = homeController.searchedProducts[index];
                      return InkWell(
                        onTap: () {
                          context.pushNamed(
                            RoutePath.detailsScreen,
                            extra: {
                              'imageUrl': data.images.first,
                              'title': data.title,
                              'currentPrice': data.price.toString(),
                              'originalPrice': "30",
                              'discount': data.discountPercentage.toString(),
                            },
                          );
                        },
                        child: CustomProductCard(
                          imageUrl: data.images.first,
                          title: data.title,
                          currentPrice: data.price.toString(),
                          originalPrice: "30",
                          discount: data.discountPercentage.toString(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }


}




