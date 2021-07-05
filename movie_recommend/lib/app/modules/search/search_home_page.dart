import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'search_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:localization/localization.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:movie_recommend/shared/constants.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';

const String testDevice = 'A989A52316DA84C85DE19DC08FE4D029';

class SearchHomePage extends StatefulWidget {
  final String title;
  const SearchHomePage({Key key, this.title = "Search"}) : super(key: key);

  @override
  _SearchHomePageState createState() => _SearchHomePageState();
}

class _SearchHomePageState extends ModularState<SearchHomePage, SearchController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: Constants.IS_PRODUCTION == false ? Constants.KEY_ADMOB_DEBUG :  Constants.KEY_ADMOB9);
    _bannerAd = createBannerAd()
      ..load()
      ..show();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

    static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['games', 'space'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );
  BannerAd _bannerAd;
  NativeAd _nativeAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: Constants.IS_PRODUCTION == false ? BannerAd.testAdUnitId : Constants.KEY_ADMOB9,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

Future<bool> _onWillPop() async{
  print("chegou");
  Modular.to.pushReplacementNamed("/login");
  return false;
}

  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale = scaleSmallDevice(height);
    return WillPopScope(
      onWillPop: _onWillPop,
          child: Scaffold(
        backgroundColor: Colors.black,
        //appBar: AppBar(
        //  title: Text(widget.title),
        //),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: scale*70, right: 30, left:30, bottom: 40),
              child: Text('string-search-title'.i18n(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: scale*20, 
                  fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,)),
            Container(
              padding: EdgeInsets.only(top: scale*10, left: 30, right: 30),
              child: FormBuilderTextField(
                attribute: 'textfield',
                controller: myController, 
                decoration: InputDecoration(
                  labelText: 'string-search-label'.i18n(),
                  labelStyle: TextStyle(fontSize: scale*16),
                  contentPadding: EdgeInsets.only(left: 20),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(40.0)
                    )),
                ),
              ),
            ),

            Expanded(child: SizedBox()),

            Padding(
              padding: EdgeInsets.only(bottom: scale*20, left: 20, right: 20),
              child: Container(
                width: scale*350,
                height: scale*40,
                decoration: BoxDecoration(
                    color: Color(0xFFA20409),
                    borderRadius: BorderRadius.circular(10)),
                child: FlatButton(
                    onPressed: () {
                      print(myController.text);
                      Modular.to.pushReplacementNamed("/listSearch", arguments: myController.text);
                    },
                    child: Text('string-search-button'.i18n(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: scale*18,
                            fontWeight: FontWeight.bold))),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
