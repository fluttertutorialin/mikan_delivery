import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
            theme: ThemeData(
                backgroundColor: Colors.white,
                primaryColor: primaryColor,
                primarySwatch: primarySwatchColor,
                secondaryHeaderColor: accentColor,
                iconTheme: const IconThemeData(color: iconThemeColor),
                textTheme: GoogleFonts.getTextTheme('Poppins')),
            debugShowCheckedModeBanner: false,
            initialRoute: loginRoute,
            getPages: AppPage.pages));
  }
}
