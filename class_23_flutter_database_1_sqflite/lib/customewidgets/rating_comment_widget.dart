import 'package:class_23_flutter_database_1_sqflite/models/movie_rating.dart';
import 'package:class_23_flutter_database_1_sqflite/providers/user_provider.dart';
import 'package:class_23_flutter_database_1_sqflite/utils/constants.dart';
import 'package:class_23_flutter_database_1_sqflite/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class RatingCommentWidget extends StatefulWidget {
  final int movieId;
  final VoidCallback onComplete;
  const RatingCommentWidget(
      {Key? key, required this.movieId, required this.onComplete})
      : super(key: key);

  @override
  State<RatingCommentWidget> createState() => _RatingCommentWidgetState();
}

class _RatingCommentWidgetState extends State<RatingCommentWidget> {
  late UserProvider userProvider;
  final txtController = TextEditingController();
  final foucuseNode = FocusNode();

  double rating = 1;

  @override
  void dispose() {
    // TODO: implement dispose
    txtController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    userProvider = Provider.of<UserProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Rate this Movie',
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                itemCount: 5,
                allowHalfRating: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                direction: Axis.horizontal,
                itemBuilder: (context, value) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                onRatingUpdate: (value) {
                  rating = value;
                }),
          ),
          const Text(
            'Leave a comment',
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: txtController,
              focusNode: foucuseNode,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TextButton(
            onPressed: _submit,
            child: Text(
              'Submit',
            ),
          ),
        ],
      ),
    );
  }

  void _submit() async {
    if (txtController.text.isEmpty) {
      showMsg(context, 'Please leave a comment');
      return;
    }
    final movieRating = MovieRating(
        movie_id: widget.movieId,
        user_id: userProvider.userModel.userId!,
        rating_date: getFormatedDate(DateTime.now(), dateTimePattern),
        user_reviews: txtController.text,
        rating: rating);
    final didUserRate = await userProvider.didUserRate(widget.movieId);

    if (didUserRate) {
      //update
      userProvider.updateRating(movieRating).then((value) {
        txtController.clear();
        foucuseNode.unfocus();
        widget.onComplete();
      }).catchError((err) {
        print(err);
      });
    } else {
      //insert
      userProvider.insertRating(movieRating).then((value) {
        txtController.clear();
        foucuseNode.unfocus();
        widget.onComplete();
      }).catchError((err) {
        print(err);
      });
    }
  }
}
