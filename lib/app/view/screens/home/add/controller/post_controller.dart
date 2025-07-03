import 'package:get/get.dart';

import '../model/post.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;

  void addPost(Post post) {
    posts.add(post);
  }

  void updatePost(String id, String title, String body) {
    int index = posts.indexWhere((p) => p.id == id);
    if (index != -1) {
      posts[index] = Post(id: id, title: title, body: body);
      posts.refresh();
    }
  }
}
