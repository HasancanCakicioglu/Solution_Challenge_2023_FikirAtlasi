import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/lang_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Settings/mixin/settings_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/padding.dart';

/// Settings page that allows users to configure various app settings.
@RoutePage()
class SettingsPageView extends StatefulWidget {
  const SettingsPageView({Key? key}) : super(key: key);

  @override
  State<SettingsPageView> createState() => _SettingsPageViewState();
}

class _SettingsPageViewState extends State<SettingsPageView>
    with SettingsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ayarlar",
          style: Material3Design.largeText,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          // Main sections
          _buildThemeSection(),
          const Divider(),
          _buildNotificationSection(),
          const Divider(),
          _buildLanguageSection(),
          const Divider(),
          _buildVerificationSection(),
          const Divider(),
          _buildAccountSection(),
        ],
      ).paddedHorizontal(Material3Design.largePagePadding),
    );
  }

  // Helper method to create a section title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Material3Design.largeText,
    ).padded(const EdgeInsets.only(bottom: Material3Design.mediumPadding));
  }

  // Helper methods to create main sections
  Widget _buildThemeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Tema"),
        switchBox("Aydınlık Tema", themeIsLight, (value) {
          changeTheme();
        }),
      ],
    );
  }

  Widget _buildNotificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Bildirimler"),
        switchBox("Bildirimleri Aç", notificationIsOpen, changeNotification),
      ],
    );
  }

  Widget _buildLanguageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Dil"),
        clickedBox(localeLang.countryName(), takeActionBackFromSettingsOptionPage),
      ],
    );
  }

  Widget _buildVerificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Doğrulama"),
        switchBox("Telefon Doğrulama", phoneVerification, phoneVerificationFunc),
      ],
    );
  }

  Widget _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Hesap"),
        clickedBox("Hesap Değiştir", signOutGoogle),
        clickedBox("Hesaptan Çıkış yap", signOutGoogle),
      ],
    );
  }

  // Helper methods to create UI components
  Widget switchBox(String text, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Material3Design.mediumText),
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
          Text(text, style: Material3Design.mediumText),
          const Icon(Icons.arrow_forward_ios),
        ],
      ).padded(const EdgeInsets.only(bottom: Material3Design.mediumPadding)),
    );
  }
}
