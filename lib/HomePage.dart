import 'package:apitest/services/TwitterService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/Post.dart';
import 'models/Tweet.dart';
import 'services/request.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Post>> postes;
  late Future<Tweet> tweet;

  @override
  void initState() {
    Request request = Request();
    postes = request.getPosts();

    tweet = TwitterService().getJson();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
      }),
      appBar: AppBar(
        title: Text("API Test App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: tweet,

        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var tweetReceived = snapshot.data;
          if(tweetReceived == null){
            return const Center(child: Text("Data is loading..."));
          }
          else{
            String dateDePublication = DateFormat('yyyy-MM-dd – kk:mm').format(tweetReceived.createdAt);
            return ListTile(
              title: Text(tweetReceived.text),
              subtitle: Text(dateDePublication),
            );
            }
        },
      ),
    );
  }
}
