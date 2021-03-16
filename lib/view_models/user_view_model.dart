import 'package:dartz/dartz.dart';
import 'package:skeleton/core/base_model.dart';
import 'package:skeleton/core/failure.dart';
import 'package:skeleton/enums/view_status.dart';
import 'package:skeleton/injector.dart';
import 'package:skeleton/models/user.dart';
import 'package:skeleton/services/user_service.dart';

class UserViewModel extends BaseModel {
  User _user;

  User get user => _user;

  UserService _userService = Injector<UserService>();

  Future<void> fetchUser() async {
    Either<Failure, User> either = await _userService.fetchUser();
    either.fold((failure) => setFailure(failure), (user) => setUser(user));
  }

  void setUser(User user) {
    setViewStatus(ViewStatus.BUSY);
    _user = user;
    setViewStatus(ViewStatus.IDLE);
  }
}