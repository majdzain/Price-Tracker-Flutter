part of 'symbols_cubit.dart';

@immutable
abstract class SymbolsState {}

class SymbolsInitial extends SymbolsState {}

class LoadingSymbolsState extends SymbolsState {}

class LoadedSymbolsState extends SymbolsState {
  Map<Market, List<Symbol>> symbols;
  LoadedSymbolsState({required this.symbols});

  @override
  bool operator ==(Object other) {
    return other is LoadedSymbolsState && other.symbols == symbols;
  }

  @override
  int get hashCode => symbols.hashCode;
}
