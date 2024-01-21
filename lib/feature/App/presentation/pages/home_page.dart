import 'dart:math';

import 'package:auto_route/auto_route.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/theme/cubit/app_theme_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/create_comment_problem_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/create_profile_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_tags_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

@RoutePage()
class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Home Page"),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeCubit>(context)
                    .changeTheme(brightness: Brightness.light);
              },
              child: const Text("Light")),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeCubit>(context)
                    .changeTheme(brightness: Brightness.dark);
              },
              child: const Text("Dark")),
          ElevatedButton(
              onPressed: () {
                signOutGoogle();
              },
              child: const Text("GOOGLE SİGN OUT")),
          ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).replaceNamed("/AuthState");
              },
              child: const Text("GO TO AUTH STATE PAGE")),
          ElevatedButton(
              onPressed: () {
                sl.get<CreateProfileUsecase>().call(ProfileEntity(
                    uid: FirebaseAuth.instance.currentUser!.uid,
                    name: "test",
                    surname: "test",
                    email: "test",
                    dateOfJoin: DateTime.now(),
                    profileUrl: "test",
                    describeYourself: "test",
                    lastLookedContents: "test"));
              },
              child: const Text("create profile")),
          ElevatedButton(
              onPressed: () async {
                await sl
                    .get<CreateCommentProblemUsecase>()
                    .call(CommentProblemEntity(
                        uid: FirebaseAuth.instance.currentUser!.uid,
                        profileId: "test",
                        title: "test",
                        category: "test",
                        text: "test",
                        date: DateTime.now(),
                        tags: ["test"],
                        photoURL: "test",
                        videoURL: "test",
                        hasGoogleMaps: true,
                        likeCount: 1,
                        pdf: "test"))
                    .then((value) => value.fold((l) => print("left $l"),
                        (r) => print("right ${e.toString()}")));
              },
              child: const Text("createCommentProblem")),
          ElevatedButton(
              onPressed: () async {
                List<String> availableTags = [
                  "ekonomi",
                  "ulaşım",
                  "eğitim",
                  "sanat",
                  "spor"
                ];

                for (int i = 0; i < 10; i++) {
                  String randomTag =
                      availableTags[Random().nextInt(availableTags.length)];

                  await sl.get<CreateCommentProblemUsecase>().call(
                        CommentProblemEntity(
                          uid: FirebaseAuth.instance.currentUser!.uid,
                          profileId: "test",
                          title: "Title $i", // Her öğe için farklı başlık
                          category:
                              "Category $i", // Her öğe için farklı kategori
                          text: "Text $i", // Her öğe için farklı metin
                          date: DateTime.now(),
                          tags: [randomTag], // Rastgele bir etiket
                          photoURL: "test",
                          videoURL: "test",
                          hasGoogleMaps: true,
                          likeCount:
                              Random().nextInt(100), // Rastgele like sayısı
                          pdf: "test",
                        ),
                      );
                      print("finish one");
                }
              },
              child: const Text("createCommentProblem 10")),
              ElevatedButton(
              onPressed: () async{
               await sl.get<GetCommentProblemListAccordingToTagsUsecase>().call(["ekonomi","sanat"],null,gettingData: 3).then((value) => value.fold((l) => print("left $l"), (r) {
                var listem = r.value1;
                var startem = r.value2;

                print(listem);
                print(startem);
               }));
              },
              child: const Text("get data ")),
        ],
      )),
    );
  }
}

Future<void> signOutGoogle() async {
  FirebaseAuth.instance.signOut();
}
