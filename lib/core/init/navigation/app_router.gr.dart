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
    AuthRegisterPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthRegisterPageView(),
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
    CommentProblemPageRoute.name: (routeData) {
      final args = routeData.argsAs<CommentProblemPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommentProblemPageView(
          key: args.key,
          commentProblemEntity: args.commentProblemEntity,
        ),
      );
    },
    CommentSuggestionPageRoute.name: (routeData) {
      final args = routeData.argsAs<CommentSuggestionPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommentSuggestionPageView(
          key: args.key,
          commentSuggestionEntity: args.commentSuggestionEntity,
        ),
      );
    },
    GoogleMapsPageRoute.name: (routeData) {
      return AutoRoutePage<LatLng?>(
        routeData: routeData,
        child: const GoogleMapsPageView(),
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
    PostPageRoute.name: (routeData) {
      final args = routeData.argsAs<PostPageRouteArgs>(
          orElse: () => const PostPageRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PostPageView(
          key: args.key,
          isProblem: args.isProblem,
          commentID: args.commentID,
        ),
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
/// [AuthRegisterPageView]
class AuthRegisterPageRoute extends PageRouteInfo<void> {
  const AuthRegisterPageRoute({List<PageRouteInfo>? children})
      : super(
          AuthRegisterPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRegisterPageRoute';

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
/// [CommentProblemPageView]
class CommentProblemPageRoute
    extends PageRouteInfo<CommentProblemPageRouteArgs> {
  CommentProblemPageRoute({
    Key? key,
    required CommentProblemEntity commentProblemEntity,
    List<PageRouteInfo>? children,
  }) : super(
          CommentProblemPageRoute.name,
          args: CommentProblemPageRouteArgs(
            key: key,
            commentProblemEntity: commentProblemEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentProblemPageRoute';

  static const PageInfo<CommentProblemPageRouteArgs> page =
      PageInfo<CommentProblemPageRouteArgs>(name);
}

class CommentProblemPageRouteArgs {
  const CommentProblemPageRouteArgs({
    this.key,
    required this.commentProblemEntity,
  });

  final Key? key;

  final CommentProblemEntity commentProblemEntity;

  @override
  String toString() {
    return 'CommentProblemPageRouteArgs{key: $key, commentProblemEntity: $commentProblemEntity}';
  }
}

/// generated route for
/// [CommentSuggestionPageView]
class CommentSuggestionPageRoute
    extends PageRouteInfo<CommentSuggestionPageRouteArgs> {
  CommentSuggestionPageRoute({
    Key? key,
    required CommentSuggestionEntity commentSuggestionEntity,
    List<PageRouteInfo>? children,
  }) : super(
          CommentSuggestionPageRoute.name,
          args: CommentSuggestionPageRouteArgs(
            key: key,
            commentSuggestionEntity: commentSuggestionEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentSuggestionPageRoute';

  static const PageInfo<CommentSuggestionPageRouteArgs> page =
      PageInfo<CommentSuggestionPageRouteArgs>(name);
}

class CommentSuggestionPageRouteArgs {
  const CommentSuggestionPageRouteArgs({
    this.key,
    required this.commentSuggestionEntity,
  });

  final Key? key;

  final CommentSuggestionEntity commentSuggestionEntity;

  @override
  String toString() {
    return 'CommentSuggestionPageRouteArgs{key: $key, commentSuggestionEntity: $commentSuggestionEntity}';
  }
}

/// generated route for
/// [GoogleMapsPageView]
class GoogleMapsPageRoute extends PageRouteInfo<void> {
  const GoogleMapsPageRoute({List<PageRouteInfo>? children})
      : super(
          GoogleMapsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'GoogleMapsPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [PostPageView]
class PostPageRoute extends PageRouteInfo<PostPageRouteArgs> {
  PostPageRoute({
    Key? key,
    bool isProblem = true,
    String? commentID,
    List<PageRouteInfo>? children,
  }) : super(
          PostPageRoute.name,
          args: PostPageRouteArgs(
            key: key,
            isProblem: isProblem,
            commentID: commentID,
          ),
          initialChildren: children,
        );

  static const String name = 'PostPageRoute';

  static const PageInfo<PostPageRouteArgs> page =
      PageInfo<PostPageRouteArgs>(name);
}

class PostPageRouteArgs {
  const PostPageRouteArgs({
    this.key,
    this.isProblem = true,
    this.commentID,
  });

  final Key? key;

  final bool isProblem;

  final String? commentID;

  @override
  String toString() {
    return 'PostPageRouteArgs{key: $key, isProblem: $isProblem, commentID: $commentID}';
  }
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
