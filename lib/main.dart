import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sample_flutter/config/setup.dart';
import 'package:sample_flutter/config/theme.dart';
import 'package:sample_flutter/presentation/pages/search/search_page.dart';
import 'package:sample_flutter/presentation/pages/watchlist/watch_page.dart';

import 'presentation/pages/detail/detail_page.dart';
import 'presentation/pages/list/list_page.dart';
import 'presentation/pages/main/main_page.dart';
import 'presentation/pages/spalsh/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: darkColorScheme,
      ),
      routes: {
        SplashPage.routeName: (ctx) => SplashPage(),
        MainPage.routeName: (ctx) => const MainPage(),
        SearchPage.routeName: (ctx) => SearchPage(),
        WatchlistPage.routeName: (ctx) => WatchlistPage(),
        ListPage.routeName: (ctx) => ListPage(),
        DetailPage.routeName: (ctx) => DetailPage(),
      },
      initialRoute: SplashPage.routeName,
    );
  }
}
