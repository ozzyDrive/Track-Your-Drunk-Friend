import 'package:flutter/material.dart';
import 'package:trackyourdrunkfriend/large_friend_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.data}) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              maximumSize: const Size(100, 50),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 21,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      "Back",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 32),
          child: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Directions to friend",
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ),
        LargeFriendCard(data: data),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: const Size(200, 50),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              "Request to track",
              style: Theme.of(context).textTheme.button,
            ),
          ),
        )
      ],
    );
  }
}
