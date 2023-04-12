// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:price_tracker/features/tracker/domain/entities/symbol.dart';
import 'package:price_tracker/features/tracker/domain/repositories/symbols_repository.dart';

class GetSymbolsUsercase {
  SymbolsRepository symbolsRepository;
  GetSymbolsUsercase({
    required this.symbolsRepository,
  });
  Future<void> call(Function(List<Symbol> symbols) retrieveSymbols) async {
    symbolsRepository.getActiveSymbols(retrieveSymbols);
  }
}
