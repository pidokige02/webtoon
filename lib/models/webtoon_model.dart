class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel({
    required this.title,
    required this.thumb,
    required this.id,
  });

  // JSON 데이터를 받아서 모델 객체로 변환해주는 Named Constructor
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
