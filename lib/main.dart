import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controllers/controller.dart';
import 'controllers/theme_controller.dart';
import 'screens/home.dart';
import 'screens/landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setPathUrlStrategy();
  await GetStorage.init();
  runApp(MyApp());
}

final constantValues = Get.put(Constants());

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class ThemeProvider with ChangeNotifier {
  ThemeMode selectedThemeMode = ThemeMode.system;

  setSelectedThemeMode(bool comparator) {
    selectedThemeMode = comparator ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

var userInfo = GetStorage();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = GoRouter(routes: [
    GoRoute(
      name: "landing",
      path: "/",
      builder: (context, state) => const Landing(),
    ),
    GoRoute(
      name: "home",
      path: "/home",
      builder: (context, state) => const Home(),
    ),
  ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    userInfo.writeIfNull("isDarkTheme", false);
    userInfo.writeIfNull("selectedOrganization", "huawei");
    final constantValues = Get.put(Constants());
    var color = constantValues.defaultColor;
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData(
          primarySwatch: MaterialColor(0xFF00FF00, color),
          brightness: userInfo.read("isDarkTheme")
              ? Brightness.dark
              : Brightness.light)),
      child:
          MaterialAppWithTheme(router: router, constantValues: constantValues),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    super.key,
    required GoRouter router,
    required this.constantValues,
  }) : _router = router;

  final GoRouter _router;
  final Constants constantValues;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      routerConfig: _router,
      title: "David Joanes Kemdirim",
      theme: theme.getTheme(),
    );
  }
}
