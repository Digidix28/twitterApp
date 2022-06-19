import 'dart:convert';

<<<<<<< HEAD
List<Post> PostFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String PostToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
=======
List<Post> PostFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String PostToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667

class Post {
  int userId;
  int id;
  String title;
  String body;

<<<<<<< HEAD
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
=======
    Post({
        required this.userId  ,
        required this.id,
        required this.title,
        required this.body,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
<<<<<<< HEAD
      );

  Map<String, dynamic> toJson() => {
=======
    );

    Map<String, dynamic> toJson() => {
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
<<<<<<< HEAD
      };
=======
    };
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667
}
