import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedFood='MEAT';//ykhrej sleectionné par defaut ,

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              //shader besh lktiba tben 
              ShaderMask(
                shaderCallback: (rect){
                return LinearGradient(
                  begin:Alignment.topCenter,
                  end:Alignment.bottomCenter,
                  colors :[
                    Colors.black,Colors.transparent
                  ]
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,

               child:
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRRlqT80YIrsJzow4SUhh7mJofhePHciyFNUU71YGOXhO_sudXo',
              height:200,
              width: MediaQuery.of(context).size.height*0.5,
              fit: BoxFit.cover,)
              ),
              Positioned(
                left: -20,
                child: 
              RotatedBox(quarterTurns:3,
              child: Text("JAPAN",style: TextStyle(color: Colors.white.withOpacity(0.3),fontSize: 60,fontWeight: FontWeight.w900),
            )),),

              Positioned(
                left: 10,
                child:
                Column(children : <Widget>[
                  //i have o add style picture taken
                Text("WELCOME TO".toUpperCase()),
                Row(children: <Widget>[Text("TOKYO,"),Text("JAPAN")],)],
                )
              ),

              Positioned(
                top: 20,
                right:20 ,
                child:Container(
                  height : 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: Color(0xFFFD3664),
                    borderRadius : BorderRadius.circular(15)
                  ),
                  child: Icon(Icons.menu),
                )
                 ),

              Padding(
                   padding: EdgeInsets.symmetric(horizontal: 20),
                   child: Container(
                     height: 50,
                     decoration: BoxDecoration(color: Colors.grey.shade900,borderRadius: BorderRadius.circular(5)),
                     child: TextField(decoration: InputDecoration(border: InputBorder.none,
                                                                  prefixIcon: Icon(Icons.search, color:Colors.white.withOpacity(0.5),),
                                                                  hintText: 'Tap to search...',
                                                                  hintStyle: TextStyle(color: Colors.white)),
                                      style: TextStyle(color: Colors.white),
                                                                  ),
                     ),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                _buttonBuilder('Garantita'.toUpperCase(), Icons.sentiment_satisfied),
                _buttonBuilder('TEA', Icons.local_cafe),
                _buttonBuilder('Cola', Icons.local_drink),
              ]),

              Row(children: <Widget>[
                _buttonBuilder('BATATA'.toUpperCase(), Icons.sentiment_satisfied),
                _buttonBuilder('KHORCHEF', Icons.local_cafe),
                _buttonBuilder('SKENJBIR', Icons.local_drink),
              ]),

              Row(children: <Widget>[
                _buttonBuilder('9RONFEL'.toUpperCase(), Icons.sentiment_satisfied),
                _buttonBuilder('ZBIB', Icons.local_cafe),
                _buttonBuilder('HMISSA', Icons.local_drink),
              ]),
            ],
          )
        ],
      ),
    );
  }

  Widget _buttonBuilder(foodName,foodicon){
    return InkWell(
      splashColor: Colors.transparent,
      onTap: (){
        setState(() {
          selectedFood=foodName;
        });
      },


      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        height: (selectedFood==foodName) ? MediaQuery.of(context).size.height*0.5/3 :MediaQuery.of(context).size.height*0.5/3*0.75,
        width: (selectedFood==foodName) ? MediaQuery.of(context).size.width/3:MediaQuery.of(context).size.width/3*0.75,
        color: (selectedFood==foodName) ? Colors.pink : Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(foodicon,color: Colors.white,),
            SizedBox(
              height: 10,//pour fair eun espace entre l'icon et lktiba
            ),
            Text(foodName,style: TextStyle(color: Colors.white),)

          ],
        ),
      ),
      
      );
  }
}
