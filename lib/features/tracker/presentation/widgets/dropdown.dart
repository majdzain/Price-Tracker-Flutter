// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:price_tracker/features/tracker/domain/entities/market.dart';

class Dropdown extends StatefulWidget {
  List<DropdownMenuItem> items;
  String placeholder;
  Function(dynamic value, bool isWithPrevious) onChanged;
  Dropdown({
    Key? key,
    required this.items,
    required this.placeholder,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  dynamic currentValue;

  @override
  Widget build(BuildContext context) {
    bool isCurrentValueExist = false;
    for (DropdownMenuItem dropdownMenuItem in widget.items) {
      if (dropdownMenuItem.value == currentValue) {
        isCurrentValueExist = true;
        break;
      }
    }
    return DropdownButton(
      value: isCurrentValueExist ? currentValue : null,
      items: widget.items,
      isExpanded: true,
      onChanged: (newValue) {
        if (newValue != currentValue) {
          setState(() {
            currentValue = newValue;
          });
          widget.onChanged(newValue, currentValue != null);
        }
      },
      hint: Text(widget.placeholder),
    );
  }
}
