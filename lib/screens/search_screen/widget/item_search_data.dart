import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quickread/constant/size.dart';
import 'package:quickread/model/populer_model.dart';
import 'package:quickread/screens/news_details_screen/news_datail_screen.dart';

class ItemSearchData extends StatelessWidget {
  const ItemSearchData({
    super.key,
    required this.data,
  });

  final Result? data;

  @override
  Widget build(BuildContext context) {
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
              builder: (context) => NewsDetailScreen(link: data?.url),
            ),
          );
        },
        leading: SizedBox(
          width: 100,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
            data?.image ??
                "https://asset.kompas.com/crops/QVTc-KVjWKaXGNMB5Sf2J4waoZc=/0x0:2048x1365/750x500/data/photo/2023/10/26/65399ce69049b.jpg",
            errorBuilder: (context, error, stackTrace) {
              //? handle error network image
              return Image.network(
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
              );
            },
            fit: BoxFit.cover,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerticalSpace(ds() / 2),
            Text(
              // "news title - Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              data?.title ?? "-",
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
              "Published By ${data?.source?.title ?? '-'}",
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
  }
}
