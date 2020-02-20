import 'package:nichacgm48/blocs/base.dart';
import 'package:nichacgm48/models/profile_model.dart';

class ProfileBloc extends BaseBloc<Profile> {
  Stream<Profile> get profile => fetcher.stream;

  fetchProfile() async {
    Profile profile = await profileRepository.fetchProfile();

    fetcher.sink.add(profile);
  }
}

final profileBLoc = ProfileBloc();