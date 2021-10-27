import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'util/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'resource/app_color.dart';
import 'route_navigation/app_module.dart';
import 'route_navigation/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        headerTriggerDistance: 80.0,
        enableScrollWhenRefreshCompleted: true,
        enableLoadingWhenFailed: true,
        hideFooterWhenNotFull: false,
        enableBallisticLoad: true,
        child: GetMaterialApp(
            scrollBehavior: normalScrollBehavior,
            theme: ThemeData(
                colorScheme: ColorScheme.light(
                    primary: primaryColor,
                    primaryVariant: primaryColor.darken(0.2),
                    secondary: accentColor,
                    secondaryVariant: accentColor.darken(0.36),
                    background: backgroundColor,
                    surface: backgroundColor),
                visualDensity: VisualDensity.standard,
                backgroundColor: backgroundColor,
                primaryColor: primaryColor,
                primarySwatch: primarySwatchColor,
                secondaryHeaderColor: accentColor,
                bottomAppBarColor: bottomBarBackgroundColor,
                scaffoldBackgroundColor: scaffoldBackgroundColor,
                iconTheme: const IconThemeData(color: iconThemeColor),
                textTheme: GoogleFonts.getTextTheme('Poppins')),
            debugShowCheckedModeBanner: false,
            initialRoute: loginRoute,
            getPages: AppPage.pages));
  }
}

final normalScrollBehavior = const ScrollBehavior().copyWith(
  scrollbars: false,
  dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
  physics: const BouncingScrollPhysics(),
  platform: TargetPlatform.iOS,
);
