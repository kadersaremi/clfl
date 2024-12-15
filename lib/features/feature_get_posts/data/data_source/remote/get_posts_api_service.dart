// import 'package:clfl/core/constants.dart';
// const String baseUrl = "https://jsonplaceholder.typicode.com/";

import 'package:clfl/core/constants.dart';
import 'package:clfl/features/feature_get_posts/data/model/posts.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'get_posts_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PostsApiService {
  factory PostsApiService(Dio dio) = _PostsApiService;

  @GET('/posts')
  Future<List<PostsModel>> getPosts();
}
