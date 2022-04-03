import 'package:bloc/bloc.dart';
import 'package:bloc_futurebuilder_example/Gorevler/cubit/gorevler_model.dart';
import 'package:meta/meta.dart';

part 'gorevler_state.dart';

class GorevlerCubit extends Cubit<GorevlerState> {
  GorevlerState? gelenGorev;

  GorevlerCubit() : super(GorevlerInitial());
}
