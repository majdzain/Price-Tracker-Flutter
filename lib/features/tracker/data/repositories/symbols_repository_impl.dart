// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:price_tracker/features/tracker/data/datasources/remote/symbols_remote_datasource.dart';
import 'package:price_tracker/features/tracker/data/models/symbol_model.dart';
import 'package:price_tracker/features/tracker/domain/entities/symbol.dart';
import 'package:price_tracker/features/tracker/domain/repositories/symbols_repository.dart';

class SymbolsRepositoryImpl implements SymbolsRepository {
  SymbolsRemoteDataSource symbolsRemoteDataSource;
  SymbolsRepositoryImpl({
    required this.symbolsRemoteDataSource,
  });
  @override
  Future<void> getActiveSymbols(
      Function(List<Symbol> symbols) retrieveSymbols) async {
    symbolsRemoteDataSource.getActiveSymbols(retrieveSymbols);
  }
}
