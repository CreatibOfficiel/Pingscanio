import 'package:flutter/material.dart';
import 'package:pingscanio/screens/player/add_player.dart';
import 'package:pingscanio/screens/match/add_match.dart';
import 'package:pingscanio/screens/matches.dart';
import 'package:pingscanio/screens/ranking.dart';
import 'package:pingscanio/theme/colors.dart';
import 'package:pingscanio/theme/text_styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Ranking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddMatch(),
            ),
          );
        },
        backgroundColor: ThemeColor.primaryColor_500,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: ThemeColor.primaryColor_500.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 12,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: ThemeColor.neutralColor_900,
            size: 24,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: ThemeColor.primaryColor,
        child: SizedBox(
          height: 76,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Ranking();
                        _currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.leaderboard,
                          color: _currentTab == 0
                              ? ThemeColor.primaryColor_500
                              : ThemeColor.neutralColor_600,
                        ),
                        Text(
                          'Classement',
                          style: ThemeText.textRegular.copyWith(
                            color: _currentTab == 0
                                ? ThemeColor.primaryColor_500
                                : ThemeColor.neutralColor_600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Matches();
                        _currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sports_tennis_sharp,
                          color: _currentTab == 1
                              ? ThemeColor.primaryColor_500
                              : ThemeColor.neutralColor_600,
                        ),
                        Text(
                          'Matchs',
                          style: ThemeText.textRegular.copyWith(
                            color: _currentTab == 1
                                ? ThemeColor.primaryColor_500
                                : ThemeColor.neutralColor_600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
