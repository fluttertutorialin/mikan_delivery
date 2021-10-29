import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../resource/icon.dart';
import '../../resource/string_value.dart';
import '../../route_navigation/route.dart';
import '../../resource/app_color.dart';
import '../widget/form_button_widget.dart';
import '../widget/text_field_component.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
            statusBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        child: Scaffold(
            body: SafeArea(
                child: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: SizedBox(height: Get.height / 3.5)),
          _loginForm()
        ]))));
  }

  _loginForm() {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        sliver: SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Get.theme.backgroundColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(16.0))),
                child: Column(children: [
                  const Text(loginTitleString,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          height: 1.25)),
                  const Text(loginDescriptionString,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          height: 1.25)),
                  const SizedBox(height: 16),
                  const TextFieldComponent(
                      hintText: emailHintString,
                      suffixIcon: Icon(emailTextFieldIcon)),
                  const SizedBox(height: 16),
                  const TextFieldComponent(
                      hintText: passwordHintString,
                      suffixIcon: Icon(passwordHideTextFieldIcon)),
                  const SizedBox(height: 16),
                  SizedBox(
                      width: Get.width,
                      child: FormButtonWidget(
                          onPressed: () {
                            Get.offAllNamed(homeRoute);
                          },
                          text: const Text(loginButtonString,
                              style: TextStyle(color: whiteColor))))
                ]))));
  }
}
