import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:price_tracker/features/tracker/domain/entities/market.dart';
import 'package:price_tracker/features/tracker/domain/entities/symbol.dart';
import 'package:price_tracker/features/tracker/domain/usecases/get_symbols_usercase.dart';

part 'symbols_state.dart';

class SymbolsCubit extends Cubit<SymbolsState> {
  GetSymbolsUsercase getSymbolsUsercase;
  SymbolsCubit({required this.getSymbolsUsercase}) : super(SymbolsInitial());

  void getActiveSymbols() {
    emit(LoadingSymbolsState());
    getSymbolsUsercase(((symbols) {
      Map<Market, List<Symbol>> mapSymbols = {};
      symbols.sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
      for (Symbol symbol in symbols) {
        Market market = Market(
            market: symbol.market, displayName: symbol.marketDisplayName);
        if (mapSymbols[market] == null) {
          List<Symbol> list = [symbol];
          mapSymbols[market] = list;
        } else {
          mapSymbols[market]!.add(symbol);
        }
      }
      emit(LoadedSymbolsState(symbols: mapSymbols));
    }));
  }
}
