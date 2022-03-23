import 'package:flutter/material.dart';
import 'package:meal_time/screens/rider/riderApplication.dart';

class RiderDashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        child: Scaffold(  
          backgroundColor: Color(0xFFFFE6E6),
          resizeToAvoidBottomInset: false,
          body: Stack(
              children: [
                Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 60, 40, 0),
                    child: Image.asset('assets/images/owner.png'),
                  ),
                  Image.asset('assets/images/riderBottom.png'),
                ],
              ),
              
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Welcome to \nMeal Time!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF73868D),
                    ),
                    ),
                  ),

                  SizedBox(height: _size.height * 0.2,),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: _size.width * 0.6,
                        height: _size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Color(0XFF707070)),
                          color: Color(0xFFEA8484),
                        ),
                        child: Center(child: Text('Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ), 
                        ))
                      ),
                    ),
                  ),
                  SizedBox(height: _size.height * 0.03,),
                   Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RiderApplication()),
                        );
                      },
                      child: Container(
                        width: _size.width * 0.8,
                        height: _size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: Color(0XFF707070)),
                          color: Color(0xFFEA8484),
                        ),
                        child: Center(child: Text('Apply for the Job',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ), 
                        ))
                      ),
                    ),
                  ),
                ],
              ),
              ],
            ),
        ),
      ),
    );
  }
}