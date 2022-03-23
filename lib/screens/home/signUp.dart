import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({ Key? key }) : super(key: key);

  
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        child:  Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [

                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Image.asset('assets/images/meal.png'),
                  ),
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
                      height: _size.height * 0.04,
                    ),
                    
                    TextFormField(
                      cursorColor: Color(0xFFD46D6A),
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
                    GestureDetector(
                      onTap: () async {
                        final _prefs = await SharedPreferences.getInstance();
                        String? _usersString = _prefs.getString('users');

                        if(_usersString == null){
                          List<dynamic> _jobs = [{
                            "username" : _usernameController.text,
                            "password" : _passwordController.text,
                          }];

                          String _userString = jsonEncode(_jobs);
                          _prefs.setString('users', _userString);

                        } else {
                          String? _usersString = await _prefs.getString('users');
                          List<dynamic> _jobs = jsonDecode(_usersString!);
                          
                          Map<String, dynamic>? _map = {
                            "username" : _usernameController.text,
                            "password" : _passwordController.text,
                          };

                          _jobs.add(_map);

                          String _jobString = jsonEncode(_jobs);
                          _prefs.setString('users', _jobString);
                        }

                        _usernameController.clear();
                        _passwordController.clear();
                        _confirmPasswordController.clear();
                        
                        Navigator.of(context).pop();
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
                        child: Center(child: Text('Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'SeogeUI'
                        ), 
                        ))
                      ),
                    ),


                ],),
              ),

              ]
            ),
          ),
        ),
    );
  }
}