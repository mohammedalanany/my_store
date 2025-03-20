import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../config/theme/my_flutter_app_icons.dart';

class CategoryShimmer extends StatelessWidget {
  final String? name;
  final int? selected;
  final Widget? child;
  CategoryShimmer({this.name, this.child, this.selected});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
          child: Container(
            height: 108,
            width: 112,
            padding: EdgeInsets.symmetric(horizontal: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE3E6E6), width: 1),
              // color:const Color(0xFFFFFFFF)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                //child,
                if (selected == 0)
                  Icon(
                    MyCustomIcons.all,
                    color: Color(0xFF037979),
                    size: 20,
                  ),
                if (selected == 1)
                  Icon(
                    MyCustomIcons.cosmetics,
                    color: Color(0xFF037979),
                    size: 20,
                  ),
                if (selected == 2)
                  Icon(
                    MyCustomIcons.baby,
                    color: Color(0xFF037979),
                    size: 20,
                  ),
                if (selected == 3)
                  Icon(
                    MyCustomIcons.appointme,
                    color: Color(0xFF037979),
                    size: 20,
                  ),
                if (selected == 4)
                  Icon(
                    MyCustomIcons.appointme,
                    color: Color(0xFF037979),
                    size: 20,
                  ),
                // const SizedBox(height: 27,),
                Spacer(),
                Text('$name',
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
          )),
    );
  }
}
