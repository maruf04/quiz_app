import 'package:flutter/material.dart';

import 'models/questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.white12,
      ),
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

int sayac = 1;
int point=0;

List<Questions> newQuestions = [
  Questions.withId(0, " ", " ", " ", " ", " ", " "),
  Questions.withId(
    1,
    "Ali: And if you wrong us, shall we not revenge? ",
    "Yes",
    "No",
    "Maybe       ",
    "Always",
    "Always",),
  Questions.withId(
    2,
    "Haydar: And if you wrong us, shall we not revenge? ",
    "Yes",
    "No",
    "Maybe       ",
    "Always",
    "Always",),
  Questions.withId(
    3,
    "Miro: And if you wrong us, shall we not revenge? ",
    "Yes",
    "No",
    "Maybe       ",
    "Always",
    "Always",),
  Questions.withId(
    4,
    "Ümit: And if you wrong us, shall we not revenge? ",
    "Yes",
    "No",
    "Maybe       ",
    "Always",
    "Always",),
  Questions.withId(
    5,
    "Emre: And if you wrong us, shall we not revenge? ",
    "Yes",
    "No",
    "Maybe       ",
    "Always",
    "Always",),
  Questions.withId(
    6,
    "Abdullah: And if you wrong us, shall we not revenge? ",
    "Yes",
    "No",
    "Maybe       ",
    "Always",
    "Always",),
  Questions.withId(
    7,
    "Cenk: And if you wrong us, shall we not revenge? ",
    "Yes",
    "No",
    "Maybe       ",
    "Always",
    "Always",),
  Questions.withId(
    8,
    "Ensar: And if you wrong us, shall we not revenge? ",
    "Yes",
    "No",
    "Maybe       ",
    "Always",
    "Always",),
  Questions.withId(
    9,
    "Maruf: And if you wrong us, shall we not revenge? ",
    "Yes",
    "No",
    "Maybe       ",
    "Always",
    "Always",),
  Questions.withId(
    10,
    "Bilal: And if you wrong us, shall we not revenge? ",
    "Yes",
    "No",
    "Maybe       ",
    "Always",
    "Always",)
];

int nqSize = newQuestions.length;

String A=newQuestions[sayac].A;
String B=newQuestions[sayac].B;
String C=newQuestions[sayac].C;
String D=newQuestions[sayac].D;
String T=newQuestions[sayac].T;
String qsN="";
enum SingingCharacter { A, B,C,D,T,qsN }
String selectedResponse="";
bool questionOver=false;

SingingCharacter _character = SingingCharacter.qsN;

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  Widget build(BuildContext context) {
    return questionOver ? endPage() : Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            questionSection(),
           //AnsWer  A
            answerA(),
            //Answer B
            answerB(),
            //Answer C
            answerC(),
            //Answer D
            answerD(),
            //button Next
            sonMu(),
          ],
        ),
      ),
    );
  }

  //son soruya gelip gelmediğini  kontrol eder
  Widget sonMu(){
    if(sayac==nqSize-1){
      return endButton();
    }
    else{
      return nextButton();
    }
  }

  //en sonda gelecek olan button
  Widget endButton() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: RaisedButton(
      onPressed: (){
        showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('finish?'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("do you want to finish"),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    setState(() {
                      answerTrueOrFalseSection();
                    });
                    Navigator.of(context).pop();
                    if(sayac==nqSize-1){
                      questionOver=true;
                    }
                  },
                ),
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
              elevation: 20.0,
              backgroundColor: Colors.orangeAccent,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
            );
          },
        );
      },
      child: Text(' END',style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,// double
        color: Colors.white,
      ),),
      color: Colors.blueAccent,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
    ),
  );
}

  Widget nextButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        onPressed: (){

          showDialog(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Are you sure?'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text("Another question will be passed"),
                      //Text('Would you like to approve of this message?'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Yes'),
                    onPressed: () {
                      setState(() {
                        answerTrueOrFalseSection();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                elevation: 20.0,
                backgroundColor: Colors.orangeAccent,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                ),
              );
            },
          );
        },
        child: Text(' NEXT ',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,// double
          color: Colors.white,
        ),),
        color: Colors.blueAccent,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      ),
    );
  }

  //uygulamanın sonlandırılıp puan vb. bilgilerin verildiği kısım
  Widget endPage() {
  return Center(
    child: Text("Point = "+point.toString(),style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,// double
      color: Colors.white,
    ),),
  );
}

  //question Section
  Widget questionSection() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          children: [

            Text(
              "Question "+sayac.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,// double
                color: Colors.grey,
              ),
            ),

            Text(
              "/"+(nqSize-1).toString(),
              style: TextStyle(
                //fontWeight: FontWeigh,
                fontSize: 20.0,// double
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      Text(
        "--------------------------------------------------",
        style: TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 20.0,// double
          color:  Colors.grey,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child:Text(
          newQuestions[sayac].quest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,// double
            color: Colors.white,
          ),
        ),

      ),
    ],
  );
}

  //answer
  Widget answerA() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: OutlineButton(
        color: Colors.blueAccent,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        disabledBorderColor: Colors.orangeAccent,
        child: ListTile(
          title: Text(newQuestions[sayac].A,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,// double
            color: Colors.white,
          ),),
          leading: Radio(
            value: SingingCharacter.A,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                print(value);
                selectedResponse=newQuestions[sayac].A;
              });
            },
          ),
        ),
      ),
    );
  }
  Widget answerB() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: OutlineButton(
        splashColor: Colors.amber,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        disabledBorderColor: Colors.orangeAccent,
        child: ListTile(
          title: Text(newQuestions[sayac].B,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,// double
            color: Colors.white,
          ),),
          leading: Radio(
            value: SingingCharacter.B,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                print("B");
                selectedResponse=newQuestions[sayac].B;
              });
            },
          ),
        ),
      ),
    );
  }
  Widget answerC() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: OutlineButton(
        splashColor: Colors.amber,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        disabledBorderColor: Colors.orangeAccent,
        child: ListTile(
          title: Text(newQuestions[sayac].C,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,// double
            color: Colors.white,
          ),),
          leading: Radio(
            value: SingingCharacter.C,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                print("C");
                selectedResponse=newQuestions[sayac].C;
              });
            },
          ),
        ),
      ),
    );
  }
  Widget answerD() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: OutlineButton(
        splashColor: Colors.amber,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        disabledBorderColor: Colors.orangeAccent,
        child: ListTile(
          title: Text(newQuestions[sayac].D,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,// double
            color: Colors.white,
          ),),
          leading: Radio(
            value: SingingCharacter.D,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                print("D");
                selectedResponse=newQuestions[sayac].D;
              });
            },
          ),
        ),
      ),
    );
  }

  //cevapların Dogru ya da yanlış olduğunun kontrol edilmesi
  void answerTrueOrFalseSection() {
    //answer true or false
    if(selectedResponse==newQuestions[sayac].T){
      point=point+2;
      print("---------------------");
      print("dogru");
      print("selectedResponse  " +selectedResponse.toString());
      print("SingingCharacter.T  " +newQuestions[sayac].T);
      print(point);
      print("---------------------");
    }else{
      if(point>0 && selectedResponse!=""){
        point=point-1;
      }
      print("---------------------");
      print("yanlıs");
      print("selectedResponse  " +selectedResponse.toString());
      print("SingingCharacter.T  " +newQuestions[sayac].T);
      print(point);
      print("---------------------");
    }
    selectedResponse="";

    if (sayac > 0 && sayac < nqSize-1) {
      sayac++;
      _character=SingingCharacter.qsN;
    }
  }
}








