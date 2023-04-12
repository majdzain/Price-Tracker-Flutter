import 'package:price_tracker/features/tracker/domain/entities/symbol.dart';

abstract class SymbolsRepository {
  Future<void> getActiveSymbols(Function(List<Symbol> symbols) retrieveSymbols);
}
