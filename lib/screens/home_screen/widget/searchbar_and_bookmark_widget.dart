import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickread/constant/size.dart';
import 'package:quickread/routes/routes_navigator.dart';

class SearchBarAndBookMarkWidget extends StatelessWidget {
  const SearchBarAndBookMarkWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ds()),
      child: Row(
        children: [
          Flexible(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesNavigator.search);
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: ds()),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cari Beritamu ...",
                      style: GoogleFonts.poppins(
                        color: Colors.black54,
                      ),
                    ),
                    const Icon(Icons.search_rounded)
                  ],
                ),
              ),
            ),
          ),
          getHorizontalSpace(ds()),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesNavigator.bookmark);
            },
            child: CircleAvatar(
              backgroundColor: Colors.red.shade100,
              child: const Icon(
                Icons.bookmark,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
