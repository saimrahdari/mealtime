import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meal_time/screens/owner/reservations/ownerReservations.dart';
import 'package:meal_time/screens/owner/riders/ridersDashboard.dart';
import 'package:meal_time/screens/owner/table/ownerTable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerDashboard extends StatefulWidget {
  const OwnerDashboard({ Key? key }) : super(key: key);

  @override
  State<OwnerDashboard> createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {

  List<String> _list = ["Tables", "Reservations", "Riders"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFE6E6),
        body: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 40, 35, 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                Row(children: [
                GestureDetector(
                  onTap: () async{
                    final _prefs = await SharedPreferences.getInstance();

                      _prefs.setString("loggedInAcc", "");
                      _prefs.setBool("loggedIn", false);

                      Navigator.of(context).pop();
                      
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined)),
                SizedBox(width: _size.width * 0.03,),
                Text('Hi Owner',
                  style: TextStyle(
                    color: Color(0xFF73868D),
                    fontWeight: FontWeight.w900,
                    fontSize: 28
                  ),
                ),
                ],),
                SizedBox(
                  height: 82,
                  width: 82,
                  child: Image.asset('assets/images/owner.png'))
              ],),
            ),
            Text('Welcome to Our Restaurant',
              style: TextStyle(
                color: Color(0xFF858181),
                fontSize: 22
              ),
            ),
            SizedBox(height: _size.height * 0.04,),

            Container(
              height: _size.height * 0.08,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                        onTap: () {
                          _list[index] == "Tables" ? 
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OwnerTable()),
                          ) : _list[index] == "Reservations" ? 
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OwnerReservations()),
                          ) : 
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RidersDashboard()),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Text('${_list[index]}', style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                fontSize: 18,
                                color: Color(0xFF858181) ,
                              ),),
                              SizedBox(height: _size.height * 0.01),
                              Container(  
                                height: 1,
                                width: _size.width * 0.15,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE81111)
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                  }), 
                  separatorBuilder: (context, index) => SizedBox(width: _size.width * 0.15,), 
                  itemCount: _list.length),
                  ),
          
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: _size.width * 0.9,
                          height: _size.height * 0.12,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF707070)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0) //                 <--- border radius here
                          ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            SizedBox(width: _size.width * 0.04,),
                            Image.asset('assets/images/table.png'),
                            SizedBox(width: _size.width * 0.03,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text('Table 1',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 26,
                                  color: Color(0xFF737171)
                                ),
                              ),
                              Text('Max Capacity: 5',
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 18
                                ),
                              )
                            ],),
                          ]),
                        ),
                      ],
                    );
                  }, 
                  separatorBuilder: (context, index) {
                    return SizedBox(height: _size.height * 0.04,);
                  }, 
                  itemCount: 7),
            ) ,

            SizedBox(height: _size.height * 0.03,),
        ]),
      ),
    );
  }
}