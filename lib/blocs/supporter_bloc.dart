import 'package:nichacgm48/blocs/base.dart';
import 'package:nichacgm48/models/supporter_model.dart';

class SupporterBloc extends BaseBloc<Supporters> {
  Stream<Supporters> get supporters => fetcher.stream;

  fetchSupporters() async {
    Supporters supporters = await supporterRepository.fetchSupporters();

    fetcher.sink.add(supporters);
  }
}

final supporterBloc = SupporterBloc();
