import 'package:nichacgm48/models/supporter_model.dart';
import 'package:nichacgm48/repositories/supporter_api_provider.dart';

class SupporterRepository {
  final apiProvider = SupporterApiProvider();

  Future<Supporters> fetchSupporters() => apiProvider.fetchSupporters();
}
