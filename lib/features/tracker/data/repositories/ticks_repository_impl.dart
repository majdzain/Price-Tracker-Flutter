// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:price_tracker/features/tracker/data/datasources/remote/ticks_remote_datasource.dart';
import 'package:price_tracker/features/tracker/data/models/tick_model.dart';
import 'package:price_tracker/features/tracker/domain/entities/tick.dart';
import 'package:price_tracker/features/tracker/domain/repositories/ticks_repository.dart';

class TicksRepositoryImpl implements TicksRepository {
  TicksRemoteDataSource ticksRemoteDataSource;
  TicksRepositoryImpl({
    required this.ticksRemoteDataSource,
  });
  @override
  Future<void> getTickByTick(
      String symbol, Function(TickModel tickModel) retrieveTick) async {
    ticksRemoteDataSource.getTickByTick(symbol, retrieveTick);
  }

  @override
  void forgetPrevious(String subscription) {
    ticksRemoteDataSource.forgetPrevious(subscription);
  }
}
