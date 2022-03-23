import 'dart:convert';
import 'dart:developer';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:meal_time/screens/owner/reservations/ownerViewReservations.dart';
import 'package:meal_time/screens/owner/riders/ridersPay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../reservations/ownerUpdateReservations.dart';
import '../table/ownerDashboard.dart';

class RidersDashboard extends StatefulWidget {
  @override
  State<RidersDashboard> createState() => _RidersDashboardState();
}

class _RidersDashboardState extends State<RidersDashboard> {
  List<String> _list = ["Post", "Recruit", "Pay"];
  List<bool> _listCheck = [true, false, false];

  TextEditingController _addressController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  String? _timeStartController, _timeEndController;
  
  List<dynamic> _recruits = [];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFFFFE6E6),
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 40, 35, 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back_ios_new_outlined)),
                        SizedBox(
                          width: _size.width * 0.03,
                        ),
                        Text(
                          'Riders',
                          style: TextStyle(
                              color: Color(0xFF73868D),
                              fontWeight: FontWeight.w900,
                              fontSize: 28),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 82,
                        width: 82,
                        child: Image.asset('assets/images/rider.png'))
                  ],
                ),
              ),
              Container(
                height: _size.height * 0.08,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          _listCheck =
                              List<bool>.filled(_listCheck.length, false);
                          _listCheck[index] = true;
                          setState(() {});
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                '${_list[index]}',
                                style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 18,
                                  color: _listCheck[index]
                                      ? Color(0xFFE81111)
                                      : Color(0xFF858181),
                                ),
                              ),
                              SizedBox(height: _size.height * 0.01),
                              _listCheck[index]
                                  ? Container(
                                      height: 1,
                                      width: _size.width * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE81111)),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) => SizedBox(
                          width: _size.width * 0.2,
                        ),
                    itemCount: _list.length),
              ),
              _listCheck[0]
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(
                                color: Color(0xFFD46D6A),
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          TextFormField(
                            controller: _addressController,
                            cursorColor: Color(0xFFD46D6A),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                    color: const Color(0xff707070), width: 0.8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                    color: const Color(0xff707070), width: 0.8),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF737171),
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          Text(
                            'Age',
                            style: TextStyle(
                                color: Color(0xFFD46D6A),
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          TextFormField(
                            controller: _ageController,
                            cursorColor: Color(0xFFD46D6A),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                    color: const Color(0xff707070), width: 0.8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                    color: const Color(0xff707070), width: 0.8),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF737171),
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          Text(
                            'Timing',
                            style: TextStyle(
                                color: Color(0xFFD46D6A),
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: _size.width * 0.40,
                                child: DateTimePicker(
                                  timeLabelText: 'Start Time',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF737171),
                                  ),
                                  type: DateTimePickerType.time,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: const Color(0xff707070), width: 0.8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: const Color(0xff707070), width: 0.8),
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  ),
                                  initialValue: '',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  dateLabelText: 'Date',
                                  onChanged: (val) {
                                    _timeStartController = val;
                                  } 
                                ),
                              ),
                              Container(
                                width: _size.width * 0.40,
                                child: DateTimePicker(
                                  timeLabelText: 'End Time',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF737171),
                                  ),
                                  type: DateTimePickerType.time,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: const Color(0xff707070), width: 0.8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          color: const Color(0xff707070), width: 0.8),
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  ),
                                  initialValue: '',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  dateLabelText: 'Date',
                                  onChanged: (val) {
                                    _timeEndController = val;
                                  } 
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                                color: Color(0xFFD46D6A),
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: _size.height * 0.02,
                          ),
                          TextFormField(
                            controller: _descriptionController,
                            maxLines: 5,
                            cursorColor: Color(0xFFD46D6A),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                    color: const Color(0xff707070), width: 0.8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(
                                    color: const Color(0xff707070), width: 0.8),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 15, 20, 15),
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF737171),
                            ),
                          ),
                          SizedBox(
                            height: _size.height * 0.03,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                final _prefs = await SharedPreferences.getInstance();

                                String? _jobsString = _prefs.getString('jobPosting');

                                if(_jobsString == null){
                                  List<dynamic> _jobs = [{
                                    "address" : _addressController.text,
                                    "age" : _ageController.text,
                                    "startTime" : _timeStartController,
                                    "endTime" : _timeEndController,
                                    "description" : _descriptionController.text
                                  }];

                                  String _jobString = jsonEncode(_jobs);
                                  _prefs.setString('jobPosting', _jobString);

                                } else {
                                  String? _jobsString = await _prefs.getString('jobPosting');

                                  List<dynamic> _jobs = jsonDecode(_jobsString!);
                                  
                                  Map<String, dynamic>? _map = {
                                    "address" : _addressController.text,
                                    "age" : _ageController.text,
                                    "startTime" : _timeStartController,
                                    "endTime" : _timeEndController,
                                    "description" : _descriptionController.text
                                  };

                                  _jobs.add(_map);

                                  String _jobString = jsonEncode(_jobs);
                                  _prefs.setString('jobPosting', _jobString);
                                }

                                _addressController.clear();
                                _ageController.clear();
                                _timeStartController = "";
                                _timeEndController = "";
                                _descriptionController.clear();
                              },
                              child: Container(
                                  width: _size.width * 0.3,
                                  height: _size.height * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    border:
                                        Border.all(color: Color(0XFF707070)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFDEDEDE),
                                        Color(0xFFDF6868),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Post Job',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ))),
                            ),
                          ),
                        ],
                      ),
                    )
                  : _listCheck[1]
                      ? Container(
                        height: _size.height * 0.65,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                              width: _size.width * 0.85,
                              height: _size.height * 0.43,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF707070)),
                                borderRadius: BorderRadius.all(Radius.circular(
                                        25.0) //                 <--- border radius here
                                    ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(children: [
                                      SizedBox(
                                        width: _size.width * 0.04,
                                      ),
                                      Icon(
                                        Icons.person,
                                        size: 60,
                                      ),
                                      SizedBox(
                                        width: _size.width * 0.03,
                                      ),
                                      Text(
                                        'Marcus Lucas',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 24,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]),
                                    Row(children: [
                                      SizedBox(
                                        width: _size.width * 0.22,
                                      ),
                                      Text(
                                        'Age: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 22,
                                            color: Color(0xFF737171)),
                                      ),
                                      Text(
                                        '24',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Color(0xFF737171)),
                                      ),
                                    ]),
                                    Row(children: [
                                      SizedBox(
                                        width: _size.width * 0.22,
                                      ),
                                      Text(
                                        'Contact: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 22,
                                            color: Color(0xFF737171)),
                                      ),
                                      Text(
                                        '7261927105',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Color(0xFF737171)),
                                      ),
                                    ]),
                                    Row(children: [
                                      SizedBox(
                                        width: _size.width * 0.22,
                                      ),
                                      Text(
                                        'Address: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 22,
                                            color: Color(0xFF737171)),
                                      ),
                                      Flexible(
                                        child: Text(
                                          '9th Avenue \nApartment',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Color(0xFF737171)),
                                        ),
                                      ),
                                    ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: _size.width * 0.1,
                                                  height: _size.height * 0.1,
                                                  decoration: BoxDecoration(
                                                      color: Color(0XFF9C9494),
                                                      shape: BoxShape.circle),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 27,
                                                  ),
                                                ),
                                                Text(
                                                  'Hire',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: _size.width * 0.1,
                                                  height: _size.height * 0.1,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFF646464),
                                                      shape: BoxShape.circle),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 27,
                                                  ),
                                                ),
                                                Text(
                                                  'Ignore',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                            );
                          }, 
                          separatorBuilder: (context, index) {
                            return SizedBox(height: _size.height * 0.04,);
                          }, 
                          itemCount: 2),
                    )
                      : 
                      
                       Container( 
                          height: _size.height * 0.65,
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        
                                      },
                                      child: Container(
                                        width: _size.width * 0.9,
                                        height: _size.height * 0.12,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFF707070)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  25.0) //                 <--- border radius here
                                              ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 0),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(children: [
                                                  Image.asset(
                                                      'assets/images/riderblack.png'),
                                                  SizedBox(
                                                    width: _size.width * 0.03,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Alex Smith',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 26,
                                                            color: Color(
                                                                0xFF737171)),
                                                      ),
                                                      Text(
                                                        'Payment: Not Verified',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      )
                                                    ],
                                                  ),
                                                ]),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => RidersPay()),
                                                    );
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width:
                                                            _size.width * 0.09,
                                                        height:
                                                            _size.height * 0.09,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0XFF9C9494),
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Center(
                                                            child: Image.asset(
                                                                'assets/images/money.png')),
                                                      ),
                                                      Text(
                                                        'Pay Now',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 15),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: _size.height * 0.04,
                                );
                              },
                              itemCount: 7),
                        ),
                      
              SizedBox(
                height: _size.height * 0.03,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
