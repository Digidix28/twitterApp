import 'package:apitest/models/TwitterUser.dart';
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
  late Future<List<TwitterUser>> twitterUsers;
  late TwitterService twitterService;

  @override
  void initState() {
    Request request = Request();
    twitterService = TwitterService();

    postes = request.getPosts();
    tweet = twitterService.getJson();
    twitterUsers = twitterService.getTwitterUsers();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        twitterService.getTwitterUsers();
      }),
      appBar: AppBar(
        title: Text("API Test App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: twitterUsers,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var users = snapshot.data;
          if (users == null) {
            return const Center(child: Text("Data is loading..."));
          } else {
            return ListView.separated(
              itemCount: users.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 50,
                  endIndent: 50,
                  color: Colors.blue,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(users[index].tweet.text),
                  subtitle: Text(users[index].userData.name),
                );
              },
            );
          }
        },
      ),
    );
  }
}
