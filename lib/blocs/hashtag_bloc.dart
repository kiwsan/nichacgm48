import 'package:nichacgm48/blocs/base.dart';
import 'package:nichacgm48/models/hashtag_model.dart';

class HastagBloc extends BaseBloc<HashTags> {
  Stream<HashTags> get hastags => fetcher.stream;

  fetchHashtags() async {
    HashTags hastags = await hastagRepository.fetchHashtags();

    fetcher.sink.add(hastags);
  }
}

final hastagBloc = HastagBloc();
