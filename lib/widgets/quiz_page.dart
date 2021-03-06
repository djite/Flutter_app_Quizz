import 'package:flutter/material.dart';
import 'text_utlis.dart';
import 'package:flutter_app_quiz/modeles/question.dart';

class QuizPage extends StatefulWidget{
  @override
  _QuizPageSate   createState() => new _QuizPageSate();

}

class _QuizPageSate extends  State<QuizPage>{
  Question question;
  List<Question> listdeQues =[

    new Question('Paris est la capitale de la Franche ?', true , 'assets/paris.jpg'),
    new Question('Les BCAA sont des acides aminés essentiels en Musculation ? ', true,'assets/bcaa.jpg'),
    new Question('Limoges est la plus grande ville du monde ?  ', false,'assets/limoges.jpg'),
    new Question('La lune est une planète ? ', false,'assets/lune.jpg'),
    new Question('Twitter est le réseau social le plus utilisé ? ',false,'assets/flutter.jpg'),
    new Question('Minecraft est un jeu vidéo ? ', true ,'assets/minecraft.jpg'),
    new Question('Louis XVI s\'est suicidé ?  ', false,'assets/louisxvi.jpg'),
    new Question('Les prochains JO seront à Paris ?  ', true,'assets/jo.jpg')

  ];
  int index = 0;
  int score = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    question = listdeQues[index];
  }
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.5;
    return new Scaffold(
      appBar : new AppBar(
        title: new TextUtils('QUIZZ : Let\'s Go'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget> [
            new TextUtils('Question #${index  + 1 }'),
            new TextUtils('Score : $score / ${index + 1}'),
            new Card(
              elevation: 8.0,
              child: new Container(
                height: size,
                width: size,
                child: new Image.asset(
                  question.imagePath,
                  fit:  BoxFit.cover,
                ),
              ),
            ),
            new TextUtils(question.question),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                buttonBool(true),
                buttonBool(false)
              ],
            ),
          ],
        ),
      ),
    );
  }

  RaisedButton buttonBool(bool b){
    
    return new RaisedButton(
        onPressed: (() => dialog(b)),
        elevation: 8.0,
        color: Colors.green,
        child: TextUtils( b ? 'Vrai !':'Faux !'),

    );
  }
  
  Future<Null> dialog(bool b) async {

    bool bonne = (b == question.reponse);
    String vrai = 'assets/true.png';
    String faux = 'assets/false.png';
    if (bonne){
      score++ ;
    }
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder:(BuildContext context){
        return new SimpleDialog(
          title: new TextUtils(
              bonne ? 'Bravo +1  ': 'Perdu +0' ,
              couleur: bonne ? Colors.green : Colors.red,
              textScaleFactor: 1.5,
              ),
          contentPadding: EdgeInsets.all(10.0),
          children: <Widget>[
            new Image.asset(
              bonne ? vrai : faux,
              fit: BoxFit.cover,
            ),
            new Container(height: 20.0,),
            new RaisedButton(
                onPressed: (){
                  Navigator.pop(context);
                  getNextquestion();
                },
              color: Colors.green,
              child: new TextUtils('Next Question'),
            )
          ],
        );
      },
    );
  }
  Future<Null> alerte() async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder:(BuildContext builContext){
        return new AlertDialog(
          title: new TextUtils('Fin Du Quiz ',couleur: Colors.redAccent,),
          contentPadding: EdgeInsets.all(10.0),
          content: new TextUtils('Score Final : $score / ${ index +1 } '),
          actions: <Widget>[
            new FlatButton(
              onPressed : ( () {
                Navigator.pop(builContext);
                Navigator.pop(context);
              }),
              child: new TextUtils('Terminer',couleur: Colors.lightBlue,),
            ),
          ],
        );
      },
    );
  }

  void getNextquestion(){
    if(index < listdeQues.length -1 ){
      index++;
      setState(() {
        question = listdeQues[index];
      });
    } else{
        alerte();
    }

  }
}