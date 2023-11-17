import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';

enum ClockEvent { now, addDay }

class ClockBloc extends Bloc<ClockEvent, int> {
  ClockBloc() : super(clock.now().millisecondsSinceEpoch) {
    on<ClockEvent>((event, emit) {
      switch (event) {
        case ClockEvent.now:
          return emit(clock.now().millisecondsSinceEpoch);
        case ClockEvent.addDay:
          return emit(
            DateTime.fromMillisecondsSinceEpoch(state)
                .add(const Duration(days: 1))
                .millisecondsSinceEpoch,
          );
      }
    });
  }
}
