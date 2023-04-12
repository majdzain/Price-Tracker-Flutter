import 'package:price_tracker/features/tracker/domain/entities/symbol.dart';

class SymbolModel extends Symbol {
  SymbolModel(
      {required super.symbol,
      required super.displayName,
      required super.symbolType,
      required super.spot,
      required super.market,
      required super.marketDisplayName,
      required super.displayOrder});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'symbol': symbol,
      'display_name': displayName,
      'symbol_type': symbolType,
      'spot': spot,
      'market': market,
      'market_display_name': marketDisplayName,
      'display_order': displayOrder
    };
  }

  factory SymbolModel.fromJson(Map<String, dynamic> map) {
    return SymbolModel(
        symbol: map['symbol'] as String,
        displayName: map['display_name'] as String,
        symbolType: map['symbol_type'] as String,
        spot: map['spot'] as double,
        market: map['market'] as String,
        marketDisplayName: map['market_display_name'] as String,
        displayOrder: map['display_order'] as int);
  }
}
