import 'package:get_it/get_it.dart';
import 'package:price_tracker/core/helpers/web_socket_helper.dart';
import 'package:price_tracker/features/tracker/data/datasources/remote/symbols_remote_datasource.dart';
import 'package:price_tracker/features/tracker/data/datasources/remote/ticks_remote_datasource.dart';
import 'package:price_tracker/features/tracker/data/repositories/symbols_repository_impl.dart';
import 'package:price_tracker/features/tracker/data/repositories/ticks_repository_impl.dart';
import 'package:price_tracker/features/tracker/domain/usecases/forget_previous_usercase.dart';
import 'package:price_tracker/features/tracker/domain/usecases/get_symbols_usercase.dart';
import 'package:price_tracker/features/tracker/domain/usecases/get_tick_by_tick_usercase.dart';
import 'package:price_tracker/features/tracker/presentation/cubits/symbols/symbols_cubit.dart';
import 'package:price_tracker/features/tracker/presentation/cubits/ticks/ticks_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //* features

  //*? tracker

  //! cubits
  sl.registerFactory(() => SymbolsCubit(getSymbolsUsercase: sl()));
  sl.registerFactory(() =>
      TicksCubit(getTickByTickUsercase: sl(), forgetPreviousUsercase: sl()));

  //! usecases
  sl.registerLazySingleton(
      () => GetSymbolsUsercase(symbolsRepository: sl<SymbolsRepositoryImpl>()));
  sl.registerLazySingleton(
      () => GetTickByTickUsercase(ticksRepository: sl<TicksRepositoryImpl>()));
  sl.registerLazySingleton(
      () => ForgetPreviousUsercase(ticksRepository: sl<TicksRepositoryImpl>()));

  //! repositories
  sl.registerLazySingleton(
      () => SymbolsRepositoryImpl(symbolsRemoteDataSource: sl()));
  sl.registerLazySingleton(
      () => TicksRepositoryImpl(ticksRemoteDataSource: sl()));

  //! datasources
  sl.registerLazySingleton(() => SymbolsRemoteDataSource(channelHelper: sl()));
  sl.registerLazySingleton(() => TicksRemoteDataSource(channelHelper: sl()));

  //* core

  //*? helpers

  //! web_socket_helper
  sl.registerLazySingleton(() => WebSocketHelper());
}
