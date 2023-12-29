import 'package:landing_and_login_screen/data/services/dio_services.dart';

class PostDataProviders {
  static Future<String> getPosts() async {
    final String rows = await DioService().request(
      HttpMethode.get,
      "/posts",
    );

    return rows;
  }
}
