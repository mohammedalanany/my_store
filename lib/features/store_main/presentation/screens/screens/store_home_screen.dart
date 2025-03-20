import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mystore/features/store_main/presentation/screens/store_provider/store_main.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../config/theme/my_flutter_app_icons.dart';
import '../../../../../core/core/depindance_injection/locator_service.dart';
import 'widgets/items/store/store_categories_item.dart';
import 'widgets/items/store/store_main_item.dart';
import 'widgets/shimmers/category_shimmer.dart';
import 'widgets/shimmers/store_shimmer.dart';

class StoreHomeScreen extends StatefulWidget {
  static const routeName = 'store-home-screen';

  @override
  State<StoreHomeScreen> createState() => _StoreHomeScreenState();
}

class _StoreHomeScreenState extends State<StoreHomeScreen> {
  bool _firstCalled = false;
  @override
  void didChangeDependencies() async {
    if (!_firstCalled) {
      LocatorService.storeMainProvider.fetchStoreMainPage();
      LocatorService.storeMainProvider.fetchRecommendsProductsMainPage();
      _firstCalled = true;
    }
    super.didChangeDependencies();
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
            child: Consumer<StoreMainProvider>(
              builder: (_, storeProvider, __) {
                final defaultAddress =
                    storeProvider.mainHomeModel?.defaultAddresses ?? [];

                return storeProvider.isLoading == true
                    ? SizedBox()
                    : Container(
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
                            if (defaultAddress.isEmpty)
                              Container(
                                color: Color(0xFFFFFFFF),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  direction: ShimmerDirection.rtl,
                                  enabled: true,
                                  child: Container(
                                    color: Color(0xFFFFFFFF),
                                    width:
                                        MediaQuery.of(context).size.width * .5,
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
              child: Consumer<StoreMainProvider>(
                builder: (_, storeProvider, __) {
                  final storeSlider = storeProvider.mainHomeModel?.slides ?? [];

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
                      items: storeProvider.isLoading == true
                          ? [
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
                                  highlightColor:
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.grey[800]!
                                          : Colors.grey[100]!,
                                  direction: ShimmerDirection.rtl,
                                  enabled: true,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              )
                            ]
                          : storeSlider.map<Widget>((e) {
                              return InkWell(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16),
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
              child: Consumer<StoreMainProvider>(
                builder: (_, storeProvider, __) {
                  final storeCategories =
                      storeProvider.mainHomeModel?.storeCategories ?? [];

                  return Container(
                    height: 108,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        if (storeProvider.isLoading == true) {
                          return CategoryShimmer(
                            selected: index,
                            name:
                                Localizations.localeOf(context).languageCode ==
                                        'ar'
                                    ? index == 0
                                        ? "كل\nالاقسام"
                                        : index == 1
                                            ? "العنايه\nبالشعر"
                                            : index == 2
                                                ? "العنايه\nبالجسم"
                                                : index == 3
                                                    ? "العنايه\nبالوجه"
                                                    : "العنايه\nبالمرأة"
                                    : index == 0
                                        ? "All\nSections"
                                        : index == 1
                                            ? "HAIR\nCARE"
                                            : index == 2
                                                ? "MEDICAL\nEQUIPMENTS"
                                                : index == 3
                                                    ? "Skin\ncare"
                                                    : "FACE\nCARE",
                          );
                        }

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
                                  photo: storeCategories[index - 1].photo,
                                  categoryName: storeCategories[index - 1].name,
                                ),
                              );
                      },
                      separatorBuilder: (_, __) => SizedBox(width: 8),
                      itemCount: storeCategories.isEmpty
                          ? 5
                          : storeCategories.length + 1,
                    ),
                  );
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
              child: Consumer<StoreMainProvider>(
                builder: (_, storeRecommendedProducts, __) => Container(
                  height: 181,
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const SizedBox(
                      width: 8,
                    ),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    //physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (c, i) => storeRecommendedProducts.isLoading2
                        ? StoreShimmer()
                        : InkWell(
                            onTap: () {},
                            child: StoreMainItem(
                              addToCartTap: () async {},
                              minus: false,
                              plus: false,
                              cart: false,
                              minusTap: () async {},
                              plusTap: () async {},
                              likeTap: () async {},
                              hasTax: storeRecommendedProducts
                                  .recommendsProductModel?[i].hasTax,
                              isLiked: storeRecommendedProducts
                                  .recommendsProductModel?[i].isLiked,
                              cartCount: storeRecommendedProducts
                                  .recommendsProductModel?[i].cartCount,
                              productRate: double.parse(storeRecommendedProducts
                                  .recommendsProductModel![i].productRate
                                  .toString()),
                              offerPrice: storeRecommendedProducts
                                  .recommendsProductModel?[i].offerPrice,
                              clientPrice: storeRecommendedProducts
                                  .recommendsProductModel?[i].clientPrice,
                              photo: storeRecommendedProducts
                                  .recommendsProductModel?[i].photo,
                              title: storeRecommendedProducts
                                  .recommendsProductModel?[i].title,
                              offerType: storeRecommendedProducts
                                  .recommendsProductModel?[i].offerType,
                            ),
                          ),
                    itemCount: storeRecommendedProducts.isLoading2
                        ? 5
                        : storeRecommendedProducts
                                .recommendsProductModel?.length ??
                            5,
                  ),
                ),
              ),
            ),
          ],
          // ),
        ));
  }
}
