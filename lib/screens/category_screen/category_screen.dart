import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickread/constant/size.dart';
import 'package:quickread/screens/home_screen/bloc/category/category_bloc.dart';
import 'package:quickread/screens/news_details_screen/news_datail_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTitle = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        title: Text(
          appTitle,
          style: GoogleFonts.poppins(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CategoryLoadedState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: state.categoryData.results?.length,
                    itemBuilder: (context, index) {
                      var newsData = state.categoryData.results?[index];
                      return Container(
                        margin: EdgeInsets.only(
                          left: ds(),
                          right: ds(),
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
                              offset: const Offset(1, 5),
                            ),
                          ],
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailScreen(
                                  link: newsData?.link,
                                ),
                              ),
                            );
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(ds() / 2),
                                child: Image.network(
                                  newsData?.imageUrl ??
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              getVerticalSpace(ds() / 2),
                              Text(
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
                                "Published By ${newsData?.sourceId ?? '-'}",
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
                  );
                } else if (state is CategoryErrorState) {
                  return const Center(
                    child: Text("error"),
                  );
                } else {
                  return const Center(
                    child: Text("kosong"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
