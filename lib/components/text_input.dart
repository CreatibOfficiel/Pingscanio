import 'package:flutter/material.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class TextInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const TextInput(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: ThemeText.textHeading.copyWith(
            color: ThemeColor.neutralColor_300,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller,
          cursorColor: ThemeColor.neutralColor_300,
          style: ThemeText.textRegular.copyWith(
            color: ThemeColor.neutralColor_300,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: ThemeColor.neutralColor_800,
            contentPadding:
                const EdgeInsets.only(left: 16, top: 20, bottom: 20),
            hintText: hint,
            hintStyle: ThemeText.textRegular.copyWith(
              color: ThemeColor.neutralColor_500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: ThemeColor.neutralColor_750,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: ThemeColor.neutralColor_750,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: ThemeColor.neutralColor_750,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
