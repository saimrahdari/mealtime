import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerViewReservations extends StatefulWidget {
  OwnerViewReservations({ Key? key, required this.index}) : super(key: key);
  int? index;

  @override
  State<OwnerViewReservations> createState() => _OwnerViewReservationsState();
}

class _OwnerViewReservationsState extends State<OwnerViewReservations> {

  TextEditingController _tableNumberController = new TextEditingController();
  Map<String, dynamic>? _map;
  String? name, date, startTime, endTime;
  int? tableNumber, requires;

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

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
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(child: Image.asset('assets/images/top.png')),
                  Image.asset('assets/images/bottom.png'),

              ],),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 170, 35, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      children: [
                      Row(children: [
                      GestureDetector(
                        onTap: () {
                            Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                      SizedBox(width: _size.width * 0.03,),
                      Text('Reservations',
                        style: TextStyle(
                          color: Color(0xFF73868D),
                          fontWeight: FontWeight.w900,
                          fontSize: 28
                        ),
                      ),
                      ],),
                    ],),
                  ),
                  SizedBox(height: _size.height * 0.02,),
                  
                  Container(
                    width: _size.width * 0.85,
                    height: _size.height * 0.48,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF707070)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0) //                 <--- border radius here
                    ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,13,0,13),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                            SizedBox(width: _size.width * 0.04,),
                            Icon(Icons.person,
                            size: 60,
                            ),
                            SizedBox(width: _size.width * 0.03,),
                            
                            Text('${this.name}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 28,
                                color: Colors.black,
                              ),
                            ),
                          ]),

                          Text('Table ${this.tableNumber}',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 26,
                                color: Color(0xFF737171)
                              ),
                            ),

                            Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            SizedBox(width: _size.width * 0.04,),
                            Text('Requires: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w800 ,
                                fontSize: 24,
                                color: Color(0xFF737171)
                              ),
                            ),
                            
                            Text('A table of ${this.requires}',
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xFF737171)
                              ),
                            ),
                          ]), 
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            SizedBox(width: _size.width * 0.15,),
                            Text('Date: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                 fontSize: 24,
                                color: Color(0xFF737171)
                              ),
                            ),
                            
                            Text('${this.date}',
                              style: TextStyle(
                                 fontSize: 24,
                                color: Color(0xFF737171)
                              ),
                            ),
                          ]),
                            Row(
                            children: [
                            SizedBox(width: _size.width * 0.15,),
                            Text('Time: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                 fontSize: 24,
                                color: Color(0xFF737171)
                              ),
                            ),
                            
                            Text('${this.startTime} - ${this.endTime}',
                              style: TextStyle(
                                 fontSize: 24,
                                color: Color(0xFF737171)
                              ),
                            ),
                          ]),
                          
                        ],
                      ),
                    ),
                  ),
          
            
                  SizedBox(height: _size.height * 0.03,)
              ]),
            ]
          ),
        ),
      ),
    );
  }

  getData() async{
    final _prefs = await SharedPreferences.getInstance();
    String? tables = await _prefs.getString("tables");

    _map = jsonDecode(tables!);

    List<dynamic> tableNumbers = _map!['tableNumber'];
    List<dynamic> reservationName = _map!['reservationName'];
    List<dynamic> reservationRequirement = _map!['reservationRequirement'];
    List<dynamic> reservationDate = _map!['reservationDate'];
    List<dynamic> reservationStartTime = _map!['reservationStartTime'];
    List<dynamic> reservationEndTime = _map!['reservationEndTime'];

    this.name = reservationName[widget.index!];
    this.date = reservationDate[widget.index!];
    this.startTime = reservationStartTime[widget.index!];
    this.endTime = reservationEndTime[widget.index!];
    this.tableNumber = tableNumbers[widget.index!];
    this.requires = reservationRequirement[widget.index!];
    
    setState(() {});
    
  }
}