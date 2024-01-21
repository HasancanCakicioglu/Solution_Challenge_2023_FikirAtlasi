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
