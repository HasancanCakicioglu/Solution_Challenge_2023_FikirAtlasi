import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/lang_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/lang/language.dart';


@RoutePage<Locale?>()
class SettingsLanguageOptionsPageView extends StatelessWidget {
  const SettingsLanguageOptionsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("selectLanguage").tr(),
      ),
      body: ListView.builder(
      itemCount:LanguageManager.supportedLocalesLanguages.length,
      itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          AutoRouter.of(context).pop(LanguageManager.supportedLocalesLanguages[index]);
        },
        child: ListTile(
        title: Text(LanguageManager.supportedLocalesLanguages[index].countryName()).tr(),
        subtitle: Text(LanguageManager.supportedLocalesLanguages[index].toString()),
        trailing: const Icon(Icons.arrow_back_ios),
      ),
      );
    },),
    );
  }
}