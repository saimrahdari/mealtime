import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'riderApplicationForm.dart';

class RiderApplication extends StatefulWidget {

  @override
  State<RiderApplication> createState() => _RiderApplicationState();
}

class _RiderApplicationState extends State<RiderApplication> {

  List<dynamic> _jobs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
          resizeToAvoidBottomInset: false,
          body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 60, 35, 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                      SizedBox(width: _size.width * 0.03,),
                      Text('Riders Required',
                          style: TextStyle(
                            color: Color(0xFF73868D),
                            fontWeight: FontWeight.w900,
                            fontSize: 28
                          ),
                        ),
                    ],),
                  ),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RiderApplicationForm()),
                        );
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
                        child: Center(child: Text('Fill A Form',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ), 
                        ))
                      ),
                    ),
                  ),

                  SizedBox(height: _size.height * 0.05,),

                  Expanded( 
                    child: ListView.separated(
                        shrinkWrap: true, 
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Container(
                                width: _size.width * 0.85,
                                height: _size.height * 0.45,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF707070)),
                                  borderRadius: BorderRadius.all(Radius.circular(
                                          25.0) //                 <--- border radius here
                                      ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 30, 20, 30),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Row(children: [
                                        Text(
                                          'Area: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20,
                                              color: Color(0xFF737171)),
                                        ),
                                        Flexible(
                                          child: Text(
                                            '${_jobs[index]['address']}',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFF737171)),
                                          ),
                                        ),
                                      ]),
                                      
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            Text(
                                              'Age: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20,
                                                  color: Color(0xFF737171)),
                                            ),
                                            Text(
                                              '${_jobs[index]['age']}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFF737171)),
                                            ),
                                          ]),

                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => RiderApplicationForm(index: index,)),
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                Image.asset('assets/images/riderblack.png'),
                                                Text('Apply Now',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600
                                                  ),
                                                  )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            Text(
                                              'Timings: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20,
                                                  color: Color(0xFF737171)),
                                            ),
                                            Text(
                                              '${_jobs[index]['startTime']} - ${_jobs[index]['endTime']}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color(0xFF737171)),
                                            ),
                                          ]),
                                          
                                        ],
                                      ),
                                      Row(children: [
                                        Text(
                                          'Description: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20,
                                              color: Color(0xFF737171)),
                                        ),
                                        Flexible(
                                          child: Text(
                                            '${_jobs[index]['description']}',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFF737171)),
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
                          return SizedBox(
                            height: _size.height * 0.04,
                          );
                        },
                        itemCount: _jobs.length),
                  ),

                  SizedBox(height: _size.height * 0.03,)
                ],
              ),
        ),
      ),
    );
  }

  getData() async{
    final _prefs = await SharedPreferences.getInstance();
    String? _testString = await _prefs.getString('jobPosting');
    log(_testString!);

    if(_testString != null){
      List<dynamic> _jobs = jsonDecode(_testString);
      this._jobs = _jobs; 
    }

    setState(() {
      
    });
  }
}