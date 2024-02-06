import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/navigation/navigation_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_specialForYou/home_special_for_you_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/mixin/special_for_you_page_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_searched_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/index.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/get_searched_comments.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

class SpeacialForYouPageView extends StatefulWidget {
  const SpeacialForYouPageView({Key? key, required this.scrollControllerNested})
      : super(key: key);
  final ScrollController scrollControllerNested;

  @override
  State<SpeacialForYouPageView> createState() => _SpeacialForYouPageViewState();
}

class _SpeacialForYouPageViewState extends State<SpeacialForYouPageView>
    with AutomaticKeepAliveClientMixin, SpeacialForYouPageMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: RefreshIndicator(onRefresh: () async {
        context
            .read<HomeSpecialForYouCubit>()
            .getCommentProblemListLastRefresh();
      }, child: BlocBuilder<HomeSpecialForYouCubit, HomeSpecialForYouState>(
          builder: (context, state) {
        if (state is HomeSpecialForYouLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSpecialForYouLoaded) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollControllerSpecialForYouPage,
                  itemCount: state.comments.length,
                  itemBuilder: (context, index) {
                    return CommentsProblemCard(
                      commentProblemEntity: state.comments[index]!,
                    );
                  },
                ),
              ),
              if (state.isLoadingNewData)
                const Center(child: CircularProgressIndicator()),
              //if(state.isError) const Center(child: Icon(Icons.error)),
            ],
          );
        } else {
          return const Center(child: Text('Initial state'));
        }
      })),
      floatingActionButton: FloatingActionButton(
        heroTag:"btn1",
        onPressed: () async {
          //cloudfuncdeneme();
          //translateDeneme();
          //isDownloaded();
          //searched();
          //uploadFiles();
          //createComment();
          context.router.pushNamed(NavigationConstants.Post);
          //locationSelect();
        },
      ),
    );
  }

  void locationSelect(){
    
    
  }

  void createComment() async{
    CommentProblemEntity entity1 = CommentProblemEntity(
      profileId: "1",
      title: "Matematik Dersi Çözüm Bekliyorum",
      category: "Education",
      text: "Diferansiyel denklemlerle ilgili soruları anlamak gerçekten zor!",
      date: DateTime.now().toIso8601String(),
      tags: ["matematik", "ders", "öğrenme"],
      likeCount: 0,
    );

    CommentProblemEntity entity2 = CommentProblemEntity(
      profileId: "2",
      title: "Enflasyonun Etkileri",
      category: "Economy",
      text:
          "Yüksek enflasyonun, ekonomi üzerindeki olumsuz etkilerini anlamaya çalışıyorum. Fikirlerinizi paylaşın!",
      date: DateTime.now().toIso8601String(),
      tags: ["enflasyon", "ekonomi", "finans"],
      likeCount: 0,
    );

    CommentProblemEntity entity3 = CommentProblemEntity(
      profileId: "3",
      title: "Şehir İçi Ulaşımda Alternatifler",
      category: "Transportation",
      text:
          "Yoğun trafikte sıkışıp kalmaktan sıkıldım. Şehir içi ulaşımda daha etkili alternatifler neler?",
      date: DateTime.now().toIso8601String(),
      tags: ["ulaşım", "trafik", "alternatif"],
      likeCount: 0,
    );
    CommentProblemEntity entity4 = CommentProblemEntity(
      profileId: "4",
      title: "Hafta Sonu Eğlencesi",
      category: "Fun",
      text:
          "Sıkıcı bir hafta sonu geçiriyorum. Eğlenceli aktivite önerilerinizi bekliyorum!",
      date: DateTime.now().toIso8601String(),
      tags: ["eğlence", "hafta sonu", "aktivite"],
      likeCount: 0,
    );
    CommentProblemEntity entity5 = CommentProblemEntity(
      profileId: "5",
      title: "Quantum Fiziği Hakkında",
      category: "Science",
      text:
          "Quantum fiziği konusunda daha fazla bilgi edinmek istiyorum. Önerilerinizi bekliyorum!",
      date: DateTime.now().toIso8601String(),
      tags: ["quantum", "fizik", "bilim"],
      likeCount: 0,
    );
    CommentProblemEntity entity6 = CommentProblemEntity(
      profileId: "5",
      title: "Sağlıklı Beslenme Önerileri",
      category: "Health",
      text:
          "Dengeli ve sağlıklı beslenme konusunda yardıma ihtiyacım var. Sağlıklı tarifleriniz var mı?",
      date: DateTime.now().toIso8601String(),
      tags: ["sağlık", "beslenme", "tarif"],
      likeCount: 0,
    );
    CommentProblemEntity entity7 = CommentProblemEntity(
      profileId: "1",
      title: "Yeni Teknolojik Gelişmeler",
      category: "Technology",
      text:
          "En son teknolojik gelişmeleri takip etmek istiyorum. Sizce hangi teknolojiye yatırım yapmalıyım?",
      date: DateTime.now().toIso8601String(),
      tags: ["teknoloji", "gelişmeler", "yatırım"],
      likeCount: 0,
    );
    CommentProblemEntity entity8 = CommentProblemEntity(
      profileId: "2",
      title: "Sanat Galerileri ve Sergiler",
      category: "Art",
      text:
          "En güzel sanat galerileri ve sergiler hangileri? Sanat tutkunlarına önerilerinizi bekliyorum!",
      date: DateTime.now().toIso8601String(),
      tags: ["sanat", "galeri", "sergi"],
      likeCount: 0,
    );
    CommentProblemEntity entity9 = CommentProblemEntity(
      profileId: "1",
      title: "Spor Yapmaya Nasıl Başlarım?",
      category: "Sports",
      text:
          "Spor yapmaya başlamak istiyorum ancak nereden başlayacağımı bilemiyorum. Önerileriniz var mı?",
      date: DateTime.now().toIso8601String(),
      tags: ["spor", "egzersiz", "sağlıklı yaşam"],
      likeCount: 0,
    );

    await sl.get<CreateCommentProblemUsecase>().call(entity1).then((value){
      value.fold((l){
        print("hata oldu = ${l.title} ${l.message}");
      }, (r) => print("başarılı"));
    });
    sl.get<CreateCommentProblemUsecase>().call(entity2);
    sl.get<CreateCommentProblemUsecase>().call(entity3);
    sl.get<CreateCommentProblemUsecase>().call(entity4);
    sl.get<CreateCommentProblemUsecase>().call(entity5);
    sl.get<CreateCommentProblemUsecase>().call(entity6);
    sl.get<CreateCommentProblemUsecase>().call(entity7);
    sl.get<CreateCommentProblemUsecase>().call(entity8);
    sl.get<CreateCommentProblemUsecase>().call(entity9);
  }

  void uploadFiles() async {
    CommentProblemEntity entitym = CommentProblemEntity(
      profileId: "123456789",
      title: "çok sıkıldım ulaaaa",
      category: "Transport",
      text: "bu bir deneme textidir.",
      date: DateTime.now().toIso8601String(),
      tags: ["deneme", "deneme2"],
      likeCount: 0,
      uid: "LXOvD2O6haWBx8fNQiGY",
    );

    await sl.get<CreateCommentProblemUsecase>().call(entitym);


  }

  void searched() async {
    sl
        .get<GetSearchedCommentsUsecase>()
        .call("bu bir deneme textidir.")
        .then((value) => value.fold((l) {
              print("bu hatadır gelen dikkat ettttttttttttttt = $l");
            }, (r) {
              print("bU doğrudur gelen dikkat etttttttttttt = $r");
              var gelenler =
                  sl.get<GetCommentProblemListSearchedUsecase>().call(r);
              gelenler.then((value) {
                value.fold((l) {
                  print("hata oldu gelenler = ${l.title} ${l.message}");
                }, (r) {
                  print("başarılı gelenler = $r");
                  print(r!.length.toString());
                });
              });
            }));
  }

  void translateDeneme() async {
    const TranslateLanguage sourceLanguage = TranslateLanguage.turkish;
    const TranslateLanguage targetLanguage = TranslateLanguage.english;

    final onDeviceTranslator = OnDeviceTranslator(
        sourceLanguage: sourceLanguage, targetLanguage: targetLanguage);

    final String response =
        await onDeviceTranslator.translateText("Bu bir deneme mesajıdır.");

    onDeviceTranslator.close();
  }

  void isDownloaded() async {
    final modelManager = OnDeviceTranslatorModelManager();

    final bool response =
        await modelManager.isModelDownloaded(TranslateLanguage.english.bcpCode);

    final bool response2 = await modelManager
        .isModelDownloaded(TranslateLanguage.albanian.bcpCode);
  }

  void cloudfuncdeneme() async {
    HttpsCallable callable =
        FirebaseFunctions.instanceFor(region: 'europe-west3').httpsCallable(
      'semanticSearch',
      options: HttpsCallableOptions(
        timeout: const Duration(seconds: 5),
      ),
    );
    await callable(<String, dynamic>{"text": "gelen data budur moruk"})
        .then((value) {
      // JSON'u parse et
      
    });
  }

  @override
  bool get wantKeepAlive => true;
}
