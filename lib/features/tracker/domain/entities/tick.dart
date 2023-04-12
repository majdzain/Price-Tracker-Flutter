import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Tick {
  String symbol;
  String subscriptionId;
  double quote;
  Tick({
    required this.symbol,
    required this.subscriptionId,
    required this.quote,
  });

  @override
  bool operator ==(Object other) =>
      other is Tick &&
      other.symbol == symbol &&
      other.subscriptionId == subscriptionId &&
      other.quote == quote;

  @override
  int get hashCode =>
      symbol.hashCode ^ subscriptionId.hashCode ^ quote.hashCode;
}
