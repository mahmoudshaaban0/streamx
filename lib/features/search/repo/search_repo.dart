import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:streamx/core/networking/api_constants.dart';
import 'package:streamx/core/networking/api_result.dart';
import 'package:streamx/core/networking/dio_factory.dart';
import 'package:streamx/core/networking/network_info.dart';
import 'package:streamx/features/search/data/search_request_response.dart';

class SearchRepo {
  final NetworkInfo _networkInfo;
  SearchRepo(this._networkInfo);
  Future<ApiResult<SearchResponse>> getSearchResponse(String query) async {
    if (await _networkInfo.isConnected) {
      try {
        final dio = DioFactory.getDio();
        final response =
            await dio.get(ApiConstants.searchEndPoint, queryParameters: {
          'query': query,
        });

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
            return ApiResult.success(SearchResponse.fromJson(decodedJson));
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
    } else {
      return const ApiResult.failure('No internet connection');
    }
  }
}
