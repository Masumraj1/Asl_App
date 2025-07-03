import 'package:asl/app/view/screens/home/widgets/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
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
              page: homeController.currentPage + 1); // Load more data
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
      key: _scaffoldKey,
      appBar: CustomAppBar(
        appBarContent: "Home",
        iconData: Icons.menu,
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: SideDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Obx(() {
          if (homeController.isLoadingMore.value &&
              homeController.productList.isEmpty) {
            // TODO: replace with your shimmer loader if needed
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              // Search Field
              Expanded(
                flex: 1,
                child:    Row(
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
                        onTap: () => _openSortSheet(context),
                        child: Icon(Icons.filter_list_sharp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
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
                child: RefreshIndicator(
                  onRefresh: ()async{
                    await homeController.getProduct(page: 1);

                  },
                  child: GridView.builder(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: aspectRatio,
                    ),
                    itemCount: homeController.searchedProducts.length + 1,
                    itemBuilder: (context, index) {
                      if (index == homeController.searchedProducts.length) {
                        // Last item for loading indicator or no more items
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: homeController.isLoadingMore.value
                              ? const CircularProgressIndicator()
                              : const Text("No more photos!"),
                        );
                      }

                      var data = homeController.searchedProducts[index];
                      return InkWell(
                        onTap: (){
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
  // ────────────────── bottom‑sheet sort selector ──────────────────
  void _openSortSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.price_change),
              title: const Text('দাম: কম → বেশি'),
              onTap: () {
                homeController.sortByPriceAscending();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_rate),
              title: const Text('রেটিং: বেশি → কম'),
              onTap: () {
                homeController.sortByRatingDescending();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
