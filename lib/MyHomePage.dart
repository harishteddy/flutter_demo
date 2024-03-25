import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:harish_demo/post.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Post>> postsFuture = getPosts();

  static Future<List<Post>> getPosts() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos");
    final response = await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Post.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: postsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final posts = snapshot.data!;
              return buildPosts(posts);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  Widget buildPosts(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Container(
          color: Colors.grey.shade300,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(flex: 1, child: Image.network(post.url!)),
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(post.title!)),
              Expanded(flex: 3, child: Text(post.albumId!.toString())),

            ],
          ),
        );
      },
    );
  }
}































/*

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var jsonList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async{

    http.Response response = await http.get(Uri.parse("https://protocoderspoint.com/jsondata/superheros.json"));
    if(response.statusCode == 200){
      setState(() {
        var newData = json.decode(response.body);
        jsonList = newData['superheros'] as List;
        print(jsonList);
      });
    }else{
      print(response.statusCode);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Reorder-able Listview"),
        ),
        body: ReorderableListView.builder(
            itemBuilder: (BuildContext context,int index){
              return Card(
                key: Key('${index}'),
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        jsonList[index]['url'],
                        fit: BoxFit.fill,
                        width: 50,
                        height: 100,
                      )
                  ),
                  title: Text(jsonList[index]['name']),
                  subtitle: Text(jsonList[index]['power'],maxLines: 4,),
                ),
              );
            },
            itemCount: jsonList == null ? 0 : jsonList.length,
            onReorder: (int oldIndex,int newIndex){
              setState(() {
                if(newIndex > oldIndex){
                  newIndex -=1;
                }
                final tmp = jsonList[oldIndex];
                jsonList.removeAt(oldIndex);
                jsonList.insert(newIndex, tmp);
              });
            })
    );
  }
}*/
