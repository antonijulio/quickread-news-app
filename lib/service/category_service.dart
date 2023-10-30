import 'package:dio/dio.dart';
import 'package:quickread/model/news_model.dart';

class CategoryService {
  Future<NewsModel> getCategoryById({required String id}) async {
    try {
      final res = await Dio().get(
        "https://newsdata.io/api/1/news?country=id&category=$id",
        options: Options(
          headers: {
            "X-ACCESS-KEY": "pub_31372b983ededc7eec9015ab523e57296f4e4"
          },
        ),
      );

      return NewsModel.fromJson(res.data);
    } catch (e) {
      throw "$e";
    }
  }
}
