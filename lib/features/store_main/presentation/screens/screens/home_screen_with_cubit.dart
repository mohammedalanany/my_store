import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/core/core/depindance_injection/locator_service.dart';
import 'package:mystore/features/store_main/presentation/screens/cubit/recommend_product_cubit.dart';
import 'package:mystore/features/store_main/presentation/screens/screens/product_detail_screen.dart';
import 'package:mystore/features/store_main/presentation/screens/screens/widgets/items/store/store_categories_item.dart';
import 'package:mystore/features/store_main/presentation/screens/screens/widgets/items/store/store_main_item.dart';
import 'package:mystore/features/store_main/presentation/screens/screens/widgets/shimmers/category_shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../config/theme/my_flutter_app_icons.dart';
import '../cubit/store_main_cubit.dart';
import '../cubit/store_main_state.dart';

class StoreHomeScreenWithCubit extends StatefulWidget {
  static const routeName = 'store-home-screen_cubit';

  @override
  State<StoreHomeScreenWithCubit> createState() =>
      _StoreHomeScreenWithCubitState();
}

class _StoreHomeScreenWithCubitState extends State<StoreHomeScreenWithCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('hghgh'),
        actions: [
          IconButton(
            icon: Icon(MyCustomIcons.bag, color: Colors.black, size: 22),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(MyCustomIcons.search, color: Colors.black, size: 17),
            onPressed: () {},
          ),
          SizedBox(width: 16),
        ],
      ),
      backgroundColor: Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<StoreMainCubit, StoreMainState>(
              builder: (context, state) {
                if (state is StoreMainLoaded) {
                  return Container(
                    height: 161,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        aspectRatio: 343 / 161,
                        initialPage: 0,
                        scrollPhysics: ClampingScrollPhysics(),
                        height: 161,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: state.mainHomeModel.slides.map<Widget>((e) {
                        return InkWell(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  e.image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                } else if (state is StoreMainLoading) {
                  return Container(
                    height: 161,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          aspectRatio: 343 / 161,
                          initialPage: 0,
                          scrollPhysics: ClampingScrollPhysics(),
                          height: 161,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Shimmer.fromColors(
                              baseColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.grey[900]!
                                  : Colors.grey[300]!,
                              highlightColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.grey[800]!
                                  : Colors.grey[100]!,
                              direction: ShimmerDirection.rtl,
                              enabled: true,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          )
                        ]),
                  );
                }
                return SizedBox();
              },
            ),
            SizedBox(
              height: 15,
            ),
            // Main Store Data Section
            BlocBuilder<StoreMainCubit, StoreMainState>(
              builder: (context, state) {
                if (state is StoreMainLoaded) {
                  return Container(
                    height: 108,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return index == 0
                            ? InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 108,
                                  width: 108,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: const Color(0xFFE3E6E6),
                                        width: 1),
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 11),
                                      Icon(
                                        MyCustomIcons.all,
                                        color: Color(0xFF037979),
                                        size: 22,
                                      ),
                                      Spacer(),
                                      Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xDE000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {},
                                child: StoreCategoriesItem(
                                  photo: state.mainHomeModel
                                      .storeCategories[index - 1].photo,
                                  categoryName: state.mainHomeModel
                                      .storeCategories[index - 1].name,
                                ),
                              );
                      },
                      separatorBuilder: (_, __) => SizedBox(width: 8),
                      itemCount: state.mainHomeModel.storeCategories.isEmpty
                          ? 5
                          : state.mainHomeModel.storeCategories.length + 1,
                    ),
                  );
                } else if (state is StoreMainError) {
                  return Center(child: Text("Error: ${state.message}"));
                }
                return Center(
                    child: CategoryShimmer(
                  selected: 0,
                ));
              },
            ),
            SizedBox(
              height: 15,
            ),

            // Recommended Products Section
            BlocConsumer<RecommendsProductsCubit, StoreMainState>(
              listener: (context, state) {},
              builder: (context, state) {
                print('Recommended Products State: $state'); // Debugging print
                if (state is RecommendedProductsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is RecommendedProductsLoaded) {
                  return Container(
                    height: 181,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.recommendedProducts.length,
                      separatorBuilder: (_, __) => SizedBox(width: 8),
                      itemBuilder: (context, i) {
                        final product = state.recommendedProducts[i];
                        return InkWell(
                          onTap: () async {
                            await LocatorService.productDetailsCubit
                                .getProductId(state.recommendedProducts[i].id!);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: LocatorService
                                      .productDetailsCubit, // ✅ يستخدم نفس Cubit الحالي
                                  child: ProductDetailScreen(),
                                ),
                              ),
                            );
                          },
                          child: StoreMainItem(
                            addToCartTap: () {},
                            minus: false,
                            plus: false,
                            cart: false,
                            minusTap: () {},
                            plusTap: () {},
                            likeTap: () {},
                            hasTax: product.hasTax,
                            isLiked: product.isLiked,
                            cartCount: product.cartCount,
                            productRate:
                                double.parse(product.productRate.toString()),
                            offerPrice: product.offerPrice,
                            clientPrice: product.clientPrice,
                            photo: product.photo,
                            title: product.title,
                            offerType: product.offerType,
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is StoreMainError) {
                  return Center(
                      child: Text(state.message,
                          style: TextStyle(color: Colors.red)));
                }
                return Center(child: Text('No products available'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
