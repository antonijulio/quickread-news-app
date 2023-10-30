import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickread/constant/size.dart';
import 'package:quickread/db/bookmark.dart';
import 'package:quickread/model/bookmark_model.dart';
import 'package:quickread/screens/news_details_screen/news_datail_screen.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  List<BookmarkModel> _bookmarkModel = [];
  final DbBookmarkManager _dbBookmarkManager = DbBookmarkManager();

  void getListBookmark() async {
    _bookmarkModel = await _dbBookmarkManager.getListBookmark();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getListBookmark();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            text: "Book",
            style: GoogleFonts.poppins(
              color: Colors.red,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                text: "Mark",
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: _bookmarkModel.length,
              itemBuilder: (context, index) {
                var data = _bookmarkModel[index];
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
                            link: data.link,
                          ),
                        ),
                      );
                    },
                    leading: SizedBox(
                      width: 100,
                      height: MediaQuery.of(context).size.height,
                      child: Image.network(
                        data.imageUrl ??
                            "https://asset.kompas.com/crops/QVTc-KVjWKaXGNMB5Sf2J4waoZc=/0x0:2048x1365/750x500/data/photo/2023/10/26/65399ce69049b.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getVerticalSpace(ds() / 2),
                        Text(
                          data.title ?? "-",
                          style: GoogleFonts.lora(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                      ],
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
