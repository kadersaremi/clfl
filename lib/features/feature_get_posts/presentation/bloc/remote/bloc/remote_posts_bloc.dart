// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:clfl/features/feature_get_posts/domain/entities/entities.dart';
import 'package:clfl/features/feature_get_posts/domain/usecases/get_post_usecase.dart';

part 'remote_posts_event.dart';
part 'remote_posts_state.dart';

class RemotePostsBloc extends Bloc<RemotePostsEvent, RemotePostsState> {
  final GetPostsUseCase getPostsUseCase;
  RemotePostsBloc({
    required this.getPostsUseCase,
  }) : super(RemotePostsInitial()) {
    on<OnGetPostsEvent>((event, emit) async {
      emit(RemotePostsLoading());
      final dataset = await getPostsUseCase.call();
      if (dataset.isNotEmpty) {
        emit(RemotePostsSuccess(dataset));
      } else {
        emit(RemotePostsFailed());
      }
    });
  }
}
