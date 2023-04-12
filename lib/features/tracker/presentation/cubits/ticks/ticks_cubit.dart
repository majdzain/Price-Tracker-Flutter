import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:price_tracker/features/tracker/domain/entities/symbol.dart';
import 'package:price_tracker/features/tracker/domain/entities/tick.dart';
import 'package:price_tracker/features/tracker/domain/usecases/forget_previous_usercase.dart';
import 'package:price_tracker/features/tracker/domain/usecases/get_tick_by_tick_usercase.dart';

part 'ticks_state.dart';

class TicksCubit extends Cubit<TicksState> {
  GetTickByTickUsercase getTickByTickUsercase;
  ForgetPreviousUsercase forgetPreviousUsercase;
  String? previousSubscriptionId;
  TicksCubit(
      {required this.getTickByTickUsercase,
      required this.forgetPreviousUsercase})
      : super(TicksInitial());

  void stopUntil() {
    if (previousSubscriptionId != null) {
      forgetPreviousUsercase(previousSubscriptionId!);
    }
    emit(TicksInitial());
  }

  void getTickByTick(Symbol symbol, bool isWithPrevious) async {
    emit(LoadingTickState());
    // print(symbol.symbol);
    if (isWithPrevious && previousSubscriptionId != null) {
      forgetPreviousUsercase(previousSubscriptionId!);
      await Future.delayed(Duration(seconds: 1));
    }
    getTickByTickUsercase(
      symbol.symbol,
      (tick) {
        previousSubscriptionId = tick.subscriptionId;
        emit(LoadedTickState(tick: tick, previousPrice: symbol.spot));
      },
    );
  }
}
