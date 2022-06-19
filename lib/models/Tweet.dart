<<<<<<< HEAD
import 'dart:convert';

List<Tweet> tweetFromJson(List<dynamic> str) =>
    List<Tweet>.from(str.map((x) => Tweet.fromJson(x)));

class Tweet {
=======

class Tweet{
  
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667
  final String id;
  final String authorId;
  final DateTime createdAt;
  final String text;

<<<<<<< HEAD
  Tweet(
      {required this.id,
      required this.authorId,
      required this.createdAt,
      required this.text});

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
      id: json['id'],
      authorId: json['author_id'],
      createdAt: DateTime.parse(json["created_at"]),
      text: json['text']);
}
=======
  Tweet({
    required this.id,
    required this.authorId,
    required this.createdAt,
    required this.text
  });

  factory Tweet.fromJson(Map<String,dynamic> json) => Tweet(id: json['id'], authorId: json['author_id'], createdAt: DateTime.parse(json["created_at"]), text: json['text']);
  
}
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667
