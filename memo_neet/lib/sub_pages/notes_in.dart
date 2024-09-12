import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Notes_in extends StatefulWidget {
  @override
  Notes_in_state createState() => Notes_in_state();
}

class Notes_in_state extends State<Notes_in> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes"),),
      body: Expanded(child: ListView.builder(
                itemCount: 20,
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
        // Handle card tap here
        
        Get.dialog( Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("lib/images/compl.png", height: 200, width: 200),
            SizedBox(height: 16),
            Text(
              "Streak Maintained Today!\n Keep it UP",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ));
        
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
              child:Text("Notes $name", style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'TiltNeon')) 
            ),]
             
      ),
    ))
    
    );
  }
}
