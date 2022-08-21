import 'package:chat_app/screens/register.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1,),
              Image.asset(
                'assets/images/login1.png',
                width: 300,
                height: 250,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                ),
              ),
              CustomTextField(text: 'User Name',icon: Icon(Icons.person),),
              CustomTextField( text:'Password',icon: Icon(Icons.lock)),
              Spacer(flex: 1,),
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
              Spacer(flex: 2,),

            ],
          ),
        ),
      ),
    );
  }
}