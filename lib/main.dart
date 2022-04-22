import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackyourdrunkfriend/nearby_friend_card.dart';
import 'package:trackyourdrunkfriend/text_theme.dart';
import 'color_scheme.dart';

void main() {
  runApp(const TrackYourDrunkFriend());
}

class TrackYourDrunkFriend extends StatelessWidget {
  const TrackYourDrunkFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track your drunk friend',
      theme: ThemeData(
        scaffoldBackgroundColor: colorScheme.primary,
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nearbyFriendsData = {
      {
        "name": "Sanna",
        "status": "Hello my buddys!",
        "profilePicture": "",
        "profileColor": Theme.of(context).colorScheme.tertiary,
      },
      {
        "name": "Esko",
        "status": "What's up?",
        "profilePicture": "",
        "profileColor": Theme.of(context).colorScheme.secondary,
      },
      {
        "name": "Maria",
        "status": "Una cerveza por favor :)",
        "profilePicture": "",
        "profileColor": Theme.of(context).colorScheme.primary,
      },
    };

    var nearbyFriendCards = <NearbyFriendCard>[];

    for (var data in nearbyFriendsData) {
      nearbyFriendCards.add(NearbyFriendCard(data: data));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Track your drunk friend",
          style: Theme.of(context).textTheme.headline1,
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  child: Icon(
                    Icons.person,
                  ),
                  radius: 20,
                )),
          )
        ],
      ),
      body: ListView(
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
                onPressed: () {},
                child: Text(
                  "Track friend",
                  style: Theme.of(context).textTheme.button,
                ),
                style: TextButton.styleFrom(
                  minimumSize: const Size(175, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
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
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
