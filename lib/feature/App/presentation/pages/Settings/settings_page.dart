import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/lang_extension.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Settings/mixin/settings_mixin.dart';

@RoutePage()
class SettingsPageView extends StatefulWidget {
  const SettingsPageView({super.key});

  @override
  State<SettingsPageView> createState() => _SettingsPageViewState();
}

class _SettingsPageViewState extends State<SettingsPageView>
    with SettingsMixin {
  bool tema = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ayarlar"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tema",
              style: TextStyle(fontSize: 20),
            ),
            switchBox("Aydınlık Tema", themeIsLight, (value) {
              changeTheme();
            }),
            const Divider(),
            const Text("Bildirimler"),
            switchBox("Bildirimleri Aç", notificationIsOpen, changeNotification),
            const Divider(),
            clickedBox(localeLang.countryName(), takeActionBackFromSettingsOptionPage),
            const Divider(),
            const Text("Doğrulama"),
            switchBox("Telefon Doğrulama", phoneVerification, phoneVerificationFunc),
            const Divider(),
            const Text("Hesap"),
            clickedBox("Hesap Değiştir",signOutGoogle),
            clickedBox("Hesaptan Çıkış yap",signOutGoogle),
          ],
        ));
  }

  Widget switchBox(String text, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Switch.adaptive(value: value, onChanged: onChanged),
      ],
    );
  }

  Widget clickedBox(String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
