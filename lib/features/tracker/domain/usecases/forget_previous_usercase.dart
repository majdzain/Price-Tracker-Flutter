import 'package:price_tracker/features/tracker/domain/repositories/ticks_repository.dart';

class ForgetPreviousUsercase {
  TicksRepository ticksRepository;
  ForgetPreviousUsercase({
    required this.ticksRepository,
  });
  void call(String subscription) {
    return ticksRepository.forgetPrevious(subscription);
  }
}
