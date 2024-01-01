import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_tags_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

class SpeacialForYouPageView extends StatefulWidget {
  const SpeacialForYouPageView({Key? key}) : super(key: key);

  @override
  State<SpeacialForYouPageView> createState() => _SpeacialForYouPageViewState();
}

class _SpeacialForYouPageViewState extends State<SpeacialForYouPageView> with AutomaticKeepAliveClientMixin{
  ScrollController _scrollController = ScrollController();
  List<String> items = List.generate(50, (index) => 'Item ${index + 10}');
  List<CommentProblemEntity> comments = [];
  bool _isLoadingMore = false;
  var lastVisible = null;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
            print("girdi scrooöl extnet");
        _onLoadMore(lastVisible); // Trigger bottom refresh when scrolled to end
      }
    });
    sl.get<GetCommentProblemListAccordingToTagsUsecase>().call(
        ["ekonomi", "ulaşım", "sanat"], null,
        gettingData: 1).then((value) {
      value.fold(
        (l) => print("null geldi"),
        (r) {
          comments.addAll(r.value1 as Iterable<CommentProblemEntity>);
          lastVisible = r.value2;
        },
      );
    }).then((value) => newgo());

    Future.delayed(const Duration(seconds: 3)).then((value) => _onLoadMore(lastVisible));
  }

  void newgo() async{
    setState(() {
      _isLoadingMore = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          controller: _scrollController,
          key: const PageStorageKey('pageOne'),
          itemCount: _isLoadingMore ? comments.length + 1 : comments.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == comments.length) {
              // Display a loading indicator at the bottom
              return _buildLoadingMoreIndicator();
            } else {
              return ListTile(
                title: Text(comments[index].title!),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    // Handle top refresh logic here
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // Reset the list to the initial state when pulled from the top
      items = List.generate(50, (index) => 'Item ${index + 10}');
    });
  }

  Future<void> _onLoadMore(lastVisible) async {
    // Handle bottom refresh logic here, add more items
    setState(() {
      _isLoadingMore = true;
    });
    sl.get<GetCommentProblemListAccordingToTagsUsecase>().call(
        ["ekonomi", "ulaşım", "sanat"], lastVisible,
        gettingData: 1).then((value) {
      value.fold(
        (l) => print("null geldi"),
        (r) => comments.addAll(r.value1 as Iterable<CommentProblemEntity>),
      );
    }).then((value) => newgo());
  }

  Widget _buildLoadingMoreIndicator() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
