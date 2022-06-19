import 'Tweet.dart';
import 'dart:convert';

List<TwitterUser> twitterUserFromJson(List<Data> data, List<Tweet> tweets) {
  List<TwitterUser> l = [];
  for (int i = 0; i < data.length; i++) {
    l.add(TwitterUser.fromJson(data[i], tweets[i]));
  }
  return l;
}

class TwitterUser {
  Data userData;
  Tweet tweet = Tweet(
      id: 'id', authorId: "authorId", createdAt: DateTime.now(), text: "text");

  TwitterUser({required this.userData, required this.tweet});

  factory TwitterUser.fromJson(Data data, Tweet tweets) =>
      TwitterUser(userData: data, tweet: tweets);
}

List<Data> dataFromJson(List<dynamic> str) =>
    List<Data>.from(str.map((x) => Data.fromJson(x)));

class Data {
  Data({
    required this.createdAt,
    required this.id,
    required this.name,
    required this.pinnedTweetId,
    required this.username,
  });

  DateTime createdAt;
  String id;
  String name;
  String pinnedTweetId;
  String username;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        name: json["name"],
        pinnedTweetId:
            json["pinned_tweet_id"] == null ? null : json["pinned_tweet_id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "name": name,
        "pinned_tweet_id": pinnedTweetId == null ? null : pinnedTweetId,
        "username": username,
      };
}
