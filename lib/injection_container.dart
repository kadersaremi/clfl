import 'package:clfl/features/feature_get_posts/data/data_source/remote/get_posts_api_service.dart';
import 'package:clfl/features/feature_get_posts/data/repositories/repository.dart';
import 'package:clfl/features/feature_get_posts/domain/repositories/repositories.dart';
import 'package:clfl/features/feature_get_posts/domain/usecases/get_post_usecase.dart';
import 'package:clfl/features/feature_get_posts/presentation/bloc/remote/bloc/remote_posts_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initilizeDependencies() async {
  di.registerSingleton<Dio>(Dio());
  di.registerSingleton<PostsApiService>(PostsApiService(di()));
  di.registerSingleton<PostsRepository>(
      PostsRepositoryImplementation(apiService: di()));
  di.registerSingleton<GetPostsUseCase>(GetPostsUseCase(postsRepository: di()));
  di.registerFactory(() => RemotePostsBloc(getPostsUseCase: di()));
}
