import 'package:flutter/material.dart';
import 'package:pingscanio/screens/match/select_player.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class AddMatch extends StatefulWidget {
  const AddMatch({super.key});

  @override
  State<AddMatch> createState() => _AddMatchState();
}

class _AddMatchState extends State<AddMatch> {
  // add system of step to show the different step of creation of the match
  int _currentStep = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> _steps = [
    const SelectPlayer(),
  ];

  void _incrementStep() {
    setState(() {
      // check if the current step is the last step
      if (_currentStep < _steps.length - 1) {
        _currentStep++;
      } else {
        // if the current step is the last step, then go to home page
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                child: Text(
                  "Ajouter un match",
                  style: ThemeText.textTitle.copyWith(
                    color: ThemeColor.neutralColor_100,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _steps[_currentStep],
            ),
          ],
        ),
      ),
    );
  }
}
