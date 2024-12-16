part of 'remote_posts_bloc.dart';

sealed class RemotePostsState extends Equatable {
  final List<PostEntities>? posts;
  final DioException? error;

  const RemotePostsState({this.posts, this.error});

  @override
  List<Object> get props => [posts!, error!];
}

class RemotePostsInitial extends RemotePostsState {}

class RemotePostsSuccess extends RemotePostsState {
  //we should recive data!
  const RemotePostsSuccess(List<PostEntities> posts) : super(posts: posts);
}

class RemotePostsFailed extends RemotePostsState {
  //we should recive error!
}

class RemotePostsLoading extends RemotePostsState {}
