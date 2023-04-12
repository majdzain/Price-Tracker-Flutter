// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:price_tracker/features/tracker/domain/entities/market.dart';
import 'package:price_tracker/features/tracker/domain/entities/symbol.dart';
import 'package:price_tracker/features/tracker/presentation/widgets/dropdown.dart';

class DropdownsScreen extends StatefulWidget {
  Map<Market, List<Symbol>> symbols;
  Function(Symbol, bool) onSelectSymbol;
  VoidCallback stopUntil;

  DropdownsScreen({
    Key? key,
    required this.symbols,
    required this.onSelectSymbol,
    required this.stopUntil,
  }) : super(key: key);

  @override
  State<DropdownsScreen> createState() => _DropdownsScreenState();
}

class _DropdownsScreenState extends State<DropdownsScreen> {
  List<Market> markets = [];
  List<Symbol> currentSymbols = [];

  @override
  void initState() {
    super.initState();
    markets = widget.symbols.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Dropdown(
              items: markets
                  .map((market) => DropdownMenuItem(
                        value: market,
                        child: Text(market.displayName),
                      ))
                  .toList(),
              placeholder: "Select a Market",
              onChanged: (market, isWithPrevious) {
                setState(() {
                  currentSymbols = widget.symbols[market]!;
                });
                widget.stopUntil();
              }),
          const SizedBox(height: 15),
          Dropdown(
            items: currentSymbols
                .map((symbol) => DropdownMenuItem(
                      value: symbol,
                      child: Text(symbol.displayName),
                    ))
                .toList(),
            placeholder: "Select an Asset",
            onChanged: (symbol, isWithPrevious) {
              widget.onSelectSymbol(symbol, isWithPrevious);
            },
          ),
        ],
      ),
    );
  }
}
