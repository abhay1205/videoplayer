import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:videoplayer/videoplayer.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String id;
  Future<void> getVideo() async {
    http.Response res = await http
        .get('https://hidden-basin-85501.herokuapp.com/posts/getYouTubeTest');
    print(res.body);
    setState(() {
      id = jsonDecode(res.body)['youtubeLink'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('Play Video'),
            onPressed: () {
              getVideo().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => YoutubeAppDemo(id)));
              });
            },
          ),
        ),
      );
  }
}



