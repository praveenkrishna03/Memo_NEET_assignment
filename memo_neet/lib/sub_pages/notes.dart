import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:memo_neet/sub_pages/notes_in.dart';

class Notes extends StatefulWidget {
  @override
  Notes_state createState() => Notes_state();
}

class Notes_state extends State<Notes> {

  final List<String> _subjects = [ "Biology",  "Physics", "Chemistry"];
  final List<String> _images = [ "lib/images/Bio_1.png",  "lib/images/Phy_1.png", "lib/images/Chem_1.png"];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes"),),
      body: Expanded(child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: buildCard(index,_subjects[index],_images[index] ),
                  );
                },
              ),)
    );
  }

  Widget buildCard(int index, final String name,final String image) {
    return InkWell(
      onTap: () {
        // Handle card tap here
        if(index==0){
          Get.to(() => Notes_in(), transition: Transition.rightToLeft);
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
            SizedBox(width: 20,),
            Image.asset(image,height: 75,width: 75,),
            SizedBox(width: 20,),
            Center(
              child:Text(name, style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'TiltNeon')) 
            ),]
             
      ),
    ))
    
    );
  }
}
