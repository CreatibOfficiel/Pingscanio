import 'package:flutter/material.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback onPressed;

  const RoundButton({
    super.key,
    required this.text,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : () => {},
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled
              ? ThemeColor.primaryColor_500
              : ThemeColor.neutralColor_500,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        child: Text(
          text,
          style: ThemeText.textBold.copyWith(
            color: enabled
                ? ThemeColor.neutralColor_900
                : ThemeColor.neutralColor_600,
          ),
        ),
      ),
    );
  }
}
