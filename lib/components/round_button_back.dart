import 'package:flutter/material.dart';
import 'package:pingscanio/theme/colors.dart';

class RoundButtonBack extends StatelessWidget {
  const RoundButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: ThemeColor.neutralColor_100,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
