import 'dart:io';

class AdHelper {
  //apple main
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5946802346170399/4683275769";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5946802346170399/2936111061";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId1 {
    if (Platform.isAndroid) {
      return "cca-app-pub-5946802346170399/3767733623";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_BANNER_AD_UNIT_ID>";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId2 {
    if (Platform.isAndroid) {
      return "ca-app-pub-5946802346170399/1179623956";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_BANNER_AD_UNIT_ID>";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  //ca-app-pub-5946802346170399/7771338066
  static String get bannerAdUnitTest {
    if (Platform.isAndroid) {
      return "ca-app-pub-5946802346170399/4927297271";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_BANNER_AD_UNIT_ID>";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  //ca-app-pub-5946802346170399/6210844380
  static String get bannerAdUnitPractise {
    if (Platform.isAndroid) {
      return "ca-app-pub-5946802346170399/3422643916";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_BANNER_AD_UNIT_ID>";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId3 {
    if (Platform.isAndroid) {
      return "ca-app-pub-5946802346170399/4244292066";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_BANNER_AD_UNIT_ID>";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5946802346170399/1534847171';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5946802346170399/9309947721';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5946802346170399/5282520490';
    } else if (Platform.isIOS) {
      return '<ca-app-pub-5946802346170399/5282520490>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
