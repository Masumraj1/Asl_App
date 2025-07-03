import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/enums/status.dart';
import '../../../../services/api_check.dart';
import '../../../../services/api_client.dart';
import '../../../../services/app_url.dart';
import '../model/product_model.dart';

class HomeController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  int currentPage = 1;
  final int itemsPerPage = 20;
  var isLoadingMore = false.obs;
  bool hasMoreData = true;

  RxList<ProductList> productList = <ProductList>[].obs;
  RxList<ProductList> searchedProducts = <ProductList>[].obs;
  TextEditingController searchController = TextEditingController();

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  //======================Get Products==================
  Future<void> getProduct({int page = 1}) async {
    if (isLoadingMore.value) return; // Prevent multiple simultaneous calls
    isLoadingMore.value = true;
    setRxRequestStatus(Status.loading);

    try {
      var response = await ApiClient.getData(
        '${ApiUrl.products}?page=$page&limit=$itemsPerPage',
      );

      if (response.statusCode == 200) {
        if (response.body['products'] != null) {
          List<ProductList> fetchedProducts = List<ProductList>.from(
            response.body['products'].map((x) => ProductList.fromJson(x)),
          );

          if (page == 1) {
            productList.value = fetchedProducts;
          } else {
            productList.addAll(fetchedProducts);
          }

          searchedProducts.value = List<ProductList>.from(productList);
          setRxRequestStatus(Status.completed);
          currentPage = page;

          if (fetchedProducts.length < itemsPerPage) {
            hasMoreData = false;
          }
        } else {
          setRxRequestStatus(Status.error);
          hasMoreData = false;
        }
      } else {
        setRxRequestStatus(Status.error);
        ApiChecker.checkApi(response);
        hasMoreData = false;
      }
    } catch (e) {
      debugPrint("Error: $e");
      setRxRequestStatus(Status.error);
      hasMoreData = false;
    } finally {
      isLoadingMore.value = false;
    }
  }

  //======================Search==================
  void filterProductByName(String query) {
    if (query.isEmpty) {
      searchedProducts.value = List<ProductList>.from(productList);
    } else {
      searchedProducts.value = productList
          .where((product) =>
          product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  // ──────────────── Sort Helpers ────────────────

  void sortByPriceAscending() {
    searchedProducts.sort((a, b) => a.price.compareTo(b.price));
    searchedProducts.refresh();
  }

  void sortByRatingDescending() {
    searchedProducts.sort((a, b) => b.rating.compareTo(a.rating));
    searchedProducts.refresh();
  }

  @override
  void onInit() {
    getProduct(page: 1);
    super.onInit();
  }
}
