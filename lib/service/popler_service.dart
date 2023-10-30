import 'package:dio/dio.dart';
import 'package:quickread/model/populer_model.dart';

class PopulerService {
  Future<PopulerModel> getPopulerNews() async {
    try {
      final res = await Dio().get(
        'https://newsapi.ai/api/v1/article/getArticles?sourceLocationUri=http%3A%2F%2Fen.wikipedia.org%2Fwiki%2FIndonesia&apiKey=520b736c-b560-4e97-9db8-1ebbcf9dcb64',
      );
      return PopulerModel.fromJson(res.data);
    } catch (e) {
      throw "$e";
    }
  }
}
