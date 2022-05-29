
class Tweet{
  
  final String id;
  final String authorId;
  final DateTime createdAt;
  final String text;

  Tweet({
    required this.id,
    required this.authorId,
    required this.createdAt,
    required this.text
  });

  factory Tweet.fromJson(Map<String,dynamic> json) => Tweet(id: json['id'], authorId: json['author_id'], createdAt: DateTime.parse(json["created_at"]), text: json['text']);
  
}