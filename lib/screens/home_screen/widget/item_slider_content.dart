import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickread/constant/size.dart';
import 'package:quickread/model/news_model.dart';
import 'package:quickread/screens/news_details_screen/news_datail_screen.dart';

class ItemSliderContent extends StatelessWidget {
  final int index;
  const ItemSliderContent({
    super.key,
    required this.index,
    required this.sliderContentData,
  });

  final Result? sliderContentData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return BlocProvider.value(
        //         value: BlocProvider.of<PopulerBloc>(context),
        //         child: NewsDetailScreen(),
        //       );
        //     },
        //   ),
        // );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NewsDetailScreen(
                link: sliderContentData?.link ?? "",
                index: index,
                data: sliderContentData,
              );
            },
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ds() / 2),
            child: Image.network(
              sliderContentData?.imageUrl ??
                  "https://asset.kompas.com/crops/QVTc-KVjWKaXGNMB5Sf2J4waoZc=/0x0:2048x1365/750x500/data/photo/2023/10/26/65399ce69049b.jpg",
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png');
              },
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: ds(),
              right: ds() + 24,
              top: ds() + 20,
              bottom: ds(),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ds() / 2),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black12,
                  Colors.black87,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(ds() / 4),
                  child: Text(
                    sliderContentData?.sourceId ?? "-",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                getVerticalSpace(ds() / 6),
                Text(
                  sliderContentData?.title ?? "-",
                  style: GoogleFonts.lora(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      sliderContentData?.description ?? "-",
                      style: GoogleFonts.poppins(
                        color: Colors.white60,
                        fontSize: 10,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
