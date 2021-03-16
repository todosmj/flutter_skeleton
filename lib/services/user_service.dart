import 'package:dartz/dartz.dart';
import 'package:skeleton/core/failure.dart';
import 'package:skeleton/models/user.dart';

class UserService {
  Future<Either<Failure, User>> fetchUser() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      const result = {
        'uid': 'uid',
        'email': 'email'
      };
      return Right(User.fromJSON(result));
    }
    catch(e) {
      return Left(Failure(code: 'AUTH_ERROR', message: '에러가 발생했습니다.'));
    }
  }
}