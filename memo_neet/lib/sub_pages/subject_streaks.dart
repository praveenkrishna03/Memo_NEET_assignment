import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Subjects_Streak extends StatefulWidget {
  @override
  Subjects_Streak_state createState() => Subjects_Streak_state();
}

class Subjects_Streak_state extends State<Subjects_Streak> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History"),),
      body: Expanded(child: ListView.builder(
                itemCount: 31,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: buildCard(index,index+1,"lib/images/book.png" ),
                  );
                },
              ),)
    );
  }

  Widget buildCard(int index,final int name,final String image) {
    return InkWell(
      onTap: () {
        
        
       
        
      },
      child:
    
    
    SizedBox(
      height: 75,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(

          children:[
            SizedBox(width: 20,),
            Image.asset(image,height: 50,width: 50,),
            SizedBox(width: 20,),
            Center(
              child:Text("Notes $name", style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'TiltNeon')) 
            ),
            Spacer(),
            Text("$name / 08 / 2024",style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'TiltNeon')),
            SizedBox(width: 10,)
            ]
             
      ),
    ))
    
    );
  }
}
class TierCard extends StatelessWidget {
  final String title;
  final String requirement;
  final String description;
  final String rewards;

  TierCard({
    required this.title,
    required this.requirement,
    required this.description,
    required this.rewards,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Requirement: $requirement',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Description: $description',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Rewards: $rewards',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}