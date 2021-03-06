import 'package:flutter/material.dart';
import 'package:flutter_app_quiz/widgets/quiz_page.dart';
import 'text_utlis.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
              new Card(
                elevation: 8.0,
                child: new Container(
                  height: MediaQuery.of(context).size.width * 0.7,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: new Image.asset(
                      'assets/quizz_cover.jpg',
                      fit:  BoxFit.cover,
                  ),
                ),
              ),
             new RaisedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context){
                            return new QuizPage();
                          }
                      )
                  );
                },
               color: Colors.green,
                child: new TextUtils(
                    ' START ',
                ),
             ),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}