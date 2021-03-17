import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:dartz/dartz.dart';
import 'package:skeleton/constants/context.dart';
import 'package:skeleton/constants/http_global.dart';
import 'package:skeleton/core/failure.dart';
import 'package:skeleton/models/product.dart';

import '../core/failure.dart';
import '../injector.dart';

class ProductService {
  Context _context = Injector<Context>();

  ///상품 목록 조회
  Future<Either<Failure, List<Product>>> fetchPrdList({int currentPage}) async {
    String apiUrl = '${_context.apiUrl}/shop/v1/product/list';
    String searchEndDate = DateFormat('yyyyMMddHHmmss').format(DateTime.now().toUtc().add(Duration(hours: 9)));
    try {
      final params = "?searchEndDate=$searchEndDate&currentPage=1&cntPerPage=10&searchText=";
      final response = await HttpGlobal().get(Uri.encodeFull('$apiUrl'+params), headers: {});
      if(response.statusCode != 200) {
        throw Failure();
      }

      final convertUtf = utf8.decode(response.bodyBytes);
      int code = json.decode(convertUtf)['code'];
      if(code != 0) throw Failure(code: code.toString(), message: '에러가 발생했습니다.');

      final parsed = json.decode(convertUtf)['data']['productList'].cast<Map<String, dynamic>>();
      List<Product> res = parsed.map<Product>((json) => Product.fromJSON(json)).toList();
      return Right(res);

    } catch(e) {
      return Left(Failure(code: e.code??"999", message: '에러가 발생했습니다.'));
    }
  }
}