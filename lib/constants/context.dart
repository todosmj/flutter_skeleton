import 'package:flutter/cupertino.dart';
import 'package:skeleton/enums/env_status.dart';

import '../core/base_model.dart';

class Context extends BaseModel{
  BuildType _buildType;
  String _appVersion;
  String _buildNumber;
  String _packageName;
  String get buildNumber => _buildNumber;
  String get packageName => _packageName;

  /// API Signature Message Key
  String get signingKey {
    if (_buildType == BuildType.dev) {
      return '';
    } else if (_buildType == BuildType.staging) {
      return '';
    } else {
      return '';
    }
  }

  /// API Path
  String get apiUrl {
    if (_buildType == BuildType.dev) {
      // return "";
      return "";
    } else if (_buildType == BuildType.staging) {
      return "";
    } else {
      return "";
    }
  }

  /// S3 Cloud Path
  String get filePath {
    if (_buildType == BuildType.prod) {
      return '';
    } else {
      return '';
    }
  }

  /// Dynamic Link Path
  String get dynamicLink {
    if (_buildType == BuildType.dev) {
      return '';
    } else if (_buildType == BuildType.staging) {
      return '';
    } else {
      return '';
    }
  }

  /// Kakao PlugIn Client Key
  String get kakaoClientKey {
    if (_buildType == BuildType.dev) {
      return '';
    } else if (_buildType == BuildType.staging) {
      return '';
    } else {
      return '';
    }
  }

  setBuildType(BuildType buildType){
    _buildType = buildType;
  }
  setAppVersion({@required appVersion, @required buildNumber, @required packageName}){
    _appVersion = appVersion;
    _buildNumber = buildNumber;
    _packageName = packageName;
  }
}