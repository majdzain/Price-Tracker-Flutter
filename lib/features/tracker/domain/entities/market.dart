import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Market {
  String market;
  String displayName;
  Market({
    required this.market,
    required this.displayName,
  });

  @override
  bool operator ==(Object other) =>
      other is Market &&
      other.market == market &&
      other.displayName == displayName;

  @override
  int get hashCode => market.hashCode ^ displayName.hashCode;
}
