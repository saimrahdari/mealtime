import 'dart:convert';
import 'dart:developer';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerRestaurantBook extends StatelessWidget {
  
  CustomerRestaurantBook({Key? key, required this.restaurantName, required this.index}) : super(key: key);

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _seatsController = new TextEditingController();

  String? restaurantName;
  int? index;
  String? _timeStartController, _timeEndController, _dateController;
  int? _tableNumber;


  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFE6E6),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 60, 35, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined)),
                SizedBox(width: _size.width * 0.03,),
                Text('Restaurants',
                    style: TextStyle(
                      color: Color(0xFF73868D),
                      fontWeight: FontWeight.w900,
                      fontSize: 28
                    ),
                  ),
              ],),
            ),
          
          SizedBox(height: _size.height * 0.03,),


          Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/${index! + 1}.png'),
                SizedBox(width: _size.width * 0.05),
                Text('$restaurantName',
                style: TextStyle(
                  fontFamily: 'SeogeScript',
                  fontSize: 28
                )
                )
              ],
          ),
        ),

         Expanded(
           child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: _size.height * 0.04,),
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
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
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
                      Text('Seats',
                            style: TextStyle(
                              color: Color(0xFFD46D6A),
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: _size.height * 0.02,),
                          TextFormField(
                            controller: _seatsController,
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
                                _reserveTable();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFF69D9D),
                                              Color(0xFFEA8484),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter
                                          ),
                                        ),
                                        height: 300,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: _size.height * 0.02,),
                                              Text('Thank You for choosing us',
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white
                                              ),
                                              ),
                                              SizedBox(height: _size.height * 0.05,),
                                              Text('Hope to see you at $restaurantName on ${_dateController} at ${_timeStartController} on Table $_tableNumber ',
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white
                                              ),
                                              ),
                                              SizedBox(height: _size.height * 0.05,),
                                              Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                      color: Color(0xFFFFB4B4),
                                                    ),
                                                    child: Text('OK',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                      color: Color(0xFFBF4949)
                                                    ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                  
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
                                  child: Center(child: Text('Submit',
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
         ),
          
          SizedBox(height: _size.height * 0.03,),
          
        ]),
      ),
    );
  }

  void _reserveTable() async{
    final _prefs = await SharedPreferences.getInstance();
    String? _mapString = _prefs.getString('tables');

    Map _map = jsonDecode(_mapString!); 
    
    List<dynamic> tableNumbers = _map['tableNumber'];
    List<dynamic> tableCapacities = _map['tableCapacity'];
    List<dynamic> reserved = _map['tableReserved'];
    List<dynamic> requested = _map['tableRequested'];
    List<dynamic> reservationName = _map['reservationName'];
    List<dynamic> reservationRequirement = _map['reservationRequirement'];
    List<dynamic> reservationDate = _map['reservationDate'];
    List<dynamic> reservationStartTime = _map['reservationStartTime'];
    List<dynamic> reservationEndTime = _map['reservationEndTime'];
    
    int? index;
    for(int i=0; i < tableCapacities.length; i++){
      if ((int.parse(_seatsController.text ) <= tableCapacities[i]) && (reserved[i] == false) && (requested[i] == false) ){
        index = i;
        break;
      }
    }
    if (index!= null){
      this._tableNumber = tableNumbers[index];
      requested[index] = true;
      reservationName[index] = _nameController.text;
      reservationRequirement[index] = int.parse(_seatsController.text);
      reservationDate[index] = _dateController;
      reservationStartTime[index] = _timeStartController;
      reservationEndTime[index] = _timeEndController;

      _map['tableNumber'] = tableNumbers;
      _map['tableCapacity'] = tableCapacities;
      _map['tableReserved'] = reserved;
      _map['tableRequested'] = requested;
      _map['reservationName'] = reservationName;
      _map['reservationRequirement'] = reservationRequirement;
      _map['reservationDate'] = reservationDate;
      _map['reservationStartTime'] = reservationStartTime;
      _map['reservationEndTime'] = reservationEndTime;

      String tablesUpdated = jsonEncode(_map);
      _prefs.setString('tables', tablesUpdated);

    }
  }

}