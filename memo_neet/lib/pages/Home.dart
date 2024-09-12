import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:memo_neet/sub_pages/notes.dart';

class Home extends StatefulWidget {
  @override
  Home_state createState() => Home_state();
}

class Home_state extends State<Home> {
  final List<String> _images = [ "lib/images/book.png",  "lib/images/NCERT.png", "lib/images/notes.png", "lib/images/exam.png"];
  final List<String> _names = [ "Notes 2.0",  "NCERT Questions", "Revision","Tests"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add some padding around the grid
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Text(
              'Prepare', // Title at the beginning
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0, 
                children: List.generate(4, (index) {
                  return buildCard(index,_images[index],_names[index]); 
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(int index,final img,final name) {
    return InkWell(
      onTap: () {
        // Handle card tap here
        if(index==0){
          Get.to(() => Notes(), transition: Transition.rightToLeft);
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 2.0), 
          borderRadius: BorderRadius.circular(8.0), 
        ),
        child: SizedBox(
          width: 100, 
          height: 100, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img,
                height: 60,
                width: 60,
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'TiltNeon',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
