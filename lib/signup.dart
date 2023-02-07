import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class SignUp extends StatelessWidget {

  TextEditingController _email= new TextEditingController();
  TextEditingController _password= new TextEditingController();
  TextEditingController _username= new TextEditingController();

  Future<void> signup() async{
    try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text,
            password: _password.text,
        );
    }
    on FirebaseAuthException catch(e){
      if(e.code== 'weak-password'){
        print("The password provided is too weak");
      } else if(e.code=='email-already-in-use'){
        print("The account already exist for that email");
      }

    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
               icon: Icon(Icons.person_pin),
               labelText: "Enter your Username: ",
               hintText: "UserName",

             ),
             controller: _username,
           ),
           decoration: BoxDecoration(
             color: Colors.greenAccent,
             borderRadius: BorderRadiusDirectional.circular(20),

           ),
         ),
            Container(

              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "Enter Email: ",
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
                    return 'please enter password of minimum length of 6';
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
                child: Text("SignUp",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  //color: Colors.white,
                  fontSize: 20,
                ),),
                onPressed: (){
                  signup();
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
