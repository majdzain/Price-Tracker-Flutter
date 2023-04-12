class Symbol {
  String symbol;
  String displayName;
  String symbolType;
  double spot;
  String market;
  String marketDisplayName;
  int displayOrder;

  Symbol(
      {required this.symbol,
      required this.displayName,
      required this.symbolType,
      required this.spot,
      required this.market,
      required this.marketDisplayName,
      required this.displayOrder});
  @override
  bool operator ==(Object other) => other is Symbol && other.symbol == symbol;
  @override
  int get hashCode => symbol.hashCode;
}
