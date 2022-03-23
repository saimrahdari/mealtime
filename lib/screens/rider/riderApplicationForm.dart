import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiderApplicationForm extends StatelessWidget {
  RiderApplicationForm({ Key? key, this.index}) : super(key: key);

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _contactController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  int? index;

  @override
  Widget build(BuildContext context) {

    Size _size =  MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFFE6E6),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/sideLeft.png'),
                Image.asset('assets/images/owner.png')
              ],
            ),
          ),
    
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 150, 0, 0),
              child: Text('Welcome to \nMeal Time!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color(0xFF73868D),
              ),
              ),
            ),
    
            SizedBox(height: _size.height * 0.05),
    
            Expanded(
             child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: _size.height * 0.04,),
                  
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 30, 0),
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
                            Text('Age',
                              style: TextStyle(
                                color: Color(0xFFD46D6A),
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: _size.height * 0.02,),
                            TextFormField(
                              controller: _ageController,
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
                            Text('Contact',
                              style: TextStyle(
                                color: Color(0xFFD46D6A),
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: _size.height * 0.02,),
                            TextFormField(
                              controller: _contactController,
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
                        Text('Address',
                              style: TextStyle(
                                color: Color(0xFFD46D6A),
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: _size.height * 0.02,),
                            TextFormField(
                              controller: _addressController,
                              maxLines: 3,
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
                                  
                                  this.index == null ? 

                                  recruit() : updateRecruit();


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
                                          height: 250,
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(height: _size.height * 0.02,),
                                                Text("Application \nSubmitted \nSuccessfully!",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.white
                                                    ),),
                                                SizedBox(height: _size.height * 0.05,),
                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context).pop();
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
                                                        color: Color(0XFF4C4545)
                                                      ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
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
          ],)
      
        ],),
      ),
    );
  }

  recruit() async{
    final _prefs = await SharedPreferences.getInstance();
  }

  updateRecruit() {

  }
}