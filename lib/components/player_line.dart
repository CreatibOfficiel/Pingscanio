import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlayerLine extends StatelessWidget {
  final bool? isSelectable;
  final bool? isSelected;

  final String firstName;
  final String lastName;
  final String profilePictureUrl;

  final int? rank;
  final int? elo;
  final int? winrate;

  const PlayerLine(
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
