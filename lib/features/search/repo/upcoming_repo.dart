import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:streamx/features/search/data/upcoming_response.dart';

import '../../../core/networking/api_constants.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/dio_factory.dart';
import '../../home/data/top_rated_response.dart';

class UpComingRepo {
  Future<ApiResult<Upcoming>> getUpcomingData() async {
    try {
      final dio = DioFactory.getDio();
      final response = await dio.get(ApiConstants.upComingEndPoint);

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData != null) {
          dynamic decodedJson;
          if (responseData is String) {
            decodedJson = jsonDecode(responseData);
          } else {
            decodedJson = responseData;
          }

          debugPrint(decodedJson.toString());
          return ApiResult.success(Upcoming.fromJson(decodedJson));
        } else {
          return const ApiResult.failure('Response data is null.');
        }
      } else {
        return ApiResult.failure(
            'Failed to fetch data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return ApiResult.failure('DioError: ${e.message}');
    } catch (e) {
      return ApiResult.failure('Unexpected error: $e');
    }
  }
}
