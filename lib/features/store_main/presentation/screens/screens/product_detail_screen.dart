import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/product_details_cubit.dart';
import '../cubit/store_main_state.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail-screen';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
            ))
      ], elevation: 0, title: Text('تفاصيل المنتج ')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ProductDetailsCubit, StoreMainState>(
              builder: (context, state) {
                if (state is ProductDetailsLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(state.productDetails.title.toString()),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 102,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Color(0x1F000000), width: 1),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              state.productDetails.photo ??
                                  "https://round.com/images/placeholder.png",
                              fit: BoxFit.contain,
                            )),
                      ),
                    ],
                  );
                } else if (state is StoreMainLoading) {
                  return SizedBox();
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
