import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/lang_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/navigation/navigation_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Settings/mixin/settings_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/padding.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';

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
          "settings",
          style: Material3Design.largeText,
        ).tr(),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: Material3Design.mediumPadding,
          ),
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
      title.tr(),
      style: Material3Design.largeText,
    ).padded(const EdgeInsets.only(bottom: Material3Design.mediumPadding));
  }

  // Helper methods to create main sections
  Widget _buildThemeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("theme"),
        switchBox("themeLight", themeIsLight, (value) {
          changeTheme();
        }),
      ],
    );
  }

  Widget _buildNotificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("notifications"),
        switchBox("notificationopen", notificationIsOpen, changeNotification),
        clickedBox("locationSelect".tr(), () {
          context.router
              .pushNamed(NavigationConstants.GoogleMaps)
              .then((value) {
            if (value != null) {
              location = value as LatLng?;
              final geohash = getGeoFirePointUsecase.call(
                      location!.latitude, location!.longitude).hash;
              updateProfileUsecase.call(ProfileEntity(
                geoFirePoint: {
                  "geohash":geohash
                }
              ));
            }
          });
        })
      ],
    );
  }

  Widget _buildLanguageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("language"),
        clickedBox(
            localeLang.countryName(), takeActionBackFromSettingsOptionPage),
      ],
    );
  }

  Widget _buildVerificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("verification"),
        switchBox(
            "phoneverification", phoneVerification, phoneVerificationFunc),
      ],
    );
  }

  Widget _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("account"),
        clickedBox("changeaccount", signOutGoogle),
        clickedBox("exitaccount", signOutGoogle),
      ],
    );
  }

  // Helper methods to create UI components
  Widget switchBox(String text, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Material3Design.mediumText).tr(),
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
          Text(text, style: Material3Design.mediumText).tr(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ).padded(const EdgeInsets.only(bottom: Material3Design.mediumPadding)),
    );
  }
}
