import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class StoreShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0x2625364F),
        //     blurRadius: 10.0,
        //     offset: Offset(0.0, 5.0),
        //   ),
        // ],
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
          child:Container(
            //  height: 175,
              width: MediaQuery.of(context).size.width*.91,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFFE3E6E6)),
                //  color:const Color(0xFFFFFFFF)
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 102,
                        width: 126,
                        padding:const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset('assets/images/post4.png',fit: BoxFit.cover,color: Colors.white,)),
                      ),
                      // SizedBox(width: 12,),
                      // Stack(
                      //   children: [
                      //     Container(
                      //       height: 102,
                      //       width: 126,
                      //       padding:const EdgeInsets.symmetric(horizontal: 12),
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //       child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(8),
                      //           child: Image.asset('assets/images/post4.png',fit: BoxFit.cover,)),
                      //     ),
                      //     Positioned(
                      //       bottom: 0,
                      //       child:
                      //       Container(
                      //         alignment: Alignment.center,
                      //         height: 24,
                      //         padding: EdgeInsets.symmetric(horizontal: 12),
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.only(
                      //               topRight: Radius.circular(4),bottomRight: Radius.circular(4),),
                      //             //border: Border.all(color:const Color(0xFFE3E6E6)),
                      //             color:const Color(0xFFFF0000).withOpacity(.8)),
                      //         child: Text('buy 2 + gift',
                      //             style: TextStyle(
                      //               fontSize: 12,
                      //               letterSpacing: .4,
                      //               fontFamily: 'Roboto',
                      //               fontWeight: FontWeight.w400,
                      //               color: Color(0xDEFFFFFF),
                      //             )
                      //         ),
                      //       ),)
                      //   ],
                      // ),
                      // const  SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*.5,
                            child: Text(
                                Localizations.localeOf(context).languageCode == 'ar' ?
                                    "TruSkin Vitamin C Serum for Face, Anti Aging Serum":
                                'TruSkin Vitamin C Serum for Face, Anti Aging Serum',
                                maxLines: 2,overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF000000),
                                )),
                          ),
                          const  SizedBox(height: 3,),
                          RatingBar(
                            ratingWidget: RatingWidget(
                              full: Icon(
                                Icons.star,
                                color:const Color(0xFFE6B800),
                              ),
                              empty: Icon(
                                Icons.star_border,
                                color:const Color(0xFFE6B800),
                              ),
                              half: Icon(
                                Icons.star_half,
                                color:const Color(0xFFE6B800),
                              ),
                            ),
                            unratedColor:const  Color(0xFFF2781F),
                            glowColor: const  Color(0xFFFFFFFF),
                            onRatingUpdate: (val) {
                            },
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15.0,
                            tapOnlyMode: false,
                            initialRating: 4.5,ignoreGestures: true,
                            updateOnDrag: false,
                            direction: Axis.horizontal,
                          ),
                          // RatingBarIndicator(
                          //   rating: 3.5,
                          //   itemBuilder: (context, index) => Icon(
                          //     Icons.star,
                          //     color:const Color(0xFFE6B800),
                          //   ),
                          //   itemCount: 5,
                          //   itemSize: 14.0,
                          //   unratedColor:const Color(0xFFE6B800).withOpacity(.6)  ,
                          //   direction: Axis.horizontal,
                          // ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text.rich(
                            TextSpan(
                              text: Localizations.localeOf(context).languageCode ==  'ar'?
                              "240 "
                                  :"240 ",
                              style: TextStyle(
                                fontSize: 16,
                                color:  Color(0xFF037979),
                                fontWeight: FontWeight.w700,
                                letterSpacing: .12,
                                fontFamily: 'Nunito',
                              ),
                              // " By selecting Agree and continue below, I agree to round's Terms and conditions "
                              children: <TextSpan>[
                                TextSpan(
                                  text: Localizations.localeOf(context).languageCode ==  'ar'?
                                  'ريال  ':'SAR  ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:  Color(0xFF037979),
                                    letterSpacing: .11,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                                TextSpan(
                                  text: Localizations.localeOf(context).languageCode ==  'ar'?
                                  '260 ريال':'260 SAR',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:  Color(0x99000000),
                                    letterSpacing: .09,
                                    fontWeight: FontWeight.w700,
                                    decoration:TextDecoration.lineThrough,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                                // can add more TextSpans here...
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     //Icon(MyCustomIcons.recommended_this_product,size: 15,),
                          //     //const SizedBox(width: 10,),
                          //     Container(
                          //         width: 15,height: 15,
                          //         child: Image.asset('assets/images/recommended.png',fit: BoxFit.cover,)),
                          //     const  SizedBox(width: 10,),
                          //     Text(
                          //         Localizations.localeOf(context).languageCode == 'ar' ?
                          //             "موصى بة (10)":
                          //         'RECOMMENDED (10)',
                          //         style: TextStyle(
                          //           fontSize: 10,
                          //           letterSpacing: .5,
                          //           fontFamily: 'Nunito',
                          //           fontWeight: FontWeight.w600,
                          //           color: Color(0xDE000000),
                          //         )),
                          //   ],
                          // )
                        ],
                      ),
                      const  SizedBox(width: 24,),
                    ],
                  ),
                  SizedBox(height: 13,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 12,),
                      //Icon(MyCustomIcons.minus,color: Colors.white,),
                      //  Image.asset('assets/images/minus.png',  color: Colors.white,),
                      // Container(
                      //    height: 37,
                      //    padding: EdgeInsets.symmetric(horizontal: 14),
                      //    alignment: Alignment.center,
                      //    decoration: BoxDecoration(
                      //      // borderRadius: BorderRadius.circular(8),
                      //        border: Border.all(color: Color(0x1F000000)),
                      //        color: Color(0XFFFFFFFF)),
                      //    child: Text('2',
                      //        style: TextStyle(
                      //          fontSize: 14,
                      //          fontFamily: 'Nunito',
                      //          fontWeight: FontWeight.w700,
                      //          color: Color(0xDE000000),
                      //        )
                      //    ),
                      //  ),
                      //  Image.asset('assets/images/plus.png',    color:Color(0XFFFFFFFF).withOpacity(.3),),

                      Container(
                        height: 37,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: Color(0x29000000),
                            //       offset: Offset(0, 2.0),
                            //       blurRadius: 2.0),
                            // ],
                            color: Color(0XFFFFFFFF).withOpacity(.3) ),
                        child: Text(
                            Localizations.localeOf(context).languageCode == 'ar' ?
                                "أضف الى السله":
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFFFFF),
                            )
                        ),
                      ),
                      SizedBox(width: 12,),
                      Container(
                        height: 37,
                        width: 130,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0x29000000)),
                            borderRadius: BorderRadius.circular(8),
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: Color(0x29000000),
                            //       offset: Offset(0, 2.0),
                            //       blurRadius: 2.0),
                            // ],
                            color:Color(0XFFFFFFFF).withOpacity(.3)
                        ),
                        child: Text(
                            Localizations.localeOf(context).languageCode == 'ar' ?
                                "أضف الى المفضله":
                            "Add to wishlist",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              color:Color(0xFFFFFFFF),
                            )
                        ),
                      )
                    ],
                  )
                ],
              )
          )
        // Container(
        //   height: 175,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: <Widget>[
        //       Padding(
        //         padding: const EdgeInsets.only(left: 34, right: 34, bottom: 15),
        //         child: Row(
        //           //mainAxisSize: MainAxisSize.max,
        //           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: <Widget>[
        //             Expanded(
        //               flex: 3,
        //               child: Row(
        //                 children: <Widget>[
        //                   CircleAvatar(
        //                     radius: 12.5,
        //                   ),
        //                   SizedBox(width: 20),
        //                   Expanded(
        //                     child: Container(
        //                       width: 70,
        //                       height: 6.0,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Expanded(
        //               flex: 1,
        //               child: Center(
        //                 child: Container(
        //                   width: 30,
        //                   height: 6.0,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ),
        //             Expanded(
        //               flex: 3,
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.end,
        //                 children: <Widget>[
        //                   Expanded(
        //                     child: Align(
        //                       alignment: Alignment.centerLeft,
        //                       child: Container(
        //                         width: 70,
        //                         height: 6.0,
        //                         color: Colors.white,
        //                       ),
        //                     ),
        //                   ),
        //                   SizedBox(width: 20),
        //                   CircleAvatar(
        //                     radius: 12.5,
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           Container(
        //             height: 26,
        //             padding: const EdgeInsets.symmetric(horizontal: 15.0),
        //             alignment: Alignment.center,
        //             width: 80.0,
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.only(
        //                     topRight: Radius.circular(5),
        //                     topLeft: Radius.circular(5)),
        //                 color: Colors.white),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
