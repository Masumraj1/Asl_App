import 'package:asl/app/view/screens/home/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/route_path.dart';
import '../../../core/routes/routes.dart';
import '../../common_widgets/custom_appbar/custom_appbar.dart';
import '../../common_widgets/custom_product_card/custom_product_card.dart';
import '../../common_widgets/custom_text_field/custom_text_field.dart';
import 'controller/build_grid_loader.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

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
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (homeController.hasMoreData && !homeController.isLoadingMore.value) {
          homeController.getProduct(
              page: homeController.currentPage +
                  1); // Load more data when bottom is reached
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double aspectRatio = screenWidth / (screenWidth * 2.0);
    return Scaffold(
      backgroundColor: AppColors.white,
      key: _scaffoldKey, // Assign the key here
      appBar: CustomAppBar(
        appBarContent: "Home",
        iconData: Icons.menu,
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer(); // Open drawer using key
        },
      ),
      drawer: SideDrawer(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Obx(() {
            if (homeController.isLoadingMore.value &&
                homeController.productList.isEmpty) {
              return ShimmerGridLoader();
            }
            return Column(
              children: [
                //===================>>>>>Search Field<<<<<===========
                Expanded(
                  flex: 1,
                  child: CustomTextField(
                    onTap: () {
                      // AppRouter.route.pushNamed(RoutePath.searchScreen);
                    },
                    readOnly: true,
                    fillColor: AppColors.white,
                    fieldBorderColor: AppColors.gray,
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                // Total items count
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Total items: ${homeController.searchedProducts.length}",
                    style:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 24.h),
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          controller: _scrollController,
                          // Attach scroll controller
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h,
                                childAspectRatio: aspectRatio,

                              ),
                          itemCount: homeController.searchedProducts.length + 1,
                          // Add one for the loading indicator
                          itemBuilder: (context, index) {
                            if (index ==
                                homeController.searchedProducts.length) {
                              return homeController.isLoadingMore.value
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : const Center(
                                      child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text("No more photos!")),
                                    ));
                            }

                            var data = homeController.searchedProducts[index];
                            return CustomProductCard(
                              imageUrl: data.images.first,
                              title: data.title,
                              currentPrice: data.price.toString(),
                              originalPrice: "30",
                              discount: data.discountPercentage.toString(),
                              rating: data.rating,
                              reviewsCount: 41,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          })),
    );
  }

}
