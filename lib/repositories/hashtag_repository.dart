import 'package:nichacgm48/models/hashtag_model.dart';
import 'package:nichacgm48/repositories/hashtag_api_provider.dart';

class HashtagRepository {
  final apiProvider = HashtagApiProvider();

  Future<HashTags> fetchHashtags() => apiProvider.fetchHashtags();
}
