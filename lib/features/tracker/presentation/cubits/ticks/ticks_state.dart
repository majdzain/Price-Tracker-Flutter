part of 'ticks_cubit.dart';

@immutable
abstract class TicksState {}

class TicksInitial extends TicksState {}

class LoadingTickState extends TicksState {}

class LoadedTickState extends TicksState {
  Tick tick;
  double previousPrice;
  LoadedTickState({required this.tick, required this.previousPrice});

  @override
  bool operator ==(Object other) {
    return other is LoadedTickState && other.tick == tick;
  }

  @override
  int get hashCode => tick.hashCode;
}
