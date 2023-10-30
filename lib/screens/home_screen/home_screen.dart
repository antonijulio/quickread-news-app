import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quickread/constant/size.dart';
import 'package:quickread/screens/home_screen/bloc/populer/populer_bloc.dart';
import 'package:quickread/screens/home_screen/bloc/slider_content/slider_content_bloc.dart';
import 'package:quickread/screens/home_screen/widget/appbar_title_widget.dart';
import 'package:quickread/screens/home_screen/widget/item_slider_content.dart';
import 'package:quickread/screens/home_screen/widget/my_drawer.dart';
import 'package:quickread/screens/home_screen/widget/populer_news_widget.dart';
import 'package:quickread/screens/home_screen/widget/animated_dot_indicator.dart';
import 'package:quickread/screens/home_screen/widget/searchbar_and_bookmark_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SliderContentBloc>(context).add(
      GetSliderContentEvent(),
    );
    BlocProvider.of<PopulerBloc>(context).add(
      GetNewsPopulerEvent(),
    );
  }

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        title: const AppBarTitleWidget(),
      ),
      body: ListView(
        children: [
          getVerticalSpace(ds()),
          const SearchBarAndBookMarkWidget(),
          getVerticalSpace(ds()),
          BlocBuilder<SliderContentBloc, SliderContentState>(
            builder: (context, state) {
              if (state is SliderContentLoadingState) {
                return Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              } else if (state is SliderContentSuccesState) {
                return Column(
                  children: [
                    carouselSliderContent(state),
                    getVerticalSpace(ds()),
                    AnimatedDotIndicator(activeIndex: activeIndex),
                  ],
                );
              } else if (state is SliderContentEmptyState) {
                return Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: const Text('kosong'),
                );
              } else if (state is SliderContentErrorState) {
                return Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: const Text("error"),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          getVerticalSpace(ds()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ds() + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Populer",
                  style: GoogleFonts.lora(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 2),
              ],
            ),
          ),
          const PopulerNewsWIdget(),
        ],
      ),
      drawer: MyDrawer(),
    );
  }

  CarouselSlider carouselSliderContent(SliderContentSuccesState state) {
    return CarouselSlider.builder(
      itemCount: state.newsModel.results?.length,
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 15),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      itemBuilder: (context, index, realIndex) {
        var sliderContentData = state.newsModel.results?[index];
        return ItemSliderContent(
          sliderContentData: sliderContentData,
          index: index,
        );
      },
    );
  }
}
