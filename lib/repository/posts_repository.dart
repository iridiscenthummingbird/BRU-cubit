import 'dart:convert';

import 'package:bru/managers/api_posts_manager.dart';
import 'package:bru/models/post.dart';

abstract class IPostsRepository {
  Future<dynamic> getPosts();
}

class PostsRepository extends IPostsRepository {
  final IApiPostsManager apiPostsManager;

  PostsRepository({required this.apiPostsManager});

  @override
  Future<List<Post>> getPosts() async {
    final responseBody = await apiPostsManager.callApiRequest('posts');
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }
}
