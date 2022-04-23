import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trackyourdrunkfriend/profile_page.dart';
import 'package:trackyourdrunkfriend/side_menu.dart';
import 'package:trackyourdrunkfriend/text_theme.dart';
import 'color_scheme.dart';
import 'home_page.dart';

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
      home: PageNavigator(),
    );
  }
}

class PageNavigator extends StatelessWidget {
  PageNavigator({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Track your drunk friend",
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                child:
                    const Image(image: AssetImage("assets/images/me_pfp.png")),
                radius: 20,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )
        ],
      ),
      drawer: const SideMenu(),
      body: WillPopScope(
        onWillPop: () async {
          return !(await homeNavigatorKey.currentState!.maybePop());
        },
        child: Navigator(
          key: homeNavigatorKey,
          initialRoute: 'home',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case 'home':
                builder = (BuildContext context) => const HomePage();
                break;
              case 'profile':
                builder = (BuildContext context) =>
                    ProfilePage(data: settings.arguments as Map);
                break;
              default:
                throw Exception('Invalid route: ${settings.name}');
            }
            return MaterialPageRoute<void>(
                builder: builder, settings: settings);
          },
        ),
      ),
    );
  }
}
