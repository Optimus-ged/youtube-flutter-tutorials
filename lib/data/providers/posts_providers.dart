import '../services/dio_services.dart';

class PostsProviders {
  static Future<String> getPosts() async {
    final String rawsPosts = await DioService().request(
      HttpMethode.get,
      "/posts",
    );
    return rawsPosts;
  }
}
