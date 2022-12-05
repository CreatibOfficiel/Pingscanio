import 'package:flutter/material.dart';
import 'package:pingscanio/screens/player/add_player.dart';
import 'package:pingscanio/theme/text_styles.dart';

import '../../theme/colors.dart';

class SelectPlayer extends StatefulWidget {
  const SelectPlayer({super.key});

  @override
  State<SelectPlayer> createState() => _SelectPlayerState();
}

class _SelectPlayerState extends State<SelectPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Qui veut se la coller ?",
            style: ThemeText.textRegular.copyWith(
              color: ThemeColor.neutralColor_300,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "Recherche",
            style: ThemeText.textHeading.copyWith(
              color: ThemeColor.neutralColor_300,
            ),
          ),
          const SizedBox(height: 16),
          Flexible(
              child: TextField(
            cursorColor: ThemeColor.neutralColor_300,
            style: ThemeText.textRegular.copyWith(
              color: ThemeColor.neutralColor_300,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: ThemeColor.neutralColor_800,
              contentPadding:
                  const EdgeInsets.only(left: 16, top: 20, bottom: 20),
              hintText: "Entre le prénom de quelqu'un",
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
              suffixIcon: Container(
                margin: const EdgeInsets.only(right: 16),
                child: const Icon(
                  Icons.search,
                  color: ThemeColor.neutralColor_500,
                ),
              ),
            ),
          )),
          const SizedBox(height: 16),
          Text(
            "Tous les joueurs·euses",
            style: ThemeText.textHeading.copyWith(
              color: ThemeColor.neutralColor_300,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: ThemeColor.neutralColor_800,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: ThemeColor.neutralColor_500,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddPlayer(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Ajouter un·e joueur·euse",
                style: ThemeText.textRegular.copyWith(
                  color: ThemeColor.neutralColor_300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
