import 'package:flutter/material.dart';
import 'package:trackyourdrunkfriend/small_friend_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedFriendCardIndex;

  @override
  Widget build(BuildContext context) {
    var nearbyFriendsData = [
      {
        "name": "Sanna",
        "status": "Hello my buddys!",
        "profilePicture": "assets/images/sanna_pfp.png",
        "profilePictureLarge": "assets/images/sanna_large_pfp.jpg",
        "profileColor": Theme.of(context).colorScheme.tertiary,
      },
      {
        "name": "Esko",
        "status": "What's up?",
        "profilePicture": "assets/images/esko_pfp.png",
        "profilePictureLarge": "assets/images/esko_large_pfp.jpg",
        "profileColor": Theme.of(context).colorScheme.secondary,
      },
      {
        "name": "Maria",
        "status": "Una cerveza por favor :)",
        "profilePicture": "assets/images/maria_pfp.png",
        "profilePictureLarge": "assets/images/maria_large_pfp.jpg",
        "profileColor": Theme.of(context).colorScheme.primary,
      },
    ];

    var nearbyFriendCards = <SmallFriendCard>[];

    nearbyFriendsData.asMap().forEach((index, data) {
      nearbyFriendCards.add(
        SmallFriendCard(
          data: data,
          isSelected: index == selectedFriendCardIndex,
          onTap: () {
            setState(() {
              selectedFriendCardIndex = index;
            });
          },
        ),
      );
    });

    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Image(
              image: AssetImage("assets/images/friends_nearby_placeholder.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                "Friends nearby",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          ...nearbyFriendCards,
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  if (selectedFriendCardIndex != null) {
                    Navigator.pushNamed(
                      context,
                      "profile",
                      arguments: nearbyFriendsData[selectedFriendCardIndex!],
                    );
                  }
                },
                child: Text(
                  "Track friend",
                  style: Theme.of(context).textTheme.button,
                ),
                style: TextButton.styleFrom(
                  minimumSize: const Size(175, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                  backgroundColor: selectedFriendCardIndex != null
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Pin my location",
                  style: Theme.of(context).textTheme.button,
                ),
                style: TextButton.styleFrom(
                  minimumSize: const Size(175, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
