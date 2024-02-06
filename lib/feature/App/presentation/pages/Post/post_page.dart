import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bloc_post/post_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Post/post_body.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

@RoutePage()
class PostPageView extends StatefulWidget {
  const PostPageView({Key? key,this.isProblem = true,this.commentID}) : super(key: key);
  final bool isProblem;
  final String? commentID;

  @override
  State<PostPageView> createState() => _PostPageViewState();
}

class _PostPageViewState extends State<PostPageView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<PostBloc>(),
      
      child: PostBody(isProblem: widget.isProblem,commendID: widget.commentID,)
    );
  }
}
