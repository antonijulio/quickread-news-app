import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickread/constant/size.dart';

import 'package:quickread/screens/search_screen/bloc/search/search_bloc.dart';
import 'package:quickread/screens/search_screen/widget/item_search_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Jokowi ...",
                  contentPadding: EdgeInsets.symmetric(vertical: 3),
                ),
                style: GoogleFonts.poppins(
                  height: 2,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<SearchBloc>().add(
                      GetSearchEvent(
                        text: _controller,
                      ),
                    );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 3,
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SerachLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SerachSuccesState) {
            return Padding(
              padding: EdgeInsets.only(top: ds() / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: ds()),
                    child: Text(
                      "Total ${state.newsData.articles?.count} untuk Pencarian ${_controller.text}",
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  getVerticalSpace(ds()),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: state.newsData.articles?.results?.length,
                      itemBuilder: (context, index) {
                        var data = state.newsData.articles?.results?[index];
                        return ItemSearchData(data: data);
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SearchEmptyState) {
            return const Center(
              child: Text("kosong"),
            );
          } else if (state is SearchErrorState) {
            return const Center(
              child: Text("error"),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
