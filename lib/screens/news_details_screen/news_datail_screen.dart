// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickread/constant/size.dart';
import 'package:quickread/db/bookmark.dart';
import 'package:quickread/model/bookmark_model.dart';
import 'package:quickread/model/news_model.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailScreen extends StatefulWidget {
  String? link;
  int? index;
  Result? data;

  NewsDetailScreen({
    super.key,
    this.link,
    this.index,
    this.data,
  });

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  var webController = WebViewController();
  DbBookmarkManager dbBookmarkManager = DbBookmarkManager();
  BookmarkModel? _bookmarkModel;

  void getBookmarkById(String id) async {
    _bookmarkModel = await dbBookmarkManager.getBokmarkById(id);

    setState(() {});
  }

  void getDialog() {
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            'Berhasil ditambahkan ke bookmark',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
          backgroundColor: Colors.black12,
        );
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }

  @override
  void initState() {
    super.initState();
    webController = WebViewController()
      ..loadRequest(
        Uri.parse(widget.link ?? ""),
      );
    getBookmarkById(widget.data?.articleId ?? "");
  }

  @override
  void dispose() {
    super.dispose();
    webController.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        title: Text(
          "Berita",
          style: GoogleFonts.poppins(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Share.share(widget.link ?? "-", subject: widget.data?.title);
            },
            icon: const Icon(
              Icons.share_rounded,
              color: Colors.red,
            ),
          ),
          getHorizontalSpace(ds())
        ],
      ),
      body: WebViewWidget(controller: webController),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_bookmarkModel?.id == widget.data?.articleId) {
            await dbBookmarkManager.deleteBookmark(
              widget.data?.articleId ?? "",
            );
            _bookmarkModel = null;
            setState(() {});
          } else {
            await dbBookmarkManager.insertBookmark(
              BookmarkModel(
                id: widget.data?.articleId,
                link: widget.data?.link,
                title: widget.data?.title,
                imageUrl: widget.data?.imageUrl,
              ),
            );
            setState(() {});
            getBookmarkById(widget.data?.articleId ?? "");
            getDialog();
          }
        },
        backgroundColor: Colors.red,
        child: _bookmarkModel?.id == widget.data?.articleId
            ? const Icon(
                Icons.bookmark,
                color: Colors.white,
              )
            : const Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
      ),
    );
  }
}
