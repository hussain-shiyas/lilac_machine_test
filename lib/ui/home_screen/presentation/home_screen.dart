import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F6F6),
        leading: Image.asset('assets/menu_icon.png'),
        actions: [
          Image.asset('assets/notification_icon.png'),
          SizedBox(width: 15,)
        ],
      ),
      body: const Padding(
        padding:  EdgeInsets.all(20.0),
        child:  Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeWidget(
                  icon: "assets/total_vehicle_icon.png",
                  title: "Total Vehicle",
                  number: "100",
                ),

                HomeWidget(
                  icon: "assets/total_booking_icon.png",
                  title: "Total Booking",
                  number: "50",
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeWidget(
                  icon: "assets/concept_icon.png",
                  title: "C2B Concepts",
                  number: "25",
                ),

                HomeWidget(
                  icon: "assets/vehicle_sale_icon.png",
                  title: "Vehicle For Sale",
                  number: "35",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String number;
  const HomeWidget({
    super.key, required this.icon, required this.title, required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon,height: 120,width: 120,),
            Text(number,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
            Text(title,style: const TextStyle(fontSize: 14,color: Color(0xff6F6C7A)),),
          ],
        ),
      ),
    );
  }
}
