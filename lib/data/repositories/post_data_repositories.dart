

import '../models/post_data_model.dart';
import 'package:landing_and_login_screen/data/providers/post_data_providers.dart';

class PostsDataRepositories{
  static Future<List<PostDataModel>> getPosts() async {
    final String rows = await PostDataProviders.getPosts();
    return postDataListModelFromJson(rows); 
  }

  static Future<PostDataModel> createPosts(PostDataModel data) async {
    final String rows = await PostDataProviders.createPosts(data);
    return postDataModelFromJson(rows); 
  }

  static Future<PostDataModel> updatePosts(PostDataModel data) async {
    final String rows = await PostDataProviders.updatePosts(data);
    return postDataModelFromJson(rows); 
  }

  static Future<PostDataModel> deletePosts(PostDataModel data) async {
    final String rows = await PostDataProviders.deletePosts(data);
    return postDataModelFromJson(rows); 
  }

}