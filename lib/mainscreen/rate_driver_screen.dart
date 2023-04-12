import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:u_move_around/global/global.dart';

class RateDriverScreen extends StatefulWidget
{
  String? assignedDriverId;
  RateDriverScreen({this.assignedDriverId});

  @override
  State<RateDriverScreen> createState() => _RateDriverScreenState();
}

class _RateDriverScreenState extends State<RateDriverScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor : Colors.black,
      body: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        backgroundColor: Colors.white54,
        child: Container(
          margin:const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 22,),

              const Text(
                "Rate Trip Experience",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 22,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 22,),

              const Divider(height: 4,thickness: 4,),

              const SizedBox(height: 22,),

              SmoothStarRating(
                rating: countRatingStar,
                allowHalfRating: false,
                starCount: 5,
                color: Global.starColor,
                borderColor: Global.borderColor,
                size: 46,
                onRatingChanged: (valueOfStarChoosed)
                {
                  countRatingStar = valueOfStarChoosed;
                  if(countRatingStar == 1)
                    {
                      setState(() {
                        titleStarRating ="Very Bad";
                        Global.starColor = Colors.red;
                        Global.borderColor = Colors.red;
                        Global.textColor = Colors.red;
                      });
                    }
                  if(countRatingStar == 2)
                  {
                    setState(() {
                      titleStarRating ="Bad";
                      Global.starColor = Colors.orange;
                      Global.borderColor = Colors.orange;
                      Global.textColor = Colors.orange;
                    });
                  }
                  if(countRatingStar == 3)
                  {
                    setState(() {
                      titleStarRating ="Good";
                      Global.starColor = Colors.yellow;
                      Global.borderColor = Colors.yellow;
                      Global.textColor = Colors.yellow;
                    });
                  }
                  if(countRatingStar == 4)
                  {
                    setState(() {
                      titleStarRating ="Very Good";
                      Global.starColor = Colors.lightGreen;
                      Global.borderColor = Colors.lightGreen;
                      Global.textColor = Colors.lightGreen;
                    });
                  }
                  if(countRatingStar == 5)
                  {
                    setState(() {
                      titleStarRating ="Excellent";
                      Global.starColor = Colors.green;
                      Global.borderColor = Colors.green;
                      Global.textColor = Colors.green;
                    });
                  }
                },
              ),

              const SizedBox(height: 12,),

              Text(
                titleStarRating,
                style:TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Global.textColor,
                ),
              ),

              const SizedBox(height: 18,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                ),
                onPressed: ()
                {
                  DatabaseReference rateDriverRef = FirebaseDatabase.instance.ref()
                      .child("drivers")
                      .child(widget.assignedDriverId!)
                      .child("ratings");

                  rateDriverRef.once().then((snap)
                  {
                    if(snap.snapshot.value == null)
                      {
                        rateDriverRef.set(countRatingStar.toString());
                        SystemNavigator.pop();
                      }
                    else
                      {
                        double pastRatings = double.parse(snap.snapshot.value.toString());
                        double newAverageRatings = (pastRatings + countRatingStar) / 2;
                        rateDriverRef.set(newAverageRatings.toString());
                        SystemNavigator.pop();
                      }
                    Fluttertoast.showToast(msg: "Please Restart The App");
                  }
                  );
                },
                child:const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
