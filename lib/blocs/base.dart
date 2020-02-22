import 'package:nichacgm48/models/base_model.dart';
import 'package:nichacgm48/repositories/hashtag_repository.dart';
import 'package:nichacgm48/repositories/instagram_repository.dart';
import 'package:nichacgm48/repositories/profile_repository.dart';
import 'package:nichacgm48/repositories/supporter_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends BaseModel> {
  final instagramRepository = InstagramRepository();
  final profileRepository = ProfileRepository();
  final hastagRepository = HashtagRepository();
  final supporterRepository = SupporterRepository();
  final fetcher = PublishSubject<T>();

  dispose() {
    fetcher.close();
  }
}
