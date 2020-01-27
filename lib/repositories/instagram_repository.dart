import 'package:nichacgm48/models/instagram_post_model.dart';
import 'package:nichacgm48/repositories/instagram_api_provider.dart';

class InstagramRepository {
  final apiProvider = InstagramApiProvider();

  Future<EdgeOwnerToTimelineMedia> fetchPosts() =>
      apiProvider.fetchPosts();
}
