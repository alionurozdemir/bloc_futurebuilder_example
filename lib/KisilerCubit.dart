import 'package:bloc/bloc.dart';
import 'package:bloc_futurebuilder_example/KisilerDurum.dart';

import 'KisilerDaoRepository.dart';

class KisilerCubit extends Cubit<KisilerDurum> {
  KisilerRepository kisilerRepository;

  KisilerCubit(this.kisilerRepository) : super(KisilerBaslangicSinifi());

  Future<void> kisileriAlveTetikle() async {
    try {

        emit(KisilerYukleniyor());
        var kisiListeCevap = await kisilerRepository.kisileriGetir();
        emit(KisilerYuklendi(kisiListeCevap));

    } catch (e) {
      emit(KisilerHata("Hata Oluştu"));
    }
  }
}
