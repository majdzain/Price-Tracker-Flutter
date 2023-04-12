import 'package:price_tracker/features/tracker/domain/entities/market.dart';

class MarketModel extends Market {
  MarketModel({required super.market, required super.displayName});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'market': market,
      'displayName': displayName,
    };
  }

  factory MarketModel.fromJson(Map<String, dynamic> map) {
    return MarketModel(
      market: map['market'] as String,
      displayName: map['displayName'] as String,
    );
  }
}
