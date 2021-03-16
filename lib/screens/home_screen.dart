import 'package:flutter/material.dart';
import 'package:skeleton/core/base_view.dart';
import 'package:skeleton/models/user.dart';
import 'package:skeleton/view_models/user_view_model.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BaseView<UserViewModel>(
        onModelReady: (UserViewModel userViewModel) async {
          await userViewModel.fetchUser();
          if(userViewModel.hasFailure()) print('Error Handling');
          else userViewModel.setIsLoaded(true);
        },
        builder: (BuildContext context, UserViewModel userViewModel, _) {
          if(userViewModel.isLoading()) return Center(child: CircularProgressIndicator(),);
          User user = userViewModel.user;
          return Center(
            child: Text(
              user.email,
            ),
          );
        }
      ),
    );
  }
}
