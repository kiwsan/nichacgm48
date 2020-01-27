import 'package:nichacgm48/models/base_model.dart';
import 'package:nichacgm48/repositories/instagram_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends BaseModel> {
  final instagramRepository = InstagramRepository();
  final fetcher = PublishSubject<T>();

  dispose() {
    fetcher.close();
  }
}
