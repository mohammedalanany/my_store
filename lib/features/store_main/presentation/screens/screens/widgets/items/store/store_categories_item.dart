import 'package:flutter/material.dart';

class StoreCategoriesItem extends StatelessWidget {
  final String? title;
  final String? photo;
  final String? categoryName;
  final bool allItems;
  StoreCategoriesItem({
    this.title,
    this.allItems = false,
    this.photo,
    this.categoryName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      width: 112,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE3E6E6), width: 1),
          color: const Color(0xFFFFFFFF)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 0402247771
        children: [
          const SizedBox(
            height: 12,
          ),
          // allItems?
          // Icon(allItems?MyCustomIcons.appointme:MyCustomIcons.cosmetics,color: Color(0xFF037979),size: 20,)
          // :
          Container(
              height: 25,
              width: 25,
              child: Image.network(
                photo ?? "",
                fit: BoxFit.cover,
              )),
          Spacer(),
          // const SizedBox(height: 27,),
          Text("$categoryName" ?? "",
              overflow: TextOverflow.clip,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                color: Color(0xDE000000),
              )),
          const SizedBox(
            height: 9,
          ),
        ],
      ),
    );
  }
}
