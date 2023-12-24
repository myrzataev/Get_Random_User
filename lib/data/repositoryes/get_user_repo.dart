import 'package:dio/dio.dart';
import 'package:get_random_user1/core/dio_setting.dart';
import 'package:get_random_user1/data/models/userModel.dart';

class GetUser {
  static Future<UserModel> getRandomUserName() async {
    final Dio dio = DioSettings().dio;
    final Response response = await dio.get('api', queryParameters: {});

    return UserModel.fromJson(response.data);
  }
}
