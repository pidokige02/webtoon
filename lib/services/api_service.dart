import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_model.dart';

class ApiService {
  // baseUrl과 엔드포인트 설정 (일반적으로 제공되는 노마드코더 웹툰 API 예시)
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  // 오늘의 웹툰 목록을 가져오는 비동기 함수
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    // API 요청 보낼 URL 생성
    final url = Uri.parse('$baseUrl/$today');

    // HTTP GET 요청
    final response = await http.get(url);

    // 요청이 성공(200)했다면
    if (response.statusCode == 200) {
      // JSON String을 Dart의 List<dynamic> 형태로 디코딩
      final List<dynamic> webtoons = jsonDecode(response.body);

      // JSON 데이터를 순회하며 WebtoonModel 객체로 변환하여 리스트에 추가
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstances;
    }
    // 요청이 실패했다면 에러 발생
    throw Error();
  }
}
