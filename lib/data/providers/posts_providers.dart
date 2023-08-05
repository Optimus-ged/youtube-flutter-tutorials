import 'package:landing_and_login_screen/data/models/posts_models.dart';

import '../services/dio_services.dart';

class PostsProviders {
  static Future<String> getPosts() async {
    final String rawsPosts = await DioService().request(
      HttpMethode.get,
      "/posts",
    );

    return rawsPosts;
  }

  static Future<String> createPosts(PostData data) async {
    final String rawsPosts = await DioService().request(
      HttpMethode.post,
      "/posts",
      data: data.toJson()
    );

    return rawsPosts;
  }

  static Future<String> updatePosts(PostData data) async {
    final String rawsPosts = await DioService().request(
      HttpMethode.put,
      "/posts",
      data: data.toJson()
    );

    return rawsPosts;
  }
}
