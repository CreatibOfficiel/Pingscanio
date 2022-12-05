import 'package:flutter/material.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final VoidCallback onPressed;

  const RoundButton({
    super.key,
    required this.text,
    required this.disabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: disabled
              ? ThemeColor.neutralColor_500
              : ThemeColor.primaryColor_500,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        child: Text(
          text,
          style: ThemeText.textBold.copyWith(
            color: disabled
                ? ThemeColor.neutralColor_600
                : ThemeColor.neutralColor_900,
          ),
        ),
      ),
    );
  }
}
