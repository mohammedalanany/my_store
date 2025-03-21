import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/features/store_main/presentation/screens/bloc/store_main_bloc.dart';
import 'package:mystore/features/store_main/presentation/screens/screens/widgets/shimmers/store_shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../config/theme/my_flutter_app_icons.dart';
import '../bloc/store_main_bloc_state.dart';
import '../bloc/store_main_events.dart';
import 'widgets/items/store/store_categories_item.dart';
import 'widgets/items/store/store_main_item.dart';
import 'widgets/shimmers/category_shimmer.dart';

class StoreHomeScreenWithBloc extends StatefulWidget {
  static const routeName = 'store-home-screen_block';

  @override
  State<StoreHomeScreenWithBloc> createState() =>
      _StoreHomeScreenWithBlocState();
}

class _StoreHomeScreenWithBlocState extends State<StoreHomeScreenWithBloc> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<StoreMainBloc>().add(FetchRecommendedProductsEvent());
    });
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
            child: BlocBuilder<StoreMainBloc, StoreMainBlocState>(
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
                return SizedBox();
              },
            ),
          ),
        ),
        backgroundColor: Color(0xFFF2F2F2),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: const SizedBox(
              height: 16,
            )),
            SliverToBoxAdapter(
              child: BlocBuilder<StoreMainBloc, StoreMainBlocState>(
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
                  } else if (state is StoreMainError) {
                    return Center(child: Text("Error: ${state.message}"));
                  }
                  return Center(
                      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Shimmer.fromColors(
                      baseColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[900]!
                          : Colors.grey[300]!,
                      highlightColor:
                          Theme.of(context).brightness == Brightness.dark
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
                  ));
                },
              ),
            ),
            SliverToBoxAdapter(
                child: const SizedBox(
              height: 16,
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
            ),
            SliverToBoxAdapter(
                child: const SizedBox(
              height: 8,
            )),
            SliverToBoxAdapter(
              child: BlocBuilder<StoreMainBloc, StoreMainBlocState>(
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
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
            ),
            SliverToBoxAdapter(
                child: const SizedBox(
              height: 16,
            )),
            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'recommendedProducts',
                      style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xDE000000),
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Playfair',
                          letterSpacing: .12),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'seeAll',
                      style: TextStyle(
                          fontSize: 12,
                          color: const Color(0xDE000000),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Playfair',
                          letterSpacing: .09),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
              // color: Colors.white,
              height: 6,
            )),
            SliverToBoxAdapter(
              child: BlocBuilder<StoreMainBloc, StoreMainBlocState>(
                builder: (context, state) {
                  if (state is RecommendedProductsLoaded) {
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
                                  isLiked: state.recommendedProducts[i].isLiked,
                                  cartCount:
                                      state.recommendedProducts[i].cartCount,
                                  productRate: double.parse(state
                                      .recommendedProducts[i].productRate
                                      .toString()),
                                  offerPrice:
                                      state.recommendedProducts[i].offerPrice,
                                  clientPrice:
                                      state.recommendedProducts[i].clientPrice,
                                  photo: state.recommendedProducts[i].photo,
                                  title: state.recommendedProducts[i].title,
                                  offerType:
                                      state.recommendedProducts[i].offerType,
                                ),
                              ),
                          itemCount: state.recommendedProducts.length),
                    );
                  }
                  return StoreShimmer();
                },
              ),
            ),
          ],
          // ),
        ));
  }
}
