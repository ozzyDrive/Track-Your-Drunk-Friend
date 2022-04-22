import 'package:flutter/material.dart';

class NearbyFriendCard extends StatelessWidget {
  const NearbyFriendCard({Key? key, required this.data}) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: Container(
          width: 325,
          height: 75,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: data["profileColor"],
                  child: Text(
                    data["name"].toString().substring(0, 1),
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: data["profileColor"].computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["name"],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      data["status"],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
