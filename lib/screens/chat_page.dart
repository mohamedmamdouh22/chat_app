import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/bubble.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String id='home';
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    var email=ModalRoute.of(context)!.settings.arguments;
    //FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference messages = FirebaseFirestore.instance.collection(kMessageCollection);
    //final Stream<QuerySnapshot> messages = FirebaseFirestore.instance.collection(kMessageCollection).snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream:messages.orderBy('time',descending: true).snapshots() ,
      builder: (context, snapshot){
        if(snapshot.hasData){
          List<Message>messageList=[];
          for(int i=0;i<snapshot.data!.docs.length;i++)
          {
            messageList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Chat'),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
            ),
            body: Column(
                children:[
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _scrollController,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) =>messageList[index].id==email?Bubble(message: messageList[index],):Bubble2(message: messageList[index])),
                  ),
                  MessageBar(

                    onSend: (data){
                      messages.add({
                        'message':data,
                        'time':DateTime.now(),
                        'id':email
                      });
                      _scrollController.animateTo(_scrollController.position.minScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    actions: [
                      InkWell(
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 24,
                        ),
                        onTap: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: InkWell(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.green,
                            size: 24,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ]
            ),


          );
        }else
          {return Scaffold(
            body: Center(
              child: LoadingIndicator(
                  indicatorType: Indicator.ballRotate, /// Required, The loading type of the widget
                  colors: const [Colors.orangeAccent],       /// Optional, The color collections
                  strokeWidth: 1,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                  backgroundColor: Colors.white,      /// Optional, Background of the widget
                  pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
              ),
            ),
          );
          }
      }
      );
  }
}
