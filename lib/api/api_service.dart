import 'package:http/http.dart' as http;

//통신 성공코드
List<int> successCode = [
  200, //OK
  201, //Created
  202, //Accepted
  204, //No Content
];

//통신 실패코드
List<int> errorCode = [
  400, //Bad Request
  401, //Unauthorized
  403, //Forbidden
  404, //Not Found
  405, //Method Not Allowd
  409, //Conflict
  429, //Too many Requests
];

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class ApiService {
  ApiService._();

  static String _apiUrl = "https://api.diablo2exchange.com";

  static Future<bool> checkUserId(String userId) async {
    String api = _apiUrl + '/v1/dupl/$userId';
    final response = await http.get(Uri.parse(api));

    if (successCode.contains(response.statusCode)) {
      // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
      return true;
    } else {
      // 만약 요청이 실패하면, 에러를 던집니다.
      throw false;
    }
  }

  // static Future<Post> fetchPost() async {
  //   final response = await http.get(
  //     Uri.parse(_apiUrl),
  //     headers: <String, String>{
  //       'Content-Type': 'application/x-www-form-urlencoded',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
  //     return Post.fromJson(json.decode(response.body));
  //   } else {
  //     // 만약 요청이 실패하면, 에러를 던집니다.
  //     throw Exception('Failed to load post');
  //   }
  // }

  // static Future<Post> fetchPost2() async {
  //   final response = await http.post(
  //     Uri.parse(_apiUrl),
  //     headers: <String, String>{
  //       'Content-Type': 'application/x-www-form-urlencoded',
  //     },
  //     body: <String, String>{
  //       'user_id': 'user_id_value',
  //       'user_pwd': 'user_pwd_value'
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
  //     return Post.fromJson(json.decode(response.body));
  //   } else {
  //     // 만약 요청이 실패하면, 에러를 던집니다.
  //     throw Exception('Failed to load post');
  //   }
  // }

}
