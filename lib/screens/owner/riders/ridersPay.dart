import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:meal_time/screens/owner/reservations/ownerViewReservations.dart';

import '../reservations/ownerUpdateReservations.dart';
import '../table/ownerDashboard.dart';

class RidersPay extends StatefulWidget {
  @override
  State<RidersPay> createState() => _RidersPayState();
}

class _RidersPayState extends State<RidersPay> {

  TextEditingController _tableNumberController = new TextEditingController();

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
                          'Riders Payment',
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
              
                      Column(
                        children: [
                          Container(
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
                                    const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Image.asset('assets/images/riderNoBorder.png'),
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
                                        width: _size.width * 0.20,
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
                                        width: _size.width * 0.20,
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
                                        width: _size.width * 0.20,
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
                                          '9th Avenue Apartment',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Color(0xFF737171)),
                                        ),
                                      ),
                                    ]),
                                    
                                    Text('Payment',
                                        style: TextStyle(
                                          color: Color(0xFF737171),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    
                                    Center(
                                      child: TextFormField(
                                          readOnly: true,
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
                                            fontSize: 20,
                                            color: Color(0xFF737171),
                                          ),
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            
                          SizedBox(
                            height: _size.height * 0.03,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
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
                                    'Pay Now',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ))),
                            ),
                          ),
                          
                        ],
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
