import 'package:flutter/material.dart';

class LargeFriendCard extends StatefulWidget {
  const LargeFriendCard({Key? key, required this.data}) : super(key: key);

  final Map data;

  @override
  State<LargeFriendCard> createState() => _LargeFriendCardState();
}

class _LargeFriendCardState extends State<LargeFriendCard> {
  String? remindTimeValue;
  List<String> remindTimeOptions = <String>[
    "15 min",
    "30 min",
    "45 min",
    "60 min"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: AspectRatio(
              aspectRatio: 1.75,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.topCenter,
                    image: AssetImage(widget.data["profilePictureLarge"]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: widget.data["profileColor"],
                            child: Text(
                              widget.data["name"].toString().substring(0, 1),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
                                      color: widget.data["profileColor"]
                                                  .computeLuminance() >
                                              0.5
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
                                widget.data["name"],
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                widget.data["status"],
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: null,
                    minLines: 2,
                    maxLines: 2,
                    maxLength: 140,
                    controller: TextEditingController()
                      ..text =
                          "Hi ${widget.data["name"]}, I have sent you a request to track your location for tonight.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      maximumSize: const Size(120, 50),
                    ),
                    onPressed: () {},
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isDense: true,
                        underline: null,
                        value: remindTimeValue,
                        iconEnabledColor:
                            Theme.of(context).colorScheme.secondary,
                        hint: Text(
                          "Set time",
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                        selectedItemBuilder: (BuildContext context) {
                          return remindTimeOptions.map((String value) {
                            return Text(
                              remindTimeValue ?? "",
                              style: const TextStyle(color: Colors.black),
                            );
                          }).toList();
                        },
                        items: remindTimeOptions
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            remindTimeValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
