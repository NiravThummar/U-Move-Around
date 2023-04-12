import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:u_move_around/mainscreen/main_screen.dart';
import 'package:u_move_around/widgets/my_drawer.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            height: 230,
            child: Center(
              child: Image.asset(
                "assets/images/car_logo.png",
                width: 250,
              ),
            ),
          ),

          Column(
            children: [
              const Text(
                "Move Around",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Text(
                "This App has been developed by Nirav Thummar"
                "This is ride sharing app, available for all.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              ElevatedButton(
                onPressed: ()
                {
                  Navigator.push(context,MaterialPageRoute(builder: (c)=> MainScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white60,
                ),
                child:const Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
