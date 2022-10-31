import 'package:class_23_flutter_database_1_sqflite/customewidgets/comment_item.dart';
import 'package:class_23_flutter_database_1_sqflite/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCommentWidget extends StatefulWidget {
  final int movieId;
  const AllCommentWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  State<AllCommentWidget> createState() => _AllCommentWidgetState();
}

class _AllCommentWidgetState extends State<AllCommentWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    return Center(
      child: FutureBuilder(
          future: provider.getCommentsByMovieId(widget.movieId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final commentList = snapshot.data!;
              return ListView.builder(
                itemCount: commentList.length,
                itemBuilder: (context, index) {
                  return CommentItem(movieRating: commentList[index]);
                },
              );
            }
            if (snapshot.hasError) {
              return Text('Lodaing Error');
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
