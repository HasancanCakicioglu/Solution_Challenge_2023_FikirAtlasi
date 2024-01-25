import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';


class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget(
      {super.key, required this.text,this.tabbar, this.action,this.profileID});
  final String text;
  final TabBar? tabbar;
  final List<Widget>? action;
  final String? profileID;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        leading: profilePageRoute(context),
        actions: action != null
            ? [...action!, settingPageRoute(context)]
            : [settingPageRoute(context)],
        title: Text(text),
        centerTitle: true,
        floating: true,
        snap: true,
        pinned: false,
        bottom: tabbar);
  }

  IconButton profilePageRoute(BuildContext context){
    
    return IconButton(onPressed: (){
          AutoRouter.of(context).push(ProfilePageRoute(profileID: profileID ?? FirebaseAuth.instance.currentUser!.uid));
        }, icon: const Icon(Icons.person));
  }

  IconButton settingPageRoute(BuildContext context){
    return IconButton(onPressed: (){
          AutoRouter.of(context).push(const SettingsPageRoute());
        }, icon: const Icon(Icons.settings));
  }


}
