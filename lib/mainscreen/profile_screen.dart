import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:u_move_around/global/global.dart';
import 'package:u_move_around/mainscreen/main_screen.dart';
import 'package:u_move_around/widgets/info_design_ui.dart';

class ProfileScreen extends StatefulWidget {

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 150,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Icon(Icons.person,
                  size: 70,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                userModelCurrentInfo!.name!,
                style:const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                  height: 2,
                  thickness: 2,
                ),
              ),

              const SizedBox(height: 38,),

              InfoDesignUIWidget(
                textInfo: userModelCurrentInfo!.phone!,
                iconData: Icons.phone_iphone,
              ),

              InfoDesignUIWidget(
                textInfo: userModelCurrentInfo!.email!,
                iconData: Icons.email,
              ),

              const SizedBox(
                height: 20,
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
        ),
      ),
    );
  }
}
