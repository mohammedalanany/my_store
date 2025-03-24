import 'api_service.dart';

abstract class MainStoreServices {
  static Future fetchStoreMainPage() async {
    return await ApiService.getService('/shop/home-page');
  }

  static Future fetchMainPageRecommendsProducts() async {
    return await ApiService.getService('/shop/home-products');
  }

  static Future fetchProductDetails(int id) async {
    return await ApiService.getService('/shop/product-page?product_id=$id');
  }
}
