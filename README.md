# banner_ads
การทำ Banner Ad 
สามารถดูรายละเอียดได้ที่
https://pub.dev/packages/google_mobile_ads
1. Android

    Android Studio 3.2 or higher
    Target Android API level 19 or higher
    Set compileSdkVersion to 28 or higher
 2.at file android/app/src/main/AndroidManifest.xml modified
 <manifest>
    <application>
        <!-- Sample AdMob App ID: ca-app-pub-3940256099942544~3347511713 -->
        <meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value="ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy"/>
    </application>
</manifest>

3.
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(MyApp());
}

4. The easiest way to load test ads is to use our dedicated test ad unit ID for banners:

    Android: https://developers.google.com/admob/android/test-ads#sample\_ad\_units
    iOS: https://developers.google.com/admob/ios/test-ads#demo\_ad\_units

5. initiate app by

 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
          });
          // ignore: avoid_print
          print("Banner Ad Loaded");
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          // ignore: avoid_print
          print('Banner Ad Failed to load : $error');
        }),
        request: const AdRequest());
    bannerAd!.load();
  }
6. Display a Banner Ad

To display a BannerAd as a widget, you must instantiate an AdWidget with a supported ad after calling load(). You can create the widget before calling load(), but load() must be called before adding it to the widget tree.

final AdWidget adWidget = AdWidget(ad: myBanner);

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
