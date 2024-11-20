import 'package:landing_and_login_screen/data/models/post_data_model.dart';
import 'package:landing_and_login_screen/data/services/dio_services.dart';

class PostDataProviders {
  static Future<String> getPosts() async {
    final String rows = await DioService().request(
      HttpMethode.get,
      "/posts",
    );

    return rows;
  }

  static Future<String> createPosts(PostDataModel data) async {
    final String rows = await DioService().request(
      HttpMethode.post,
      "/posts",
      data: data.toJson(),
    );

    return rows;
  }

  static Future<String> updatePosts(PostDataModel data) async {
    final String rows = await DioService().request(
      HttpMethode.put,
      "/posts/${data.id}",
      data: data.toJson(),
    );

    return rows;
  }

  static Future<String> deletePosts(PostDataModel data) async {
    final String rows = await DioService().request(
      HttpMethode.delete,
      "/posts/${data.id}",
    );

    return rows;
  }
}
