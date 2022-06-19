<<<<<<< HEAD
import 'package:apitest/models/TwitterUser.dart';
=======
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667
import 'package:apitest/services/TwitterService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/Post.dart';
import 'models/Tweet.dart';
import 'services/request.dart';

<<<<<<< HEAD
=======

>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Post>> postes;
  late Future<Tweet> tweet;
<<<<<<< HEAD
  late Future<List<TwitterUser>> twitterUsers;
  late TwitterService twitterService;
=======
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667

  @override
  void initState() {
    Request request = Request();
<<<<<<< HEAD
    twitterService = TwitterService();

    postes = request.getPosts();
    tweet = twitterService.getJson();
    twitterUsers = twitterService.getTwitterUsers();
=======
    postes = request.getPosts();

    tweet = TwitterService().getJson();
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      floatingActionButton: FloatingActionButton(onPressed: () async {
        twitterService.getTwitterUsers();
=======
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667
      }),
      appBar: AppBar(
        title: Text("API Test App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
<<<<<<< HEAD
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
=======
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
>>>>>>> edde3d4259b5f31e5b1f63a66337331c388ed667
        },
      ),
    );
  }
}
