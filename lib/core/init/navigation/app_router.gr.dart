// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthPageView(),
      );
    },
    AuthStatePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthStatePageView(),
      );
    },
    CategoryListPageRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryListPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CategoryListPageView(
          key: args.key,
          categoryCardModel: args.categoryCardModel,
        ),
      );
    },
    HomePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePageView(),
      );
    },
    MainWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainWrapperView(),
      );
    },
    ProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilePageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePageView(
          key: args.key,
          profileID: args.profileID,
        ),
      );
    },
    SettingsLanguageOptionsPageRoute.name: (routeData) {
      return AutoRoutePage<Locale?>(
        routeData: routeData,
        child: const SettingsLanguageOptionsPageView(),
      );
    },
    SettingsPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPageView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
  };
}

/// generated route for
/// [AuthPageView]
class AuthPageRoute extends PageRouteInfo<void> {
  const AuthPageRoute({List<PageRouteInfo>? children})
      : super(
          AuthPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthStatePageView]
class AuthStatePageRoute extends PageRouteInfo<void> {
  const AuthStatePageRoute({List<PageRouteInfo>? children})
      : super(
          AuthStatePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthStatePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryListPageView]
class CategoryListPageRoute extends PageRouteInfo<CategoryListPageRouteArgs> {
  CategoryListPageRoute({
    Key? key,
    required CategoryCardModel categoryCardModel,
    List<PageRouteInfo>? children,
  }) : super(
          CategoryListPageRoute.name,
          args: CategoryListPageRouteArgs(
            key: key,
            categoryCardModel: categoryCardModel,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryListPageRoute';

  static const PageInfo<CategoryListPageRouteArgs> page =
      PageInfo<CategoryListPageRouteArgs>(name);
}

class CategoryListPageRouteArgs {
  const CategoryListPageRouteArgs({
    this.key,
    required this.categoryCardModel,
  });

  final Key? key;

  final CategoryCardModel categoryCardModel;

  @override
  String toString() {
    return 'CategoryListPageRouteArgs{key: $key, categoryCardModel: $categoryCardModel}';
  }
}

/// generated route for
/// [HomePageView]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute({List<PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainWrapperView]
class MainWrapperRoute extends PageRouteInfo<void> {
  const MainWrapperRoute({List<PageRouteInfo>? children})
      : super(
          MainWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePageView]
class ProfilePageRoute extends PageRouteInfo<ProfilePageRouteArgs> {
  ProfilePageRoute({
    Key? key,
    required String profileID,
    List<PageRouteInfo>? children,
  }) : super(
          ProfilePageRoute.name,
          args: ProfilePageRouteArgs(
            key: key,
            profileID: profileID,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilePageRoute';

  static const PageInfo<ProfilePageRouteArgs> page =
      PageInfo<ProfilePageRouteArgs>(name);
}

class ProfilePageRouteArgs {
  const ProfilePageRouteArgs({
    this.key,
    required this.profileID,
  });

  final Key? key;

  final String profileID;

  @override
  String toString() {
    return 'ProfilePageRouteArgs{key: $key, profileID: $profileID}';
  }
}

/// generated route for
/// [SettingsLanguageOptionsPageView]
class SettingsLanguageOptionsPageRoute extends PageRouteInfo<void> {
  const SettingsLanguageOptionsPageRoute({List<PageRouteInfo>? children})
      : super(
          SettingsLanguageOptionsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsLanguageOptionsPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPageView]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute({List<PageRouteInfo>? children})
      : super(
          SettingsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
