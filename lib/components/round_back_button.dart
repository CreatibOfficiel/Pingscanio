import 'package:flutter/material.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class RoundBackButton extends StatelessWidget {
  final String text;

  const RoundBackButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: const BorderSide(
            color: ThemeColor.primaryColor_500,
            width: 2,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        child: Text(
          text,
          style: ThemeText.textBold.copyWith(
            color: ThemeColor.primaryColor_500,
          ),
        ),
      ),
    );
  }
}
