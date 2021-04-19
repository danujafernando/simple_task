import 'package:flutter/material.dart';
import 'package:simple_task/bloc/post_bloc.dart';
import 'package:simple_task/models/post_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    post_bloc.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: _buildGetPosts(),
        ),
      ),
    );
  }

  Widget _buildGetPosts() {
    return StreamBuilder<List<PostModel>>(
      stream: post_bloc.subject.stream,
      builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
        if (snapshot.hasData) {
          return _buildUserWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Loading data from API..."),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occured: $error"),
        ],
      ),
    );
  }

  Widget _buildUserWidget(List<PostModel> postList) {
    return ListView.separated(
      padding: const EdgeInsets.all(10.0),
      itemCount: postList.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(
            postList[i].title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          subtitle: Text(
            postList[i].title,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
