import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quickread/constant/size.dart';
import 'package:quickread/screens/home_screen/bloc/populer/populer_bloc.dart';
import 'package:quickread/screens/news_details_screen/news_datail_screen.dart';

class PopulerNewsWIdget extends StatelessWidget {
  const PopulerNewsWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulerBloc, PopulerState>(
      builder: (context, state) {
        if (state is PopulerNewsLoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PopulerNewsLoadedState) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: ds() * 2,
              vertical: ds() / 4,
            ),
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: state.newsData.articles?.results?.length.clamp(0, 25),
              itemBuilder: (context, index) {
                var newsData = state.newsData.articles?.results?[index];
                return Container(
                  margin: EdgeInsets.only(
                    top: ds(),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: ds() / 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(ds() / 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        offset: Offset(1, 5),
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailScreen(link: newsData?.url),
                        ),
                      );
                    },
                    leading: SizedBox(
                      width: 100,
                      height: MediaQuery.of(context).size.height,
                      child: Image.network(
                        newsData?.image ??
                            "https://asset.kompas.com/crops/QVTc-KVjWKaXGNMB5Sf2J4waoZc=/0x0:2048x1365/750x500/data/photo/2023/10/26/65399ce69049b.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getVerticalSpace(ds() / 2),
                        Text(
                          // "news title - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          newsData?.title ?? "-",
                          style: GoogleFonts.lora(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                        getVerticalSpace(ds() / 4),
                        Text(
                          // "news title - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. isgfhbshab aiuasiufdga8 ui a hfdbahfba asioudfh a audh fsadfhasdhfbdsh fhdf gdfg ",
                          "Published By ${newsData?.source?.title ?? '-'}",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is PopulerNewsEmptyState) {
          return const Center(
            child: Text("Data Kosong"),
          );
        } else if (state is PopulerNewsErrorState) {
          return const Center(
            child: Text("error"),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
