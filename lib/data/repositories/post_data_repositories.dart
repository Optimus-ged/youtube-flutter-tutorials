

import 'package:landing_and_login_screen/data/models/post_data_model.dart';
import 'package:landing_and_login_screen/data/providers/post_data_providers.dart';

class PostsDataRepositories{
  static Future<List<PostDataModel>> getPosts() async {
    final String rows = await PostDataProviders.getPosts();
    return postDataListModelFromJson(rows); 
  }
}