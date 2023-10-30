import 'package:quickread/model/news_model.dart';
import 'package:dio/dio.dart';

class NewsService {
  Future<NewsModel> getNews() async {
    try {
      final response = await Dio().get(
        'https://newsdata.io/api/1/news?country=id',
        options: Options(
          headers: {
            "X-ACCESS-KEY": "pub_31372b983ededc7eec9015ab523e57296f4e4"
          },
        ),
      );

      return NewsModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
