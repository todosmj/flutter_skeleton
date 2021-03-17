import 'package:flutter/material.dart';
import 'package:skeleton/core/base_view.dart';
import 'package:skeleton/models/product.dart';
import 'package:skeleton/models/user.dart';
import 'package:skeleton/view_models/product_view_model.dart';
import 'package:skeleton/view_models/user_view_model.dart';

class ListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<ProductViewModel>(
        onModelReady: (ProductViewModel productViewModel) async {
          await productViewModel.fetchData();
          // if(productViewModel.hasFailure()) print('Error Handling ${productViewModel.failure.code}');
          productViewModel.setIsLoaded(true);
        },
        builder: (BuildContext context, ProductViewModel productViewModel, _) {
          if(productViewModel.isLoading()) return Center(child: CircularProgressIndicator(),);
          if(productViewModel.hasFailure()) return Center(child: Text("에러코드 ${productViewModel.failure.code}"));
          List<Product> list = productViewModel.product;
          print("${list.length}");
          return Center(
            child: Text(
              "갯수 ${list.length}",
            ),
          );
        }
      ),
    );
  }
}
