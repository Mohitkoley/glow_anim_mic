import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0,end: 15.0).animate(_animationController)..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Material App",
      home: Scaffold(
        backgroundColor: Color.fromARGB(38, 38, 38, 30),
        appBar: AppBar(
          title: Text('glow button',style: TextStyle(color: Colors.green,),),
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            child: Icon(Icons.mic,color: Colors.green,),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(69, 69, 69, 30),
              boxShadow: [BoxShadow(
                color: Color.fromRGBO(130, 237, 125, 58),
                blurRadius: _animation.value,
                spreadRadius: _animation.value,
              )],
            ),
          ),
        ),
      ),
    );
  }
}