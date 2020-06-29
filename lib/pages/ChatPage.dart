import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hollows/structs/textStyles.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messageTextController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore _firestore = Firestore.instance;
  String _message;
  FirebaseUser _loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  getUser()async{
    try{
      final user = await _auth.currentUser();
      if(user!=null){
        _loggedInUser = user;
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Center(
          child: TypewriterAnimatedTextKit(
            repeatForever: true,
            speed: Duration(milliseconds: 350),
            text: ['Hollow Group'],
            textStyle: kMainTitle,
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('msg').snapshots(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                  final messages = snapshot.data.documents;
                  List<TextViewer> messageWidgets = [];
                  for(var message in messages){
                    final messageText = message.data['msg'];
                    final messageSender = message.data['user'];
                    final messageTime = message.data['time'];
                    var arr = messageSender.toString().split('@');
                    final messageWidget = TextViewer(sender: arr[0], text: messageText,isMe: messageSender == _loggedInUser.email,time: messageTime,);
                    messageWidgets.add(messageWidget);
                    messageWidgets.sort((a,b)=>b.time.compareTo(a.time));
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      children: messageWidgets,
                    ),
                  );
                }
              return Column();
            },
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Text(
                  '@user: ',
                  style: kLoginCredentials.copyWith(
                    fontSize: 20,
                  ),
                ),
                Flexible(
                  child: TextField(
                    cursorWidth: 10,
                    cursorColor: Color(0xff2ACF1B),
                    controller: messageTextController,
                    style: TextStyle(
                      color: Color(0xffaa00ff),
                      fontFamily: 'LucidaConsole',
                      fontSize: 20,
                    ),
                    onChanged: (value){
                      _message = value;
                    },
                    decoration: kInputField.copyWith(
                      hintText: 'message',
                    ),
                    onSubmitted: (value){
                      if(value == '<signout>'){
                        _auth.signOut();
                        Navigator.pop(context);
                      }
                      else{
                        messageTextController.clear();
                        _firestore.collection('msg').add({
                          'msg':_message,
                          'user':_loggedInUser.email,
                          'time':DateTime.now(),
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class TextViewer extends StatelessWidget {
  TextViewer({this.sender,this.text,this.isMe,this.time});
  final String sender,text;
  final bool isMe;
  final Timestamp time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Text(
            '$sender: ',
            style: kLoginCredentials.copyWith(
              fontSize: 20,
              color: isMe?Color(0xff35b997):Color(0xfff0e995),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'LucidaConsole',
            ),
          )
        ],
      ),
    );
  }
}
