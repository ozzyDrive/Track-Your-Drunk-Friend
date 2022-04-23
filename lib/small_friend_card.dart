import 'package:flutter/material.dart';

class SmallFriendCard extends StatelessWidget {
  const SmallFriendCard({
    Key? key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final Map data;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 350,
            height: 75,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: isSelected ? 5 : 0,
              ),
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
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image(
                    image: AssetImage(data["profilePicture"]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
