import 'dart:io';
import 'dart:convert';
import 'package:apitest/models/Tweet.dart';
import 'package:http/http.dart' as http;

class TwitterService{
  final String apiKey = "ueWdrC1SIRF0jeQ8wQCJnKP3d";
  final String apiKeySecret = "3VLXwSmmAqbMOy665lwLwLQuMDBj0cdmVYVojG0EDVlRQ2PIB2";
  final String bearerToken = "AAAAAAAAAAAAAAAAAAAAAPy%2FcwEAAAAAnSKfl74Y8jRukDBB0h1z4PwlHpM%3DMFr3iRsdxaryUhFP6NTdbbeRIzDuCSpYziPnradBmrlk3QZeEk";

  var client = http.Client();
  var url = Uri.parse("https://api.twitter.com/2/tweets?ids=1212092628029698048&tweet.fields=author_id,created_at,text");

  Future<Tweet> getJson() async {

    String userAccessHeader = "Bearer " + bearerToken;
    var rep = await client.get(url,headers: {HttpHeaders.authorizationHeader : userAccessHeader});
    Tweet tweet = Tweet(id: 'id', authorId: 'authorId', createdAt: DateTime.now(), text: 'text');
    
    if(rep.statusCode == 200){

      var jsonFile = json.decode(rep.body);
      tweet = Tweet.fromJson(jsonFile['data'][0]);
      
    }else{
      print(rep.statusCode);
    }
    return tweet;
  }

}