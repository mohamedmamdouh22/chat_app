import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  CustomTextField({required this.text,required this.icon,required this.onChanged,this.obsecure=false});
  String text;
  Function(String)? onChanged;
  Icon icon;
  bool obsecure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: TextFormField(
        validator: (data){
          if(data!.isEmpty)
            {
              return 'this field is required';
            }
        },
        obscureText: obsecure,
        onChanged:onChanged ,
        decoration: InputDecoration(
          prefixIcon: icon,
          filled: true,
          enabledBorder: OutlineInputBorder(
            // borderSide: const BorderSide(width: 3, color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: text,
          fillColor: Color(0xffb9c2ee),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xff4f67d8)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
