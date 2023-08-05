import '../models/posts_models.dart';
import '../providers/posts_providers.dart';

class PostsRepositories {
  static Future<List<PostData>> getPosts() async {
    final String rawsPosts = await PostsProviders.getPosts();
    return postsFromJson(rawsPosts);
  }

  static Future<PostData> createPosts(PostData data) async {
    final String rawsPosts = await PostsProviders.createPosts(data);
    return postFromJson(rawsPosts);
  }

  static Future<PostData> updatePosts(PostData data) async {
    final String rawsPosts = await PostsProviders.updatePosts(data);
    return postFromJson(rawsPosts);
  }
}
