part of 'remote_posts_bloc.dart';

sealed class RemotePostsEvent extends Equatable {
  const RemotePostsEvent();

  @override
  List<Object> get props => [];
}

class OnGetPostsEvent extends RemotePostsEvent {}
