import 'package:clfl/core/constants.dart';
import 'package:clfl/features/feature_get_posts/data/model/posts.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/dio.dart';

part 'get_posts_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PostsApiService {
  factory PostsApiService(Dio dio) = _PostsApiService;

  @GET('/posts')
  Future<HttpResponse<List<PostsModel>>> getPosts();
}
