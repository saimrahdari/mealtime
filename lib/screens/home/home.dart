import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meal_time/screens/customer/customerDashboard.dart';
import 'package:meal_time/screens/home/signUp.dart';
import 'package:meal_time/screens/owner/riders/ridersDashboard.dart';
import 'package:meal_time/screens/owner/table/ownerDashboard.dart';
import 'package:meal_time/screens/rider/riderPayment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../owner/table/ownerTable.dart';
import '../rider/riderDashboard.dart';

class HomePage extends StatelessWidget {

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        child: Scaffold(  
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Stack(
              children: [
                Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Image.asset('assets/images/meal.png'),
                  ),
                  Image.asset('assets/images/down.png'),
                ],
              ),
              
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: _size.height * 0.37,
                      ),
                      TextFormField(
                        cursorColor: Color(0xFFD46D6A),
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            fontFamily: 'SeogeUI',
                            fontSize: 20,
                            color: Color(0xFFD46D6A),
                            fontWeight: FontWeight.w100
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),  
                            borderSide: BorderSide(
                              color: const Color(0xff707070), 
                              width: 0.8
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),  
                            borderSide: BorderSide(
                              color: const Color(0xff707070), 
                              width: 0.8
                            ),
          
                          ),
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),  
                        ),
                        style: TextStyle(
                          fontFamily: 'SeogeUI',
                          fontSize: 20,
                          color: Color(0xFFD46D6A),
                        ),
                      ),
      
                      SizedBox(
                        height: _size.height * 0.04,
                      ),
                      
                      TextFormField(
                        cursorColor: Color(0xFFD46D6A),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: 'SeogeUI',
                            fontSize: 20,
                            color: Color(0xFFD46D6A),
                            fontWeight: FontWeight.w100
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),  
                            borderSide: BorderSide(
                              color: const Color(0xff707070), 
                              width: 0.8
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),  
                            borderSide: BorderSide(
                              color: const Color(0xff707070), 
                              width: 0.8
                            ),
          
                          ),
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),  
                        ),
                        style: TextStyle(
                          fontFamily: 'SeogeUI',
                          fontSize: 20,
                          color: Color(0xFFD46D6A),
                        ),
                      ),  
                      SizedBox(
                        height: _size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUpPage()),  
                                );
                              },
                              child: Text('Sign Up', 
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontFamily: 'SeogeUI',
                                fontSize: 15,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: _size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () async{
                          final _prefs = await SharedPreferences.getInstance();
                          
                          if(_usernameController.text.trim() == "owner@gmail.com" && _passwordController.text.trim() == "owner"){
                            _prefs.setBool("loggedIn", true);
                            _prefs.setString("loggedInAcc", "Owner");
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OwnerDashboard()),
                            );
                          } else if(await customerCheck()) {
                            _prefs.setBool("loggedIn", true);
                            _prefs.setString("loggedInAcc", "Customer");
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CustomerDashboard()),
                            );
                          } else if(_usernameController.text.trim() == "rider@gmail.com" && _passwordController.text.trim() == "rider"){{
                            _prefs.setBool("loggedIn", true);
                            _prefs.setString("loggedInAcc", "Rider");
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RiderPayment()),
                            );
                          }

                          }
                        },
                        child: Container(
                          width: _size.width * 0.3,
                          height: _size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              stops: [
                                0,
                                0.1,
                                1.0
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF858181),
                                Color(0xFF997D7D),
                                Color(0xFFE26D6D),
                              ],
                            ),
                          ),
                          child: Center(child: Text('Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'SeogeUI'
                          ), 
                          ))
                        ),
                      ),

                      
                      SizedBox(height: _size.height * 0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RiderDashboard()),
                              );
                            },
                            child: Container(
                              width: _size.width * 0.2,
                              height: _size.height * 0.2,
                              decoration: BoxDecoration(
                                color: Color(0XFFE4E4E4),
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xFF707070))
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: _size.width * 0.13,
                                  height: _size.height * 0.13,
                                  child: Image.asset('assets/images/rider.png'))
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              
              ],
            ),
        ),
      ),
    );
  }

  Future<bool> customerCheck() async{
    final _prefs = await SharedPreferences.getInstance();
    String? _jobsString = await _prefs.getString('users');

    log(_jobsString.toString());

    if(_jobsString != null){
      List<dynamic> _jobs = jsonDecode(_jobsString);

      for(int i = 0; i < _jobs.length; i++){
        if((_usernameController.text == _jobs[i]['username']) && (_passwordController.text == _jobs[i]['password']) ){
          return true;
        }
      }
    }
    return false;
  }
}