import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickread/constant/size.dart';
import 'package:quickread/routes/routes_navigator.dart';
import 'package:quickread/screens/category_screen/constant/category_list.dart';
import 'package:quickread/screens/home_screen/bloc/category/category_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: ds()),
            child: Text(
              "Kategori",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(thickness: 2),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: CategoryList.categoryList.length,
              itemBuilder: (context, index) {
                var data = CategoryList.categoryList[index];
                return ListTile(
                  onTap: () {
                    BlocProvider.of<CategoryBloc>(context).add(
                      GetCategoryEvent(
                        id: CategoryList.categoryList[index].id,
                      ),
                    );
                    Navigator.pushNamed(
                      context,
                      RoutesNavigator.catgory,
                      arguments: CategoryList.categoryList[index].title,
                    );
                  },
                  title: Text(
                    data.title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      ds() / 2,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
