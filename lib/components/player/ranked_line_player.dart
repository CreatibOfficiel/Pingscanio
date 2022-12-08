import 'package:flutter/material.dart';

class RankedLinePlayer extends StatelessWidget {
  final bool? isSelectable;
  final bool? isSelected;

  final String firstName;
  final String lastName;
  final String profilePictureUrl;

  final int? rank;
  final int? elo;
  final int? winrate;

  const RankedLinePlayer(
      {super.key,
      this.isSelectable,
      this.isSelected,
      required this.firstName,
      required this.lastName,
      required this.profilePictureUrl,
      this.rank,
      this.elo,
      this.winrate});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
