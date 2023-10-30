import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quickread/routes/routes_navigator.dart';
import 'package:quickread/screens/bookmark_screen/bookmark_screen.dart';
import 'package:quickread/screens/category_screen/category_screen.dart';
import 'package:quickread/screens/home_screen/bloc/category/category_bloc.dart';
import 'package:quickread/screens/home_screen/bloc/populer/populer_bloc.dart';
import 'package:quickread/screens/home_screen/bloc/slider_content/slider_content_bloc.dart';
import 'package:quickread/screens/home_screen/home_screen.dart';
import 'package:quickread/screens/news_details_screen/news_datail_screen.dart';
import 'package:quickread/screens/search_screen/bloc/search/search_bloc.dart';
import 'package:quickread/screens/search_screen/search_screen.dart';
import 'package:quickread/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SliderContentBloc>(
          create: (context) => SliderContentBloc(),
        ),
        BlocProvider<PopulerBloc>(
          create: (context) => PopulerBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.red,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesNavigator.init,
        routes: {
          RoutesNavigator.init: (context) => const SplashScreen(),
          RoutesNavigator.home: (context) => const HomeScreen(),
          RoutesNavigator.bookmark: (context) => const BookMarkScreen(),
          RoutesNavigator.search: (context) => const SearchScreen(),
          RoutesNavigator.newsDetail: (context) => NewsDetailScreen(),
          RoutesNavigator.catgory: (context) => const CategoryScreen(),
        },
      ),
    );
  }
}
