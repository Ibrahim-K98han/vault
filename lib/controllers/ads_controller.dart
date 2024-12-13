import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vault/utils/config.dart';

class AdsController extends GetxController {
  RxBool isBannerLoaded = RxBool(false);
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  @override
  void onInit() {
    loadBannerAds();
    loadInterstitialAds();
    super.onInit();
  }

  /// Loads a banner ad ///
  void loadBannerAds() async {
    bannerAd = BannerAd(
      adUnitId: AppConfig.bannerAdsUnitID,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          isBannerLoaded.value = true;
          update();
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
        },
      ),
    )..load();
  }

  /// Loads a InterstitialAd ads ///
  void loadInterstitialAds() {
    InterstitialAd.load(
      adUnitId: AppConfig.interAdsUnitID,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          interstitialAd = ad;
          update();
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }
}
