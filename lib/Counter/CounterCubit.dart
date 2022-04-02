import 'package:bloc/bloc.dart';
import 'package:bloc_futurebuilder_example/Counter/CounterState.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(10);

  arttir() {
    int count = state + 1;
    emit(count);
  }

  azalt() {
    int count = state - 1;
    emit(count);
  }
}
