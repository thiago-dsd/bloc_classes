import 'package:http/http.dart' as http;

class LoginRepository {
  Future<void> postLogin({
    String? email,
    String? password,
  }) async {
    final response = http.get(Uri.parse(""));
  }
}
