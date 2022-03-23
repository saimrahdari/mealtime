import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerTable extends StatefulWidget {

  @override
  State<OwnerTable> createState() => _OwnerTableState();
}

class _OwnerTableState extends State<OwnerTable> {
  TextEditingController _tableNumberController = new TextEditingController();

  List<String> _list = ["View Table", "Add Table" ];
  List<bool> _listCheck = [true, false];

  Map<String, dynamic>? _map;


  List<dynamic>? _tableNumber = [];
  List<dynamic>? _tableCapacity = [];

  String dropdownvalue = '1';   
  var items = [    
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  
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
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFFFFE6E6),
          body: Stack(
            children: [
              _listCheck[1] ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('assets/images/bottom.png')
              ],) : Column(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 40, 35, 30),
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
                      Text('Tables',
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
                  SizedBox(height: _size.height * 0.05,),
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
                                    Text('Table ${_tableNumber![index]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 26,
                                        color: Color(0xFF737171)
                                      ),
                                    ),
                                    Text('Max Capacity: ${_tableCapacity![index]}',
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
                        itemCount: _tableNumber!.length),
                  )
                  : 
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                      Text('Table Number',
                        style: TextStyle(
                          color: Color(0xFFD46D6A),
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: _size.height * 0.02,),
                      TextFormField(
                        cursorColor: Color(0xFFD46D6A),
                        controller: _tableNumberController,
                        decoration: InputDecoration(
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
          
                      SizedBox(height: _size.height * 0.02,),
                      Text('Max Capacity',
                        style: TextStyle(
                          color: Color(0xFFD46D6A),
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: _size.height * 0.02,),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(color: Color(0xff707070), width: 0.8)
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            style: TextStyle(
                            fontFamily: 'SeogeUI',
                            fontSize: 20,
                            color: Color(0xFFD46D6A),
                          ),
                            // Initial Value
                          value: dropdownvalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),   
                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) { 
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                                            ),
                        ),
                      ),
          
                      
                  SizedBox(height: _size.height * 0.03,),
          
                  Center(
                    child: GestureDetector(
                            onTap: () async{

                              final _prefs = await SharedPreferences.getInstance();
                              String? tables = await _prefs.getString("tables");

                              if(tables == null){

                                int tableNumber = int.parse(_tableNumberController.text);
                                int tableCapacity = int.parse(dropdownvalue);

                                  _map = {
                                  'ownerName' : 'owner',
                                  'tableNumber' : [tableNumber],
                                  'tableCapacity' : [tableCapacity],
                                  'tableReserved' : [false],
                                  'tableRequested': [false],
                                  'reservationName' : [""],
                                  'reservationRequirement': [0],
                                  'reservationDate': [""],
                                  'reservationStartTime': [""],
                                  'reservationEndTime': [""]
                                };

                                String table = jsonEncode(_map);
                                _prefs.setString('tables', table);
                                log(_prefs.getString('tables').toString());

                              } else {

                                _map = jsonDecode(tables);

                                int tableNumber = int.parse(_tableNumberController.text);
                                int tableCapacity = int.parse(dropdownvalue);
                                
                                List<dynamic> tableNumbers = _map!['tableNumber'];
                                List<dynamic> tableCapacities = _map!['tableCapacity'];
                                List<dynamic> reserved = _map!['tableReserved'];
                                List<dynamic> requested = _map!['tableRequested'];
                                List<dynamic> reservationName = _map!['reservationName'];
                                List<dynamic> reservationRequirement = _map!['reservationRequirement'];
                                List<dynamic> reservationDate = _map!['reservationDate'];
                                List<dynamic> reservationStartTime = _map!['reservationStartTime'];
                                List<dynamic> reservationEndTime = _map!['reservationEndTime'];

                                tableNumbers.add(tableNumber);
                                tableCapacities.add(tableCapacity);
                                reserved.add(false);
                                requested.add(false);
                                reservationName.add("");
                                reservationRequirement.add(0);
                                reservationDate.add("");
                                reservationStartTime.add("");
                                reservationEndTime.add("");

                                _map!['tableNumber'] = tableNumbers;
                                _map!['tableCapacity'] = tableCapacities;
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

                              _tableNumberController.clear();
                              dropdownvalue = '1';
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
                              child: Center(child: Text('Add Table',
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
            ]
          ),
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
      setState(() {
        
      });
    }
  }

}