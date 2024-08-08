import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 1)) {
    on<CounterIncrementPressed>(
      (event, emit) {
        emit(
          CounterState(counter: state.counter + 1),
        );
      },
    );
    on<CounterDecrementPressed>(
      (event, emit) {
        emit(
          CounterState(counter: state.counter - 1),
        );
      },
    );
    on<CounterZeroPressed>(
      (event, emit) {
        emit(
          CounterState(counter: 0),
        );
      },
    );
  }
}
