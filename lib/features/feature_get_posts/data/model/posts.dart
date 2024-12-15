import 'package:clfl/features/feature_get_posts/domain/entities/entities.dart';

class PostsModel extends PostEntities {
  const PostsModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          body: body,
        );

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
