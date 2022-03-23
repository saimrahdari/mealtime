import 'package:flutter/material.dart';

class RiderPayment extends StatefulWidget {

  @override
  State<RiderPayment> createState() => _RiderPaymentState();
}

class _RiderPaymentState extends State<RiderPayment> {
  List<String> _list = ["Due Payment", "Received" ];
  List<bool> _listCheck = [true, false];


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
          backgroundColor: Color(0xFFFFE6E6),
          body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 40, 35, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('\nPayments',
                          style: TextStyle(
                            color: Color(0xFF73868D),
                            fontWeight: FontWeight.w900,
                            fontSize: 28
                          ),
                        ),
                      Image.asset('assets/images/logout.png')
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
                                  Container(
                                    height: _size.height * 0.17,
                                    width: _size.width * 0.17,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xFF707070)),
                                      color: Color(0XFFFCB1B1),
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: Text('\$\$',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xFF858181)
                                      ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text('March',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 26,
                                        color: Color(0xFF737171)
                                      ),
                                    ),
                                  ],),
                                ]),
                              ),
                            ],
                          );
                        }, 
                        separatorBuilder: (context, index) {
                          return SizedBox(height: _size.height * 0.04,);
                        }, 
                        itemCount: 4),
                  )
                  : 
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
                                  Container(
                                    height: _size.height * 0.17,
                                    width: _size.width * 0.17,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xFF707070)),
                                      color: Color(0XFFFCB1B1),
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: Text('\$\$',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xFF858181)
                                      ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: _size.width * 0.03,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text('March',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 26,
                                        color: Color(0xFF737171)
                                      ),
                                    ),
                                    Text('Received on March 2, 2022 ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 18,
                                        color: Color(0xFF73868D)
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
                        itemCount: 2),
                  ),
          
            
                  SizedBox(height: _size.height * 0.03,)
              ]),
          ),
        ),
    );
  }
}