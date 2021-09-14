import 'package:banner_ads/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? bannerAd;
  bool isLoaded = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Ads Demo'),
      ),
      body: Column(
        children: [
          const Spacer(),
          // ignore: avoid_unnecessary_containers
          isLoaded
              // ignore: avoid_unnecessary_containers
              ? Container(
                  child: AdWidget(ad: bannerAd!),
                  height: 100,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
