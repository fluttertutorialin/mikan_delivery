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
                inputDecorationTheme: InputDecorationTheme(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    disabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    prefixStyle: TextStyle(color: accentColor),
                    suffixStyle: TextStyle(color: accentColor),
                    focusColor: accentColor,
                    hintStyle: const TextStyle(height: 1.4, fontSize: 14.0),
                    labelStyle: const TextStyle(fontSize: 14.0)),
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
                textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                        elevation: MaterialStateProperty.all(1),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12)),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.focused)) {
                            return accentColor.withOpacity(0.8);
                          }
                          if (states.contains(MaterialState.hovered)) {
                            return accentColor.withOpacity(0.8);
                          }
                          if (states.contains(MaterialState.pressed)) {
                            return accentColor.withOpacity(0.8);
                          }
                          return null;
                        }),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 15)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primarySwatchColor))),
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
