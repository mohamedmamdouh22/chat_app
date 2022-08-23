import 'package:chat_app/screens/register.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  static String id='Login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              CustomTextField(text: 'User Name',icon: Icon(Icons.person)),
              CustomTextField( text:'Password',icon: Icon(Icons.lock)),
              SizedBox(height: 50,),
              CustomButton(text: 'Login'),
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
    );
  }
}
