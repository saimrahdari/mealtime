import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meal_time/screens/owner/reservations/ownerUpdateReservations.dart';
import 'package:meal_time/screens/owner/reservations/ownerViewReservations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerReservations extends StatefulWidget {

  @override
  State<OwnerReservations> createState() => _OwnerReservationsState();
}

class _OwnerReservationsState extends State<OwnerReservations> {
  List<String> _list = ["Reserved", "Requested" ];
  List<bool> _listCheck = [true, false];
  Map<String, dynamic>? _map;


  TextEditingController _tableNumberController = new TextEditingController();

  List<dynamic>? _tableNumber = [];
  List<dynamic>? _tableCapacity = [];
  List<dynamic>? _tableReserved = [];
  List<dynamic>? _tableRequested = [];
  List<dynamic>? _name = [];
  List<dynamic>? _date = [];
  List<dynamic>? _startTime = [];
  List<dynamic>? _endTime = [];
  List<dynamic>? _seats = [];


  @override
  void initState() {
    // TODO: implement initState
    getTables();
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
          body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 60, 35, 30),
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
                    SizedBox(height: _size.height * 0.03,),
                    Container(
                      height: _size.height * 0.08,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                                onTap: () {
                                  _listCheck = List<bool>.filled(_listCheck.length, false);
                                  _listCheck[index] = true;
                                  getTables();
                                  setState(() {
                                  });
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text('${_list[index]}', style: TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 18,
                                        color: _listCheck[index] ? Color(0xFFE81111) : Color(0xFF858181) ,
                                      ),),
                                      SizedBox(height: _size.height * 0.01),
                                      _listCheck[index] ? 
                                      Container(  
                                        height: 1,
                                        width: _size.width * 0.15,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE81111)
                                        ),
                                      ) : Container(),
                                    ],
                                  ),
                                ),
                              );
                          }), 
                          separatorBuilder: (context, index) => SizedBox(width: _size.width * 0.3,), 
                          itemCount: _list.length),
                    ),
                  _listCheck[0] ? 
                    
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return _tableReserved![index] ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => OwnerViewReservations(index: index,)),
                                    );
                                  },
                                  child: Container(
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
                                        Text('Table ${_tableNumber![index]}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 26,
                                            color: Color(0xFF737171)
                                          ),
                                        ),
                                        Text('Reserved',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 18
                                          ),
                                        )
                                      ],),
                                      
                                      SizedBox(width: _size.width * 0.3),
                                      
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => OwnerUpdateReservations(
                                              index: index, tableNumber: _tableNumber![index],)),
                                          );
                                        },
                                        child: Icon(Icons.border_color_rounded,
                                        color: Color(0xFF686464),
                                        ),
                                      )
                                    ]),
                                  ),
                                ),
                              ],
                            ) : Container();
                          }, 
                          separatorBuilder: (context, index) {
                            return SizedBox(height: _size.height * 0.04,);
                          }, 
                          itemCount: _tableReserved!.length),
                    )
                    : 
                    
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return _tableRequested![index] ? 
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                                  height: _size.height * 0.43,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF707070)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25.0) //                 <--- border radius here
                                  ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0,20,0,20),
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
                                          
                                          Text('${_name![index]}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 24,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ]),
                                    
                                          Row(mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                          SizedBox(width: _size.width * 0.22,),
                                          Text('Requires: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800 ,
                                              fontSize: 22,
                                              color: Color(0xFF737171)
                                            ),
                                          ),
                                          
                                          Text('A table of ${_seats![index]}',
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Color(0xFF737171)
                                            ),
                                          ),
                                        ]), 
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                          SizedBox(width: _size.width * 0.22,),
                                          Text('Date: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                               fontSize: 22,
                                              color: Color(0xFF737171)
                                            ),
                                          ),
                                          
                                          Text('${_date![index]}',
                                            style: TextStyle(
                                               fontSize: 22,
                                              color: Color(0xFF737171)
                                            ),
                                          ),
                                        ]),
                                          Row(
                                          children: [
                                          SizedBox(width: _size.width * 0.22,),
                                          Text('Time: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                               fontSize: 22,
                                              color: Color(0xFF737171)
                                            ),
                                          ),
                                          
                                          Text('${_startTime![index]} - ${_endTime![index]}',
                                            style: TextStyle(
                                               fontSize: 22,
                                              color: Color(0xFF737171)
                                            ),
                                          ),
                                        ]),
                                    
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                          GestureDetector(
                                            onTap: () {
                                              acceptRequest(index);
                                              
                                              setState(() {
                                                
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: _size.width * 0.1,
                                                  height: _size.height * 0.1,
                                                  decoration: BoxDecoration(
                                                    color: Color(0XFF9C9494),
                                                    shape: BoxShape.circle
                                                  ),
                                                  child: Icon(Icons.check, color: Colors.white, size: 27,),
                                                ),
                                                
                                                Text('Accept',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15
                                                ),
                                                )
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              declineRequest(index);
                                              setState(() {
                                                
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: _size.width * 0.1,
                                                  height: _size.height * 0.1,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF646464),
                                                    shape: BoxShape.circle
                                                  ),
                                                  child: Icon(Icons.close, color: Colors.white, size: 27,),
                                                ),
                                                Text('Decline',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15
                                                ),
                                                )
                                              ],
                                            ),
                                          ),
                                          
                                          
                                        ]),
                                    
                                      ],
                                    ),
                                  ),
                                ),
                            )

 : Container();
                          }, 
                          separatorBuilder: (context, index) {
                            return SizedBox(height: _size.height * 0.04,);
                          }, 
                          itemCount: _tableReserved!.length),
                    ),

                    
              
                    SizedBox(height: _size.height * 0.03,)
                ]),
          ),
        ),
    );
  }
  
  getTables() async {
    Map<String, dynamic>? _mapTemp;

    final _prefs = await SharedPreferences.getInstance();

    String? tablesString = _prefs.getString('tables');
    if(tablesString != null){
      _mapTemp = jsonDecode(tablesString);

      this._tableNumber = _mapTemp!['tableNumber'];
      this._tableCapacity = _mapTemp['tableCapacity'];
      this._tableReserved = _mapTemp['tableReserved'];
      this._tableRequested = _mapTemp['tableRequested'];
      this._date = _mapTemp['reservationDate'];
      this._name = _mapTemp['reservationName'];
      this._startTime = _mapTemp['reservationStartTime'];
      this._endTime = _mapTemp['reservationEndTime'];
      this._seats = _mapTemp['reservationRequirement'];

      setState(() {
        
      });
    }
  }

  acceptRequest(int index) async{
    final _prefs = await SharedPreferences.getInstance();
    String? tables = await _prefs.getString("tables");
  
    _map = jsonDecode(tables!);
    
    List<dynamic> reserved = _map!['tableReserved'];
    List<dynamic> requested = _map!['tableRequested'];

    reserved[index] = true;
    requested[index] = false;

    _map!['tableReserved'] = reserved;
    _map!['tableRequested'] = requested;

    String tablesUpdated = jsonEncode(_map);
    _prefs.setString('tables', tablesUpdated);
    
  
  }

  declineRequest(int index) async{
    final _prefs = await SharedPreferences.getInstance();
    String? tables = await _prefs.getString("tables");

    _map = jsonDecode(tables!);
    
    List<dynamic> reserved = _map!['tableReserved'];
    List<dynamic> requested = _map!['tableRequested'];
    List<dynamic> reservationName = _map!['reservationName'];
    List<dynamic> reservationRequirement = _map!['reservationRequirement'];
    List<dynamic> reservationDate = _map!['reservationDate'];
    List<dynamic> reservationStartTime = _map!['reservationStartTime'];
    List<dynamic> reservationEndTime = _map!['reservationEndTime'];

    reserved[index] = false;
    requested[index] = false;
    reservationName[index] = "";
    reservationRequirement[index] = 0;
    reservationDate[index] = "";
    reservationStartTime[index] = "";
    reservationEndTime[index] = "";

    _map!['tableReserved'] = reserved;
    _map!['tableRequested'] = requested;
    _map!['reservationName'] = reservationName;
    _map!['reservationRequirement'] = reservationRequirement;
    _map!['reservationDate'] = reservationDate;
    _map!['reservationStartTime'] = reservationStartTime;
    _map!['reservationEndTime'] = reservationEndTime;

    String tablesUpdated = jsonEncode(_map);
    _prefs.setString('tables', tablesUpdated);
    
  }

}