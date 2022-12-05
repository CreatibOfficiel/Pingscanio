import 'package:flutter/material.dart';
import 'package:pingscanio/components/round_button.dart';
import 'package:pingscanio/components/round_button_back.dart';
import 'package:pingscanio/components/text_input.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({super.key});

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  void addUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RoundButtonBack(),
              const SizedBox(width: 16),
              Text(
                "Ajouter un joueur",
                style: ThemeText.textTitle.copyWith(
                  color: ThemeColor.neutralColor_100,
                ),
              ),
            ],
          ),
          Text(
            "Nouveau astronaute ?",
            style: ThemeText.textRegular.copyWith(
              color: ThemeColor.neutralColor_300,
            ),
          ),
          const SizedBox(height: 32),
          const TextInput(
              label: "Nom du joueur", hint: "Entre le nom du nouveau joueur"),
          const SizedBox(height: 32),
          const TextInput(
              label: "Prénom du joueur",
              hint: "Entre le prénom du nouveau joueur"),
          const SizedBox(height: 32),
          const TextInput(
              label: "Image de profil",
              hint: "Entre le lien de l'image de profil"),
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        color: ThemeColor.primaryColor,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: RoundButton(
            text: "Ajouter",
            disabled: false,
            onPressed: addUser,
          ),
        ),
      ),
    );
  }
}
