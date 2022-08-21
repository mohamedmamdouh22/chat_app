import 'package:chat_app/screens/login.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff4f67d8) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2,),
            Text('Register',style: TextStyle(
              fontSize: 60,
              fontFamily: 'Pacifico',
              color: Colors.white,
            ),),
            SizedBox(height: 15,),
            Text('create your account',style: TextStyle(color: Colors.white),),
            Spacer(flex: 1,),
            CustomTextField(text: 'User Name', icon: Icon(Icons.person)),
            CustomTextField(text: 'Email address', icon: Icon(Icons.email)),
            CustomTextField(text: 'Password', icon: Icon(Icons.password)),
            CustomTextField(text: 'Confirm Password', icon: Icon(Icons.password)),
            Spacer(flex: 1,),
            CustomButton(text: 'Register'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',style: TextStyle(color: Colors.white),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return Login();
                    }));
                  },
                  child: Text('Login now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                ),
              ],
            ),
            Spacer(flex: 2,)

          ],
        ),
      ),
    );
  }
}
