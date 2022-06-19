import 'package:http/http.dart' as http;
import 'package:apitest/models/Post.dart';

class Request {
  Request();
  var client = http.Client();
  var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  Future<List<Post>> getPosts() async {
    var rep = await client.get(url);
    List<Post> l = [];

    if (rep.statusCode == 200) {
      var json = rep.body;
      l = PostFromJson(json);
    }

    return l;
  }
}
