import 'package:price_tracker/features/tracker/domain/entities/tick.dart';

class TickModel extends Tick {
  TickModel(
      {required super.symbol,
      required super.subscriptionId,
      required super.quote});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'symbol': symbol,
      'id': subscriptionId,
      'quote': quote,
    };
  }

  factory TickModel.fromJson(Map<String, dynamic> map) {
    return TickModel(
      symbol: map['symbol'] as String,
      subscriptionId: map['id'] as String,
      quote: map['quote'] as double,
    );
  }
}
