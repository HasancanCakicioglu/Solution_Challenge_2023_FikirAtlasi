import 'package:auto_route/auto_route.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Home/presentation/pages/home_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Splash/presentation/pages/splash_page.dart';


part 'app_router.gr.dart';            
              
@AutoRouterConfig(replaceInRouteName: "View,Route")      
class AppRouter extends _$AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [
    AutoRoute(page:SplashRoute.page, initial: true,path: "/Splash"), 
    AutoRoute(page:HomePageRoute.page,path: "/Home"), 

   ];
 }   