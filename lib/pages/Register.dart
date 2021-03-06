import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:hollows/pages/ChatPage.dart';
import 'package:hollows/structs/textStyles.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final userTextController = TextEditingController();
  final passTextController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email,_password;
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
              text: ['Register'],
              textStyle: kMainTitle,
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    'user@email:~\$',
                    style: kLoginCredentials,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: userTextController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Color(0xffaa00ff),
                        fontFamily: 'LucidaConsole',
                      ),
                      cursorWidth: 10,
                      cursorColor: Color(0xff2ACF1B),
                      onChanged: (value){
                        _email = value.toLowerCase();
                      },
                      decoration: kInputField.copyWith(
                        hintText: 'email',
                      ),
                    ),
                  ),
                ],
              )
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    'user@pass:~\$',
                    style: kLoginCredentials,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: passTextController,
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Color(0xffaa00ff),
                      ),
                      cursorWidth: 10,
                      cursorColor: Color(0xff2ACF1B),
                      onChanged: (value){
                        _password = value;
                      },
                      onFieldSubmitted: (value) async{
                        try{
                          final newUser = await _auth.createUserWithEmailAndPassword(email: _email.trim(), password: _password);
                          if(newUser!=null)
                            {
                              userTextController.clear();
                              passTextController.clear();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage()));
                            }
                        }
                        catch(e){
                          print(e);
                        }

                      },
                      decoration: kInputField.copyWith(
                        hintText: 'password',
                      ),
                    ),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}