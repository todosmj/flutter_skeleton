import 'package:dartz/dartz.dart';
import 'package:skeleton/constants/context.dart';
import 'package:skeleton/core/base_model.dart';
import 'package:skeleton/core/failure.dart';
import 'package:skeleton/enums/view_status.dart';
import 'package:skeleton/injector.dart';
import 'package:skeleton/models/product.dart';
import 'package:skeleton/services/product_service.dart';

class ProductViewModel extends BaseModel {
  List<Product> _product;

  List<Product> get product => _product;

  ProductService _productService = Injector<ProductService>();

  Future<void> fetchData() async {
    Either<Failure, List<Product>> either = await _productService.fetchPrdList();
    either.fold((failure) => setFailure(failure), (product) => setData(product));
  }

  void setData(List<Product> product) {
    setViewStatus(ViewStatus.BUSY);
    _product = product;
    setViewStatus(ViewStatus.IDLE);
  }
}