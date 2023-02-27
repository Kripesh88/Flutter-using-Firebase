

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signup_application/homepage.dart';
import 'package:signup_application/main.dart';

class SignIn extends StatelessWidget {

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  Future<User?> signin(BuildContext context) async{

    try{

      UserCredential userCredential= await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,


      );


    }

    catch(e){
      print(e);
    }
    print("SignIn successful !!");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=> MainPage()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(

            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: "Enter Your Email: ",
                hintText: "Email",

              ),
              controller: _email,
            ),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadiusDirectional.circular(20),


            ),
          ),
          Container(

            padding: EdgeInsets.all(10),

            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.password_rounded),
                labelText: "Enter your Password: ",
                hintText: "Password",

              ),
              validator: (value){
                if(value!.length<6){
                  return 'Please Enter Password Of Minimum Length Of 6';
                }else{
                  return null;
                }
              },
              controller: _password,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadiusDirectional.circular(20),

            ),
          ),
          Container(
            height:70 ,
            width:400,

            padding: EdgeInsets.all(10),
            child: FlatButton(
              child: Text("SignIn",style: TextStyle(
                fontWeight: FontWeight.bold,
                //color: Colors.white,
                fontSize: 20,
              ),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));;
              },
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadiusDirectional.circular(20),

            ),
          ),
        ],
      ),
    ),
    );
  }
}




