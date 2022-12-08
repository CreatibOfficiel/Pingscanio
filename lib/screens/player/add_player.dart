import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pingscanio/components/button/round_back_button.dart';
import 'package:pingscanio/components/button/round_button.dart';
import 'package:pingscanio/components/text_input.dart';
import 'package:pingscanio/database/services/player_service.dart';
import 'package:pingscanio/objects/player.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({super.key});

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  @override
  void initState() {
    super.initState();
    _lastNameController.addListener(_validate);
    _firstNameController.addListener(_validate);
    _urlController.addListener(_validate);
  }

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  bool _isAllValid = false;

  void onTextChanged(String text) {
    setState(() {
      _isAllValid = _validate();
    });
  }

  bool _validate() {
    return _lastNameController.text.isNotEmpty &&
        _firstNameController.text.isNotEmpty &&
        _urlController.text.isNotEmpty &&
        (_urlController.text.startsWith('http') ||
            _urlController.text.startsWith('https')) &&
        (_urlController.text.endsWith('.png') ||
            _urlController.text.endsWith('.jpg') ||
            _urlController.text.endsWith('.jpeg'));
  }

  void addUser() {
    if (kDebugMode) {
      print(_isAllValid);
    }

    Player newPlayer = Player(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        profilePictureUrl: _urlController.text);

    if (_isAllValid) {
      PlayerService().createPlayer(newPlayer);
    }

    SnackBar snackBar = SnackBar(
      content: const Text('Joueur ajouté'),
      action: SnackBarAction(
        label: 'Annuler',
        onPressed: () {
          PlayerService().deletePlayer(newPlayer);
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: ListView(
            children: [
              Text(
                'Ajouter un joueur',
                style: ThemeText.textTitle.copyWith(
                  color: ThemeColor.neutralColor_300,
                ),
              ),
              Text(
                "Nouveau astronaute ?",
                style: ThemeText.textRegular.copyWith(
                  color: ThemeColor.neutralColor_300,
                ),
              ),
              const SizedBox(height: 32),
              TextInput(
                  label: "Nom du joueur",
                  hint: "Entre le nom du nouveau joueur",
                  controller: _lastNameController,
                  onChanged: onTextChanged),
              const SizedBox(height: 32),
              TextInput(
                  label: "Prénom du joueur",
                  hint: "Entre le prénom du nouveau joueur",
                  controller: _firstNameController,
                  onChanged: onTextChanged),
              const SizedBox(height: 32),
              TextInput(
                  label: "Image de profil",
                  hint: "Entre le lien de l'image de profil",
                  controller: _urlController,
                  onChanged: onTextChanged),
            ],
          )),
      bottomNavigationBar: BottomAppBar(
          color: ThemeColor.primaryColor,
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 96,
            child: Row(children: [
              const Expanded(
                child: RoundBackButton(
                  text: "Annuler",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: RoundButton(
                  text: "Ajouter",
                  enabled: _isAllValid,
                  onPressed: addUser,
                ),
              ),
            ]),
          )),
    );
  }
}
