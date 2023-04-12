import 'package:price_tracker/features/tracker/domain/entities/tick.dart';

abstract class TicksRepository {
  Future<void> getTickByTick(String symbol, Function(Tick tick) retrieveTick);
  void forgetPrevious(String subscription);
}
