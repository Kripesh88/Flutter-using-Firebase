import 'package:flutter/material.dart';
import 'package:signup_application/Signin.dart';
import 'package:signup_application/signup.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage() ,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("SignUp Using FireBase"),
      ),
      body: Container(

        alignment: Alignment.center,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("SignUp"),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              },
            ),
            RaisedButton(

              child: Text("SignIn"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
