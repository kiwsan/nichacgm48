import 'package:nichacgm48/blocs/base.dart';
import 'package:nichacgm48/models/instagram_post_model.dart';
import 'package:rxdart/rxdart.dart';

class InstagramPostsBLoc extends BaseBloc<EdgeOwnerToTimelineMedia> {
  Observable<EdgeOwnerToTimelineMedia> get posts => fetcher.stream;

  fetchPosts() async {
    EdgeOwnerToTimelineMedia posts = await instagramRepository.fetchPosts();

    fetcher.sink.add(posts);
  }
}

final instagramPostsBLoc = InstagramPostsBLoc();
