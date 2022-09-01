import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/register.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/snack_bar.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  static String id='Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;
  GlobalKey<FormState> formkey=GlobalKey();
  String? password;

  bool isAsync=false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isAsync,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff203f81),
                Color(0xff4f67d8),
              ])),
          child: Center(
            child: Form(
              key: formkey,
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(
                    'assets/images/login1.png',
                    width: 300,
                    height: 250,
                  ),
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      fontSize: 40,
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50,),
                  CustomTextField(text: 'Email Address',icon: Icon(Icons.person),onChanged: (data){email=data;}),

                  CustomTextField( text:'Password',icon: Icon(Icons.lock),onChanged: (data){password=data;},obsecure: true,),
                  SizedBox(height: 50,),
                  //check email and password
                  CustomButton(text: 'Login',onpressed: () async {
                   if(formkey.currentState!.validate()){
                     isAsync=true;
                     setState(() {});
                     try {
                       await loginMethod();
                       // ShowSnack(context, 'Successfuly logged in');
                       Navigator.pushNamed(context, HomeScreen.id,arguments: email);
                     } on FirebaseAuthException catch (e) {
                       if (e.code == 'user-not-found') {
                         ShowSnack(context, 'user not found');
                       } else if (e.code == 'wrong-password') {
                         ShowSnack(context, 'Wrong password');
                       }
                     }
                     isAsync=false;
                     setState(() {});
                   }
                  },),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have an account?',style: TextStyle(color: Colors.white),),
                      GestureDetector(
                        onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                        return Register();
                      }));
                        },
                        child: Text('Register now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                      ),
                    ],
                  ),


              ],
          ),
            ),
        ),
      ),
      ),
    );
  }

  Future<void> loginMethod() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!

    );
  }
}
