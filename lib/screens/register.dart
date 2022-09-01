import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/snack_bar.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);
  static String id='Register';
  @override
  State<Register> createState() => _RegisterState();


}

class _RegisterState extends State<Register> {
  String? email;

  String? pass;

  bool isAysnc=false;

  GlobalKey<FormState> formkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isAysnc,
      child: Scaffold(
        backgroundColor:kPrimaryColor ,
        body: Center(
          child: Form(
            key: formkey,
            child: ListView(

              children: [
                SizedBox(height: 70,),
                Text('Register',style: TextStyle(
                  fontSize: 60,
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                ),textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                Text('create your account',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                SizedBox(height: 50,),
                CustomTextField(text: 'User Name', icon: Icon(Icons.person),onChanged: (user)=>user),
                CustomTextField(text: 'Email address', icon: Icon(Icons.email),onChanged: (uemail){email=uemail;},),
                CustomTextField(text: 'Password', icon: Icon(Icons.password),onChanged: (upassword){pass=upassword;},obsecure: true,),
                CustomTextField(text: 'Confirm Password', icon: Icon(Icons.password),obsecure: true,onChanged: (vpass)=>vpass),
                SizedBox(height: 40,),
                // emial registration
                CustomButton(text: 'Register',onpressed: () async{
                    if(formkey.currentState!.validate()){
                      isAysnc=true;
                      setState(() {

                      });
                      try{
                        await RegisterMethod();
                        ShowSnack(context,'Successfully Registered');
                        Navigator.pop(context);

                      }on FirebaseAuthException catch(e){
                        if (e.code == 'weak-password') {
                          ShowSnack(context, 'Weak password');
                        } else if (e.code == 'email-already-in-use') {
                          ShowSnack(context, 'email is already used');
                        }

                      }
                      isAysnc=false;
                      setState(() {

                      });
                    }

                }
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',style: TextStyle(color: Colors.white),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text('Login now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> RegisterMethod() async {
     FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: pass!);
  }
}
