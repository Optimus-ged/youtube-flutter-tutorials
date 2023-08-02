import 'dart:convert';

import '../models/posts_models.dart';
import '../providers/posts_providers.dart';

class PostsRepositories {
  static Future<PostResponseModel> getPostsdData() async {
    final String rawsPosts = await PostsProviders.getPosts();

    return PostResponseModel.fromJson(
      jsonDecode(rawsPosts),
    );
  }
}
