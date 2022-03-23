import 'dart:convert';
import 'dart:developer';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:meal_time/screens/owner/reservations/ownerViewReservations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerUpdateReservations extends StatefulWidget {

  OwnerUpdateReservations({ Key? key , required this.index, required this.tableNumber}) : super(key: key);
  int? index, tableNumber;

  @override
  State<OwnerUpdateReservations> createState() => _OwnerUpdateReservationsState();
}

class _OwnerUpdateReservationsState extends State<OwnerUpdateReservations> {

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _tableNumberController = new TextEditingController();
  String? _dateController, _timeStartController, _timeEndController;
  Map<String, dynamic>? _map;

  @override
  void initState() {
    // TODO: implement initState
    _tableNumberController.text = widget.tableNumber.toString();
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
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFFFFE6E6),
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(child: Image.asset('assets/images/top.png')),
              ],),
              SingleChildScrollView(
                child: Column(
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
                        Text('Update Reservation',
                          style: TextStyle(
                            color: Color(0xFF73868D),
                            fontWeight: FontWeight.w900,
                            fontSize: 28
                          ),
                        ),
                        ],),
                      ],),
                    ),
                    SizedBox(height: _size.height * 0.01,),
              
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                        Text('Name',
                          style: TextStyle(
                            color: Color(0xFFD46D6A),
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: _size.height * 0.02,),
                        TextFormField(
                          controller: _nameController,
                          cursorColor: Color(0xFFD46D6A),
                          decoration: InputDecoration(
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
                            fontSize: 18,
                            color: Color(0xFF737171),
                          ),
                        ),
                        
                        
              
                        SizedBox(height: _size.height * 0.02,),
                        Text('Date',
                          style: TextStyle(
                            color: Color(0xFFD46D6A),
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: _size.height * 0.02,),
                        
                        DateTimePicker(
                          icon: Icon(Icons.arrow_drop_down),
                          decoration: InputDecoration(
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
                          initialValue: '',
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          dateLabelText: 'Date',
                          onChanged: (val) {
                            _dateController = val;
                          },
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF737171),
                          ),
                        ),
              
                        SizedBox(height: _size.height * 0.02,),
                        Text('Time',
                          style: TextStyle(
                            color: Color(0xFFD46D6A),
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: _size.height * 0.02,),
                        
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
              
                    SizedBox(height: _size.height * 0.02,),
                    Text('Table Number',
                          style: TextStyle(
                            color: Color(0xFFD46D6A),
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: _size.height * 0.02,),
                        TextFormField(
                          enabled: false,
                          controller: _tableNumberController,
                          cursorColor: Color(0xFFD46D6A),
                          decoration: InputDecoration(
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
                            fontSize: 18,
                            color: Color(0xFF737171),
                          ),
                        ),
                    SizedBox(height: _size.height * 0.03,),
                    Center(
                      child: GestureDetector(
                              onTap: () {
                                updateData(widget.index!);
                              },
                              child: Container(
                                width: _size.width * 0.3,
                                height: _size.height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(color: Color(0XFF707070)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFDEDEDE),
                                      Color(0xFFDF6868),
                                    ],
                                  ),
                                ),
                                child: Center(child: Text('Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                ), 
                                ))
                              ),
                            ),
                    ),
                      ],),
                    ),
                          
                    SizedBox(height: _size.height * 0.03,)
                ]),
              ),
            ]
          ),
        ),
      ),
    );
  }

  updateData(int index) async{
    final _prefs = await SharedPreferences.getInstance();
    String? tables = await _prefs.getString("tables");

    _map = jsonDecode(tables!);
    
    List<dynamic> reservationName = _map!['reservationName'];
    List<dynamic> reservationDate = _map!['reservationDate'];
    List<dynamic> reservationStartTime = _map!['reservationStartTime'];
    List<dynamic> reservationEndTime = _map!['reservationEndTime'];

    reservationName[index] = _nameController.text;
    reservationDate[index] = _dateController;
    reservationStartTime[index] = _timeStartController;
    reservationEndTime[index] = _timeEndController;

    String tablesUpdated = jsonEncode(_map);
    _prefs.setString('tables', tablesUpdated);

    setState(() {
      Navigator.of(context).pop();
    });

    _nameController.clear();

    log(_prefs.getString('tables').toString());
  }
}