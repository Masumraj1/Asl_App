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
              return _buildShimmerEffect();
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

  /// **Shimmer Effect for Loading**
  Widget _buildShimmerEffect() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 10, // Space between columns
        mainAxisSpacing: 10, // Space between rows
        childAspectRatio: 0.75, // Aspect ratio of the items
      ),
      itemCount: 10, // Dummy shimmer items
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              children: [
                Container(
                    height: 150, width: double.infinity, color: Colors.white),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 20, width: double.infinity, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
