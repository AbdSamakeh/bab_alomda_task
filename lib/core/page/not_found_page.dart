import 'package:flutter/material.dart';
import '../widget/app_bar/main_app_bar.dart';
import '../widget/button/refresh_button.dart';
import '../../generated/locale_keys.g.dart';

//Deafult Page If Routing Fail
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(title: LocaleKeys.someThingWentWrong),
      body: Center(
        child: RefreshButton(refreshTitle: LocaleKeys.someThingWentWrong),
      ),
    );
  }
}
