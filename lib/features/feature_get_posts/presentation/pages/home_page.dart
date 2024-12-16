import 'package:clfl/features/feature_get_posts/presentation/bloc/remote/bloc/remote_posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RemotePostsBloc, RemotePostsState>(
        builder: (context, state) {
          if (state is RemotePostsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RemotePostsFailed) {
            return const Center(
              child: Column(
                children: [
                  Text(
                    'Error!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    'Please Check your internet connection',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is RemotePostsSuccess) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    children: [
                      Text(
                        state.posts![index].id.toString(),
                      ),
                      Text(
                        state.posts![index].title.toString(),
                      ),
                      Text(
                        state.posts![index].body.toString(),
                      ),
                    ],
                  ),
                );
              }),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
