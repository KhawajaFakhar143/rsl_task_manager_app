import 'package:flutter/material.dart';
import '../utils/color_palette.dart';
import '../utils/font_sizes.dart';

class PriorityDropdownField extends StatelessWidget {
  final String hint;
  final String? selectedValue;
  final Function(String?) onChanged;
  final List<String> items;

  const PriorityDropdownField({
    super.key,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
       data: Theme.of(context).copyWith(
    canvasColor: Colors.white, 
  ),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down, color: kGrey1),
        decoration: InputDecoration(
          counterText: "",
          fillColor: kWhiteColor,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(
            fontSize: textMedium,
            fontWeight: FontWeight.w300,
            color: kGrey1,
          ),
          errorStyle: const TextStyle(
            fontSize: textMedium,
            fontWeight: FontWeight.normal,
            color: kRed,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: kPrimaryColor),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 0, color: kGrey1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 0, color: kGrey1),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 0, color: kGrey1),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: kRed),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: kGrey1),
          ),
          focusColor: kWhiteColor,
          hoverColor: kWhiteColor,
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              color: Colors.white,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: textMedium,
                  color: kBlackColor,
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? 'required' : null,
      ),
    );
  }
}
