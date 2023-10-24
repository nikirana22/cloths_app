import 'package:dio/dio.dart';

class ApiManager {
  static const String _endPoints =
      'http://139.59.47.49:4000/task/cloth_list';

  static Future<Map<String, dynamic>> getCloths() async {
    final response = await Dio().get(_endPoints);
    return response.data;
  }

// static Future<Map<String,dynamic>> getCloths(
//     {void Function(Map<String, dynamic>)? onSuccess,
//     void Function(DioException exception)? onError}) async {
//   try {
//     final response = await Dio().get(_endPoints);
//     onSuccess?.call(response.data);
//   } on DioException catch (e) {
//     onError?.call(e);
//   }
// }
}
