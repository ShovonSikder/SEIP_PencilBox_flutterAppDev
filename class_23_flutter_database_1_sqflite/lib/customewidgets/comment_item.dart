import 'package:class_23_flutter_database_1_sqflite/models/movie_rating.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final MovieRating movieRating;
  const CommentItem({Key? key,required this.movieRating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text(movieRating.user_id.toString()),
          subtitle: Text(movieRating.rating_date),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star,color: Colors.amber,),
              Text(movieRating.rating.toString()),
            ],
          ),

        ),
        Padding(padding: EdgeInsets.all(4),child: Text(movieRating.user_reviews,textAlign: TextAlign.justify,),)
      ],
    );
  }
}
