import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hollows/pages/LoginorRegister.dart';
import 'package:hollows/structs/textStyles.dart';


void main(){
  runApp(
      MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff000000),
        ) ,
        home: Page(),
      )
  );
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {

  gotoLogin() async{
    await Future.delayed(Duration(seconds: 4));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginOrRegister()));
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    gotoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TypewriterAnimatedTextKit(
          totalRepeatCount: 1,
          text: ['Hollows'],
          speed: Duration(milliseconds: 350),
          textStyle: kSplashTitle,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginOrRegister()));
          },
        ),
      ),
    );
  }
}



