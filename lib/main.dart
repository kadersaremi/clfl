import 'package:clfl/features/feature_get_posts/data/data_source/remote/get_posts_api_service.dart';
import 'package:clfl/features/feature_get_posts/data/repositories/repository.dart';
import 'package:clfl/features/feature_get_posts/domain/usecases/get_post_usecase.dart';
import 'package:clfl/features/feature_get_posts/presentation/bloc/remote/bloc/remote_posts_bloc.dart';
import 'package:clfl/features/feature_get_posts/presentation/pages/home_page.dart';
import 'package:clfl/injection_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initilizeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<RemotePostsBloc>(
        create: (context) => di()..add(OnGetPostsEvent()),
        child: const HomePage(),
      ),
    );
  }
}
