import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  static String id='Register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kPrimaryColor ,
      body: Center(
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
            CustomTextField(text: 'User Name', icon: Icon(Icons.person),),
            CustomTextField(text: 'Email address', icon: Icon(Icons.email)),
            CustomTextField(text: 'Password', icon: Icon(Icons.password)),
            CustomTextField(text: 'Confirm Password', icon: Icon(Icons.password)),
            SizedBox(height: 40,),
            CustomButton(text: 'Register'),
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
    );
  }
}
