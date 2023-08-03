import '../models/posts_models.dart';
import '../providers/posts_providers.dart';

class PostsRepositories {
  static Future<List<PostData>> getPostsdData() async {
    final String rawsPosts = await PostsProviders.getPosts();
    return postsFromJson(rawsPosts);
  }
}
