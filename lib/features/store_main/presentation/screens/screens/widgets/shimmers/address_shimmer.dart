import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class AddressShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
       // color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Shimmer.fromColors(
          baseColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[900]!
              : Colors.grey[300]!,
          highlightColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[800]!
              : Colors.grey[100]!,
          direction: ShimmerDirection.rtl,
          enabled: true,
          child:
          Container(
            height: 90,
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0x29000000), width: 1),
              color: Color(0xFFEBF7F7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 14,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  //   Icon(Icons.star,color:const Color(0xFFCCC7B8),),
                  // const SizedBox(width: 8,),
                    Text('Buraydah' ??"",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          color:const Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                          letterSpacing: .5,
                          fontSize: 16
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.more_vert,color:const Color(0xFFFFFFFF),
                      size: 25,
                    ),
                  ],
                ),
                SizedBox(height: 3,),
                Text('Al Amir Faisal Ibn Bandar Ibn Abdul' ??"",
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color:const Color(0xFF000000),
                      fontWeight: FontWeight.w600,
                      letterSpacing: .25,
                      fontSize: 14
                  ),
                ),
                SizedBox(height: 4,),
                Text('+966 54 777 3310'??"",
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color:const Color(0xBD000000),
                      fontWeight: FontWeight.w600,
                      letterSpacing: .4,
                      fontSize: 12
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
