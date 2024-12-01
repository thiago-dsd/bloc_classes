import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:bloc_classes/model/posts_model.dart';

class PostRepository {
  Future<List<PostModel>?> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));

      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostModel(
            postId: e["postId"] as int,
            id: e["id"] as int,
            name: e["name"] as String, 
            email: e["email"] as String,
            body: e["body"] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw Exception("Error while fetching data");
    } on TimeoutException {
      throw Exception("Error while fetching data, timeout.");
    }
    return null;
  }
}
