import 'package:flutter/material.dart';
import 'package:meal_time/screens/customer/customerRestaurantBook.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerDashboard extends StatelessWidget {

  List<String> _restaurants = [
    "BreakFast Point",
  ];


  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFE6E6),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 40, 35, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('\nRestaurants',
                    style: TextStyle(
                      color: Color(0xFF73868D),
                      fontWeight: FontWeight.w900,
                      fontSize: 28
                    ),
                  ),
                GestureDetector(
                  onTap: () async{
                    final _prefs = await SharedPreferences.getInstance();
                    _prefs.setString("loggedInAcc", "");
                    _prefs.setBool("loggedIn", false);

                    Navigator.of(context).pop();
                      
                  },
                  child: Image.asset('assets/images/logout.png'))
              ],),
            ),
          
          SizedBox(height: _size.height * 0.03,),

          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomerRestaurantBook(restaurantName: _restaurants[index], index: index,)),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/${index + 1}.png'),
                          SizedBox(width: _size.width * 0.05),
                          Text('${_restaurants[index]}',
                          style: TextStyle(
                            fontFamily: 'SeogeScript',
                            fontSize: 28
                          )
                          )
                        ],
                      ),
                    ),
                  );
                }, 
                separatorBuilder: (context, index) {
                  return SizedBox(height: _size.height * 0.04,);
                }, 
                itemCount: _restaurants.length),
          ),

          
          SizedBox(height: _size.height * 0.03,),
          
        ]),
      ),
    );
  }
}