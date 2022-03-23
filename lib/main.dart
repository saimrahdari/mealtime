import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meal_time/screens/customer/customerDashboard.dart';
import 'package:meal_time/screens/home/home.dart';
import 'package:meal_time/screens/home/signUp.dart';
import 'package:meal_time/screens/owner/table/ownerDashboard.dart';
import 'package:meal_time/screens/rider/riderApplication.dart';
import 'package:meal_time/screens/rider/riderApplicationForm.dart';
import 'package:meal_time/screens/rider/riderDashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/customer/customerRestaurantBook.dart';
import 'screens/rider/riderPayment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool loggedIn = false;
  String? loggedInAcc;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loggedInCheck();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Time',
      theme: ThemeData( 
        fontFamily: 'Raleway',
      ),
      home: loggedIn ? this.loggedInAcc == "Owner" ? OwnerDashboard() : 

      this.loggedInAcc == "Customer" ? CustomerDashboard() : 
      
      this.loggedInAcc == "Rider" ? RiderDashboard() : HomePage() : HomePage(),

    );
  }


  void loggedInCheck() async{
    final _prefs = await SharedPreferences.getInstance();
    bool? loggedIn = await _prefs.getBool('loggedIn');
    String? loggedInAcc = await _prefs.getString('loggedInAcc');
    
    if(loggedIn == null){
      this.loggedIn = false;
    } else if(loggedIn == false){
      this.loggedIn = false;
    } else if(loggedIn == true){
      
      if(loggedInAcc == "Owner"){
        this.loggedIn = true;
        this.loggedInAcc = "Owner";
      } else if(loggedInAcc == "Customer"){
        this.loggedIn = true;
        this.loggedInAcc = "Customer";
      } else if(loggedInAcc == "Rider"){
        this.loggedIn = true;
        this.loggedInAcc = "Rider";
      }
    }

    setState(() {
      
    });
  
  }
}
