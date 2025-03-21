import 'api_service.dart';

abstract class AuthServices {
  static Future checkUser(dynamic data) async {
    return await ApiService.postService('/check-user', data: data);
  }
}
