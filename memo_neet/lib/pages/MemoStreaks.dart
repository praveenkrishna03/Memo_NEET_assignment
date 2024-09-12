import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memo_neet/streak.dart';
import 'package:memo_neet/sub_pages/subject_streaks.dart';

class MemoStreaks extends StatefulWidget {
  @override
  MemoStreaksState createState() => MemoStreaksState();
}

class MemoStreaksState extends State<MemoStreaks> {
  // Define streak value
  int Streak=streak; 
  late String displayText;
  final List<int> _streaks = [ 32,  5,8];

  @override
  void initState() {
    super.initState();
    displayText = _getDisplayText(streak);
  }

  String _getDisplayText(int streak) {
    if (streak <= 100) return 'Aspiring Healer';
    if (streak <= 200) return 'Dedicated Scholar';
    if (streak <= 300) return 'Medical Specialist';
    return 'Future Doctor';
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'TiltNeon',
    );

    final List<String> _subjects = [ "Biology",  "Physics", "Chemistry"];
    final List<String> _images = [ "lib/images/Bio_1.png",  "lib/images/Phy_1.png", "lib/images/Chem_1.png"];
 

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [Text(
                'MemoStreak',
                style: textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: (){
                Get.dialog( Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:SizedBox(
            height: 700,
            width: 450,

            child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("lib/images/streak.png", height: 150, width: 150),
            SizedBox(height: 16),
            
            SizedBox(
              
              height: 500,
              child:
            ListView(
                children: [
                  // Aspiring Healer
                  TierCard(
                    title: 'Aspiring Healer',
                    requirement: 'Maintain a streak of 0-100 days.',
                    description: 'Start your journey by consistently maintaining a streak of up to 100 days.',
                    rewards: 'Access unit tests without a subscription.',
                  ),
                  SizedBox(height: 16), // Space between tiers
                  
                  // Dedicated Scholar
                  TierCard(
                    title: 'Dedicated Scholar',
                    requirement: 'Maintain a streak of 101-200 days.',
                    description: 'Elevate your commitment by keeping a streak between 101 and 200 days.',
                    rewards: 'Access monthly tests, enhancing your learning experience.',
                  ),
                  SizedBox(height: 16),
                  
                  // Medical Specialist
                  TierCard(
                    title: 'Medical Specialist',
                    requirement: 'Maintain a streak of 201-300 days.',
                    description: 'Reach expert status with a streak of 201 to 300 days.',
                    rewards: 'Retake any unit or monthly test multiple times for deeper understanding.',
                  ),
                  SizedBox(height: 16),
                  
                  // Future Doctor
                  TierCard(
                    title: 'Future Doctor',
                    requirement: 'Maintain a streak of 300+ days.',
                    description: 'Achieve the pinnacle of dedication with a streak of over 300 days.',
                    rewards: 'Access mock tests for free, preparing you comprehensively for any challenge.',
                  ),
                ],
              ),)
          ],
        ),
          )
          
          )
        
        
      ),
    ));
 }, icon: Icon(Icons.info))
              ],
              )
            ),
            Center(child: Image.asset("lib/images/streak.png", height: 100, width: 100)),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["0", "100", "200", "300+"].map((text) => Text(text, style: textStyle)).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["|", "|", "|", "|"].map((text) => Text(text, style: textStyle)).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: LinearProgressIndicator(
                  value: streak / 365,
                  backgroundColor: Colors.grey[200],
                  color: Colors.blue,
                  minHeight: 10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(displayText, style: textStyle),
                  Text("$streak", style: textStyle),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top :5.0, bottom: 5.0),
                    child: buildCard(index, _subjects[index],_images[index],_streaks[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget buildCard(int index, final String name,final String image,final int streak) {
    return InkWell(
      onTap: () {
        // Handle card tap here
        if(index==0){
          Get.to(() => Subjects_Streak(), transition: Transition.rightToLeft);
        }
      },
      child:
    
    
    SizedBox(
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(

          children:[
            SizedBox(width: 10,),
            Image.asset(image,height: 50,width: 50,),
            SizedBox(width: 10,),
            Center(
              child:Text(name, style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'TiltNeon')) 
            ),
            Spacer(),
            Text("$streak",style:TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'TiltNeon')),
            SizedBox(width: 20,)
            ]
             
      ),
    )));
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