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
  final VoidCallback refreshPlayers;

  const AddPlayer({super.key, required this.refreshPlayers});

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

  void _onTextChanged(String text) {
    setState(() {
      _isAllValid = _validate();
    });
  }

  bool _validate() {
    return _lastNameController.text.isNotEmpty &&
        _firstNameController.text.isNotEmpty &&
        _urlController.text.isNotEmpty &&
        (_urlController.text.startsWith('http://') ||
            _urlController.text.startsWith('https://')) &&
        (_urlController.text.endsWith('.png') ||
            _urlController.text.endsWith('.jpg') ||
            _urlController.text.endsWith('.jpeg'));
  }

  void addUser() {
    if (kDebugMode) {
      print(_isAllValid);
    }

    Player newPlayer = Player(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        profilePictureUrl: _urlController.text.trim());

    if (_isAllValid) {
      PlayerService().createPlayer(newPlayer);
      widget.refreshPlayers();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Joueur·euse ajouté·e.",
          style: ThemeText.textRegular.copyWith(
            color: ThemeColor.neutralColor_100,
          ),
        ),
        backgroundColor: ThemeColor.neutralColor_800,
      ),
    );

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
                  onChanged: _onTextChanged),
              const SizedBox(height: 32),
              TextInput(
                  label: "Prénom du joueur",
                  hint: "Entre le prénom du nouveau joueur",
                  controller: _firstNameController,
                  onChanged: _onTextChanged),
              const SizedBox(height: 32),
              TextInput(
                  label: "Image de profil",
                  hint: "Entre le lien de l'image de profil",
                  controller: _urlController,
                  onChanged: _onTextChanged),
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
