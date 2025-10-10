import 'package:flutter/material.dart';
class ReplayText extends StatelessWidget {
  const ReplayText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: ConstrainedBox(constraints:BoxConstraints(
          maxWidth:MediaQuery.of(context).size.width-65,
          minWidth: 0.0,
        ),
          child:Card(
            color:Colors.grey[300],
            child:Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 25,top: 5,bottom: 27),
                  child: Text("dskfsdk asdasdasklndsakdns sdlknasdkl",style: TextStyle(fontSize: 16.5,fontWeight:FontWeight.w500,color: Colors.white),),
                ),
                Positioned(
                  right: 7,
                  bottom: 2,
                  child: Row(
                    children: [
                      Text("20:40   ",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                )
              ],
            ) ,
          ),),
      ),
    );
  }
}
