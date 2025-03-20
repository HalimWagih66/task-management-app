import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      hint: const Text(
        'English',
        style: TextStyle(fontSize: 14),
      ),
      items: const [
        DropdownMenuItem<String>(
          value: "item",
          child: Text(
            "item",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: "String",
          child: Text(
            "String",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        )
      ],
      validator: (value) {
        if (value == null) {
          return 'Please select gender.';
        }
        return null;
      },
      onChanged: (value) {
        //Do something when selected item is changed.
      },
      onSaved: (value) {
        //selectedValue = value.toString();
      },
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
