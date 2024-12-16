import 'dart:io';

import 'package:clfl/features/feature_get_posts/data/data_source/remote/get_posts_api_service.dart';
import 'package:clfl/features/feature_get_posts/domain/entities/entities.dart';
import 'package:clfl/features/feature_get_posts/domain/repositories/repositories.dart';
import 'package:dio/dio.dart';

class PostsRepositoryImplementation implements PostsRepository {
  final PostsApiService apiService;

  PostsRepositoryImplementation({required this.apiService});

  @override
  Future<List<PostEntities>> getPosts() async {
    final httpResponse = await apiService.getPosts();
    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return httpResponse.data;
    } else {
      throw DioException(
        requestOptions: httpResponse.response.requestOptions,
        error: httpResponse.response.statusMessage,
        type: DioExceptionType.badResponse,
        response: httpResponse.response,
      );
    }
  }
}
