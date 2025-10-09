import 'package:ev_tech_user/Utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemLabel;
  final ValueChanged<T> onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.itemLabel,
    required this.onChanged,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  T? currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        value: currentValue,
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          height: 45,
          padding: const EdgeInsets.only(left: 0, right: 12),
          decoration: BoxDecoration(
            color: AppTheme.appColorShade25,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppTheme.appColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down, color: AppTheme.whiteColor),
        ),
        style: TextStyle(
          color: AppTheme.whiteColor,
          fontSize: 14,
        ),
        items: widget.items.map((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(widget.itemLabel(value)),
          );
        }).toList(),
        onChanged: (T? newValue) {
          if (newValue != null) {
            setState(() {
              currentValue = newValue;
            });
            widget.onChanged(newValue);
          }
        },
      ),
    );
  }
}


class SimpleDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String> onChanged;

  const SimpleDropdown({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  State<SimpleDropdown> createState() => _SimpleDropdownState();
}

class _SimpleDropdownState extends State<SimpleDropdown> {
  String? currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: (currentValue != null && widget.items.contains(currentValue))
            ? currentValue
            : null,
        isExpanded: true,
        buttonStyleData: ButtonStyleData(
          height: 45,
          padding: const EdgeInsets.only(left: 0, right: 12),
          decoration: BoxDecoration(
            color: AppTheme.appColorShade25,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        style: TextStyle(
          color: AppTheme.whiteColor,
          fontSize: 14,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppTheme.appColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              currentValue = newValue;
            });
            widget.onChanged(newValue);
          }
        },
      )
      ,
    );
  }
}
