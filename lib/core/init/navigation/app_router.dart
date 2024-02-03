import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/navigation/navigation_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/main/main_wrapper.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/data/models/category_card_model.dart';

import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Category/category_list_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Problem/comment_problem_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Suggest/comment_suggest_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/google_maps_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Post/post_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Profile/profile_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Settings/settings_language_options.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Settings/settings_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/pages/auth_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/pages/auth_state_wrapper.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/home_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/pages/register_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Splash/presentation/pages/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // Login Routes
        AutoRoute(
            page: AuthStatePageRoute.page, initial: true, path: NavigationConstants.AuthState),
        AutoRoute(page: SplashRoute.page, path: NavigationConstants.Splash),
        AutoRoute(page: AuthPageRoute.page, path: NavigationConstants.Auth),

        AutoRoute(page: MainWrapperRoute.page, path: NavigationConstants.mainWrapper),

        AutoRoute(page: CategoryListPageRoute.page, path: NavigationConstants.CategoryList),

        AutoRoute(page: HomePageRoute.page, path: NavigationConstants.Home),

        AutoRoute(page: ProfilePageRoute.page,path: NavigationConstants.Profile),
        AutoRoute(page: SettingsPageRoute.page,path:NavigationConstants.Settings),

        AutoRoute(page: SettingsLanguageOptionsPageRoute.page,path:NavigationConstants.SettingsLanguageOptions),

        AutoRoute(page: PostPageRoute.page,path:NavigationConstants.Post),

        AutoRoute(page: GoogleMapsPageRoute.page,path:NavigationConstants.GoogleMaps),

        AutoRoute(page: CommentProblemPageRoute.page,path:NavigationConstants.CommentsPage),
        AutoRoute(page: CommentSuggestionPageRoute.page,path:NavigationConstants.SuggestionsPage),

        AutoRoute(page: AuthRegisterPageRoute.page,path:NavigationConstants.RegisterPage),
        
      ];
}
