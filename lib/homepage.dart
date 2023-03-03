import 'package:flutter/material.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.lightBlue,

        appBar: AppBar(
          backgroundColor: Colors.red,
        title: Text("Welcome to Your New Account."),
    ),
    body: Container(

    alignment: Alignment.center,
    child: Column(
  children: [
    Image.network('https://i.pinimg.com/736x/2d/7f/68/2d7f68518a4f6372ec052a91e81e7a9b.jpg'),

    ],



    ),
    ),
    );
    
  }
}

