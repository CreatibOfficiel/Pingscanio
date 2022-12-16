import 'package:flutter/material.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(height: 16),
                Text(
                  "Matches",
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(height: 16),
                Text(
                  "Coming soon...",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          )),
    );
  }
}
