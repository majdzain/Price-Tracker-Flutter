import 'package:price_tracker/features/tracker/domain/entities/tick.dart';
import 'package:price_tracker/features/tracker/domain/repositories/ticks_repository.dart';

class GetTickByTickUsercase {
  TicksRepository ticksRepository;
  GetTickByTickUsercase({
    required this.ticksRepository,
  });
  Future<void> call(String symbol, Function(Tick tick) retrieveTick) async {
    ticksRepository.getTickByTick(symbol, retrieveTick);
  }
}
