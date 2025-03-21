import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/features/store_main/presentation/screens/screens/widgets/items/store/store_main_item.dart';
import 'package:mystore/features/store_main/presentation/screens/screens/widgets/shimmers/store_shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../config/theme/my_flutter_app_icons.dart';
import '../../../../../core/core/depindance_injection/locator.dart';
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
  void initState() {
    super.initState();
    context.read<StoreMainCubit>().fetchRecommendedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Container(
            height: 17,
            width: 74,
            child: Image.asset(
              'assets/images/Logo200.png',
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {},
              child: Container(
                width: 55,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 17),
                      child: Icon(
                        MyCustomIcons.bag,
                        color: const Color(0xFF000000),
                        size: 22,
                      ),
                    ),
                    Positioned(
                      left: Localizations.localeOf(context).languageCode == 'ar'
                          ? 23
                          : 16,
                      top: 22,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xFFFFCC00),
                            border: Border.all(color: Color(0xFFFFFFFF))),
                        child: Text(
                          "9",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF000000),
                            fontSize: 12,
                            letterSpacing: .4,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(width: 30,),
            // Icon(MyCustomIcons.notification,color:const Color(0xFF000000),size: 18,),
            // const SizedBox(width: 10,),
            InkWell(
                onTap: () {},
                child: Icon(
                  MyCustomIcons.search,
                  color: const Color(0xFF000000),
                  size: 17,
                )),
            const SizedBox(
              width: 16,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(44.0),
            child: BlocBuilder<StoreMainCubit, StoreMainState>(
              builder: (context, state) {
                if (state is StoreMainLoaded) {
                  return Container(
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: const Color(0x1F000000),
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: const Color(0x1F000000),
                          width: 1,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          MyCustomIcons.location_2,
                          color: const Color(0xFF000000),
                          size: 20,
                        ),
                        const SizedBox(width: 12),

                        // **Show Shimmer Effect when no address is available**
                        if (state.mainHomeModel.defaultAddresses.isEmpty)
                          Container(
                            color: Color(0xFFFFFFFF),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              direction: ShimmerDirection.rtl,
                              enabled: true,
                              child: Container(
                                color: Color(0xFFFFFFFF),
                                width: MediaQuery.of(context).size.width * .5,
                                height: 12,
                              ),
                            ),
                          ),

                        // **Show Default Address or Placeholder**

                        Spacer(),

                        // **Change Address Button**
                        InkWell(
                          onTap: () async {
                            // Add logic to change address
                          },
                          child: Text(
                            'change',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Color(0xFF037979),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is StoreMainError) {
                  return Center(child: Text("Error: ${state.message}"));
                }
                return Container(
                  color: Color(0xFFFFFFFF),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    direction: ShimmerDirection.rtl,
                    enabled: true,
                    child: Container(
                      color: Color(0xFFFFFFFF),
                      width: MediaQuery.of(context).size.width * .5,
                      height: 12,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        backgroundColor: Color(0xFFF2F2F2),
        body: SingleChildScrollView(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      locator<StoreMainCubit>()..fetchMainStoreData()),
            ],
            child: Column(
              children: [
                Column(
                  children: [
                    BlocListener<StoreMainCubit, StoreMainState>(
                      listener: (context, state) {
                        if (state is StoreMainLoaded) {
                          print("StoreMainLoaded Fetched Successfully!");
                        }
                      },
                      child: Center(
                        child: BlocBuilder<StoreMainCubit, StoreMainState>(
                          builder: (context, state) {
                            if (state is StoreMainLoading) {
                              return Center(
                                  child: Container(
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
                                  highlightColor:
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.grey[800]!
                                          : Colors.grey[100]!,
                                  direction: ShimmerDirection.rtl,
                                  enabled: true,
                                  child: Container(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ));
                            } else if (state is StoreMainLoaded) {
                              return Column(
                                children: [
                                  Container(
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
                                      items: state.mainHomeModel.slides
                                          .map<Widget>((e) {
                                        return InkWell(
                                          onTap: () {},
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 16),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      'storeCategories',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: const Color(0xDE000000),
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Playfair',
                                          letterSpacing: .12),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: BlocBuilder<StoreMainCubit, StoreMainState>(
                        builder: (context, state) {
                          if (state is RecommendedProductsLoading) {
                            return StoreShimmer();
                          } else if (state is RecommendedProductsLoaded) {
                            return Container(
                              height: 181,
                              child: ListView.separated(
                                  separatorBuilder: (_, __) => const SizedBox(
                                        width: 8,
                                      ),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  //physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (c, i) => InkWell(
                                        onTap: () {},
                                        child: StoreMainItem(
                                          addToCartTap: () async {},
                                          minus: false,
                                          plus: false,
                                          cart: false,
                                          minusTap: () async {},
                                          plusTap: () async {},
                                          likeTap: () async {},
                                          hasTax: state
                                              .recommendedProducts[i].hasTax,
                                          isLiked: state
                                              .recommendedProducts[i].isLiked,
                                          cartCount: state
                                              .recommendedProducts[i].cartCount,
                                          productRate: double.parse(state
                                              .recommendedProducts[i]
                                              .productRate
                                              .toString()),
                                          offerPrice: state
                                              .recommendedProducts[i]
                                              .offerPrice,
                                          clientPrice: state
                                              .recommendedProducts[i]
                                              .clientPrice,
                                          photo: state
                                              .recommendedProducts[i].photo,
                                          title: state
                                              .recommendedProducts[i].title,
                                          offerType: state
                                              .recommendedProducts[i].offerType,
                                        ),
                                      ),
                                  itemCount: state.recommendedProducts.length),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                BlocBuilder<StoreMainCubit, StoreMainState>(
                  builder: (context, state) {
                    if (state is RecommendedProductsLoading) {
                      return StoreShimmer();
                    } else if (state is RecommendedProductsLoaded) {
                      return Container(
                        height: 181,
                        child: ListView.separated(
                            separatorBuilder: (_, __) => const SizedBox(
                                  width: 8,
                                ),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            //physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (c, i) => InkWell(
                                  onTap: () {},
                                  child: StoreMainItem(
                                    addToCartTap: () async {},
                                    minus: false,
                                    plus: false,
                                    cart: false,
                                    minusTap: () async {},
                                    plusTap: () async {},
                                    likeTap: () async {},
                                    hasTax: state.recommendedProducts[i].hasTax,
                                    isLiked:
                                        state.recommendedProducts[i].isLiked,
                                    cartCount:
                                        state.recommendedProducts[i].cartCount,
                                    productRate: double.parse(state
                                        .recommendedProducts[i].productRate
                                        .toString()),
                                    offerPrice:
                                        state.recommendedProducts[i].offerPrice,
                                    clientPrice: state
                                        .recommendedProducts[i].clientPrice,
                                    photo: state.recommendedProducts[i].photo,
                                    title: state.recommendedProducts[i].title,
                                    offerType:
                                        state.recommendedProducts[i].offerType,
                                  ),
                                ),
                            itemCount: state.recommendedProducts.length),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
