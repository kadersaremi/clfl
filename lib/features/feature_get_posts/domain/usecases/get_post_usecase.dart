import 'package:clfl/core/usecase/usecase.dart';
import 'package:clfl/features/feature_get_posts/domain/entities/entities.dart';
import 'package:clfl/features/feature_get_posts/domain/repositories/repositories.dart';

class GetPostsUseCase implements UseCase<List<PostEntities>, void> {
  final PostsRepository postsRepository;

  GetPostsUseCase({required this.postsRepository});
  @override
  Future<List<PostEntities>> call({void params}) {
    return postsRepository.getPosts();
  }
}
