import 'package:flutter/material.dart';
import 'package:skeleton/core/failure.dart';
import 'package:skeleton/enums/view_status.dart';

class BaseModel extends ChangeNotifier {
  bool _isLoaded = false;
  ViewStatus _viewStatus = ViewStatus.IDLE;
  Failure _failure;

  bool get isLoaded => _isLoaded;

  Failure get failure => _failure;

  ViewStatus get viewStatus => _viewStatus;

  void setIsLoaded(bool isLoaded) {
    _isLoaded = isLoaded;
    notifyListeners();
  }

  void setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  void setViewStatus(ViewStatus viewStatus) {
    _viewStatus = viewStatus;
    notifyListeners();
  }

  bool isIdling() {
    return _viewStatus == ViewStatus.IDLE;
  }

  bool isLoading() {
    return _isLoaded == false;
  }

  bool hasFailure() {
    return _failure != null;
  }
}