import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../custom_loading.dart';

class StoreMainItem extends StatefulWidget {
  final bool selected;
  final bool addToCart;
  final bool addToWishlist;
  final Function? minusTap;
  final Function? plusTap;
  final int? cartNumber;
  final Function? addToCartTap;
  //
  final bool minus;
  final bool plus;
  final bool cart;
  final Function? likeTap;
  final String? photo;
  final String? offerType;
  final String? title;
  final dynamic offerPrice;
  final dynamic clientPrice;
  final int? cartCount;
  final int? isLiked;
  final int? hasTax;
  final dynamic productRate;
  StoreMainItem({
    this.selected = false,
    this.addToCart = false,
    this.addToWishlist = false,
    this.minusTap,
    this.plusTap,
    this.cartNumber,
    this.addToCartTap,
    //
    this.likeTap,
    this.cart = false,
    this.plus = false,
    this.minus = false,
    this.photo,
    this.offerType,
    this.title,
    this.offerPrice,
    this.clientPrice,
    this.productRate,
    this.cartCount,
    this.isLiked = 0,
    this.hasTax,
  });

  @override
  _StoreMainItemState createState() => _StoreMainItemState();
}

class _StoreMainItemState extends State<StoreMainItem> {
  // StoreProvider _storeProvider;
  // int taxFees;
  // int additionalTax;
  // int additionalTaxO;

  // @override
  // void didChangeDependencies() {
  //   additionalTax=0;
  //   additionalTaxO=0;
  //   //_authReference = Provider.of<Auth>(context, listen: false);
  //   _storeProvider = Provider.of<StoreProvider>(context, listen: false);
  //   if(_storeProvider.contactOptions!=[]){
  //     taxFees=int.parse(_storeProvider.contactOptions.singleWhere((element)
  //     => element.optionName=="tax_fees").value);
  //     print('taxFees $taxFees');
  //     if(widget.hasTax==0){
  //       if(widget.offerPrice==0){
  //         additionalTax=((widget.clientPrice*taxFees)/100).round();
  //         print('additionalTax $additionalTax');
  //       }else{
  //         additionalTax=((widget.offerPrice*taxFees)/100).round();
  //         additionalTaxO=((widget.clientPrice*taxFees)/100).round();
  //         print('additional 000 Tax $additionalTax');
  //       }
  //     }
  //   }
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 183,
        width: MediaQuery.of(context).size.width * .91,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFE3E6E6)),
            color: const Color(0xFFFFFFFF)),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(width: 12,),
                  Stack(
                    children: [
                      Container(
                        height: 102,
                        width: 102,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Color(0x1F000000), width: 1),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              widget.photo ??
                                  "https://round.com/images/placeholder.png",
                              fit: BoxFit.contain,
                            )
                            // CachedNetworkImage(
                            //   imageUrl: widget.photo??"https://round.com/images/placeholder.png",
                            //   progressIndicatorBuilder: (context, url, downloadProgress) =>
                            //       Shimmer.fromColors(
                            //         baseColor: Colors.grey[200],
                            //         highlightColor: Colors.grey[100],
                            //         enabled: true,
                            //         direction: AppLocalizations.of(context).isArabic
                            //             ? ShimmerDirection.rtl
                            //             : ShimmerDirection.ltr,
                            //         child:
                            //         Container(
                            //           height: 102,
                            //           width: 126,
                            //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            //             color: Color(0xFFFFFFFF),
                            //           ),
                            //         ),
                            //       ),
                            //   //  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                            //   errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                            //   fit: BoxFit.cover,
                            // ),
                            // Image.network(photo??"https://round.com/images/placeholder.png",
                            //   fit: BoxFit.cover,)

                            ),
                      ),
                      if (widget.offerType!.isNotEmpty)
                        Positioned(
                          bottom: 0,
                          child: Container(
                            alignment: Alignment.center,
                            height: 24,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
                                //border: Border.all(color:const Color(0xFFE3E6E6)),
                                color: const Color(0xFFFF0000).withOpacity(.8)),
                            child: Text(widget.offerType ?? '',
                                style: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: .4,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xDEFFFFFF),
                                )),
                          ),
                        )
                    ],
                  ),
                  // const  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                              widget.title ??
                                  'TruSkin Vitamin C Serum for Face, Anti Aging',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF000000),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RatingBar(
                          ratingWidget: RatingWidget(
                            full: Icon(
                              Icons.star,
                              color: const Color(0xFFE6B800),
                            ),
                            empty: Icon(
                              Icons.star_border,
                              color: const Color(0xFFE6B800),
                            ),
                            half: Icon(
                              Icons.star_half,
                              color: const Color(0xFFE6B800),
                            ),
                          ),
                          unratedColor: const Color(0xFFF2781F),
                          glowColor: const Color(0xFFFFFFFF),
                          onRatingUpdate: (val) {},
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15.0,
                          tapOnlyMode: false,
                          initialRating: widget.productRate ?? 0.0,
                          ignoreGestures: true,
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
                          height: 5,
                        ),
                        if (widget.offerPrice == 0)
                          Text(
                            '${widget.clientPrice}  sar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF037979),
                              fontWeight: FontWeight.w700,
                              letterSpacing: .12,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        if (widget.offerPrice != 0)
                          Text.rich(
                            TextSpan(
                              text: "${widget.offerPrice} " ?? "",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF037979),
                                fontWeight: FontWeight.w700,
                                letterSpacing: .12,
                                fontFamily: 'Nunito',
                              ),
                              // " By selecting Agree and continue below, I agree to round's Terms and conditions "
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'sar ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF037979),
                                    letterSpacing: .11,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                                TextSpan(
                                  text: '${widget.clientPrice} sar ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0x99000000),
                                    letterSpacing: .09,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.lineThrough,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                                // can add more TextSpans here...
                              ],
                            ),
                          ),
                        const SizedBox(
                          height: 1,
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //      //Icon(MyCustomIcons.recommended_this_product,size: 15,),
                        //     //const SizedBox(width: 10,),
                        //     Container(
                        //         width: 15,height: 15,
                        //         child: Image.asset('assets/images/recommended.png',fit: BoxFit.cover,)),
                        //     const  SizedBox(width: 10,),
                        //     Text('RECOMMENDED (10)',
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
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 12,
                ),
                //Icon(MyCustomIcons.minus,color: Colors.white,),
                if (widget.cartCount != 0)
                  InkWell(
                      onTap: widget.minusTap as void Function()?,
                      child: Image.asset(
                          Localizations.localeOf(context).languageCode == 'ar'
                              ? 'assets/images/minus-ar.png'
                              : 'assets/images/minus.png')),
                if (widget.cartCount != 0)
                  Container(
                    height: 37, width: 40,
                    // padding: EdgeInsets.symmetric(horizontal: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0x1F000000)),
                        color: Color(0XFFFFFFFF)),
                    child: widget.plus || widget.minus
                        ? CustomLoading(null, 20, 20)
                        : Text('${widget.cartCount}' ?? '1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              color: Color(0xDE000000),
                            )),
                  ),
                if (widget.cartCount != 0)
                  InkWell(
                      onTap: widget.plusTap as void Function()?,
                      child: Image.asset(
                          Localizations.localeOf(context).languageCode == 'ar'
                              ? 'assets/images/plus-ar.png'
                              : 'assets/images/plus.png')),
                if (widget.cartCount == 0)
                  InkWell(
                    onTap: widget.addToCartTap as void Function()?,
                    child: Container(
                      height: 37,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      // width: 110,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0, 2.0),
                                blurRadius: 2.0),
                          ],
                          color:
                              widget.cart ? Colors.white : Color(0XFF037979)),
                      child: widget.cart
                          ? CustomLoading(null, 30, 30)
                          : Text('AddToCart',
                              //'Add to Cart',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF),
                              )),
                    ),
                  ),
                SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: widget.likeTap as void Function()?,
                  child: widget.isLiked == 0
                      ? Container(
                          height: 37,
                          width: 130,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0x29000000)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0XFFFFFFFF)),
                          child: Text('Add To Wishlist',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF000000),
                              )),
                        )
                      : Container(
                          height: 37,
                          width: 146,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFD0E8E8)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFFEDF7F7)),
                          child: Text('Added To Wishlist',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF037979),
                              )),
                        ),
                )
              ],
            )
          ],
        ));
  }
}
