import 'package:clfl/features/feature_get_posts/domain/entities/entities.dart';

abstract class PostsRepository {
  Future<List<PostEntities>> getPosts();
}
