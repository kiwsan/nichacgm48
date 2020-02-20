import 'package:nichacgm48/models/profile_model.dart';
import 'package:nichacgm48/repositories/profile_api_provider.dart';

class ProfileRepository {
  final apiProvider = ProfileApiProvider();

  Future<Profile> fetchProfile() => apiProvider.fetchProfile();
}
