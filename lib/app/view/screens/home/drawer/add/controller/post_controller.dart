import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/post.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;

  final String _storageKey = 'posts_list';

  @override
  void onInit() {
    super.onInit();
    loadPostsFromStorage();
  }

  void addPost(Post post) {
    posts.add(post);
    savePostsToStorage(); // Save after adding
  }

  void updatePost(String id, String title, String body) {
    int index = posts.indexWhere((p) => p.id == id);
    if (index != -1) {
      posts[index] = Post(id: id, title: title, body: body);
      posts.refresh();
      savePostsToStorage(); // Save after update
    }
  }

  Future<void> savePostsToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    // Convert posts list to JSON string
    List<Map<String, dynamic>> postListMap = posts.map((post) => post.toJson()).toList();
    String encodedData = jsonEncode(postListMap);
    await prefs.setString(_storageKey, encodedData);
  }

  Future<void> loadPostsFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    String? encodedData = prefs.getString(_storageKey);
    if (encodedData != null) {
      List<dynamic> decodedList = jsonDecode(encodedData);
      posts.value = decodedList.map((e) => Post.fromJson(e)).toList();
    }
  }
}
