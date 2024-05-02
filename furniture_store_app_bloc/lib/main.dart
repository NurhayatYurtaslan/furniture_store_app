import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_store_app_bloc/app/repository/app_repository.dart';
import 'package:furniture_store_app_bloc/app/view/view_intro/view_intro.dart';
import 'package:furniture_store_app_bloc/core/theme/app_theme.dart';

import 'app/view/bloc/app_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Repository>(
      create: (context) => Repository(),
      child: BlocProvider<FurnitureBloc>(
        create: (context) =>
            FurnitureBloc(repository: context.read<Repository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // Enable horizontal scroll on flutter web
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),

          home: const IntroScreen(),
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
