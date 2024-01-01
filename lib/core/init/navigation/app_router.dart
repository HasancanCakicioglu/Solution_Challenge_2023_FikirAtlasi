import 'package:auto_route/auto_route.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/main/main_wrapper.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/pages/auth_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/pages/auth_state_wrapper.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/home_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Splash/presentation/pages/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // Login Routes
        AutoRoute(
            page: AuthStatePageRoute.page, initial: true, path: "/AuthState"),
        AutoRoute(page: SplashRoute.page, path: "/Splash"),
        AutoRoute(page: AuthPageRoute.page, path: "/Auth"),

        AutoRoute(page: MainWrapperRoute.page, path: "/MainWrapper"),

        AutoRoute(page: HomePageRoute.page, path: "/Home"),
      ];
}
