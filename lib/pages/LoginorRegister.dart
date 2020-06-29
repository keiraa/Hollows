import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hollows/pages/LoginPage.dart';
import 'package:hollows/pages/Register.dart';
import 'package:hollows/structs/textStyles.dart';

class LoginOrRegister extends StatefulWidget {
  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  final loginTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: TypewriterAnimatedTextKit(
              repeatForever: true,
              speed: Duration(milliseconds: 350),
              text: ['Leviosa'],
              textStyle: kMainTitle,
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    'user@l/r:~\$',
                    style: kLoginCredentials,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: loginTextController,
                      style: TextStyle(
                        color: Color(0xffaa00ff),
                        fontFamily: 'LucidaConsole',
                      ),
                      cursorWidth: 10,
                      cursorColor: Color(0xff2ACF1B),
                      onFieldSubmitted: (value){
                        loginTextController.clear();
                        if(value.toLowerCase()=='login')
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          }
                        else
                          {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Register()));
                          }
                      },
                      decoration: kInputField,
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}