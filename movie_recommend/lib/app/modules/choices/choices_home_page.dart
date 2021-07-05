import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'choices_controller.dart';
import 'package:movie_recommend/shared/constants.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';

const String testDevice = 'A989A52316DA84C85DE19DC08FE4D029';

class ChoicesHomePage extends StatefulWidget {
  final String title;
  const ChoicesHomePage({Key key, this.title = "Choices"}) : super(key: key);

  @override
  _ChoicesHomePageState createState() => _ChoicesHomePageState();
}

class _ChoicesHomePageState extends ModularState<ChoicesHomePage, ChoicesController> {
    bool _isMovie = false;
    bool _isSerie = false;

  //use 'controller' variable to access controller
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['games', 'space'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: Constants.IS_PRODUCTION == false ? BannerAd.testAdUnitId : Constants.KEY_ADMOB2,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }
 
  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: Constants.IS_PRODUCTION == false ? Constants.KEY_ADMOB_DEBUG : Constants.KEY_ADMOB2);
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

Future<bool> _onWillPop() async{
  print("chegou");
  Modular.to.pushReplacementNamed("/login");
  return false;
}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale = scaleSmallDevice(height);
    //var screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: scale*70, left: 20, right: 20),
              child: Text(
                'kind-phrase'.i18n(),
                style: TextStyle(
                    fontSize: scale*20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
          Container(
              padding: EdgeInsets.only(top: scale*30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(onTap: () {
                    setState(() {
                      if (_isMovie == false && _isSerie == true){
                        _isMovie = !_isMovie;
                        _isSerie = false;
                      } else {
                        _isMovie = !_isMovie;
                      }
                    });
                  }, 
                  child:   
                  Opacity(
                    opacity: _isMovie ? 1.0 : 0.5,
                    child: Image.asset('assets/images/movie_image.png', scale: 1/(scale*scale)))                
                  ), 
                  InkWell(onTap: () {
                    setState(() {
                      if (_isMovie == true && _isSerie == false){
                        _isMovie = false;
                        _isSerie = !_isSerie;
                      } else {
                        _isSerie = !_isSerie;
                      }
                     
                   });
                  },
                  child: 
                  Opacity(
                    opacity: _isSerie ? 1.0 : 0.5,
                    child: Image.asset('assets/images/popcorn_image.png', scale: 1/(scale*scale)))
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.only(top: scale*15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'movie-word'.i18n(),
                    style: TextStyle(
                        fontSize: scale*20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'serie-word'.i18n(),
                    style: TextStyle(
                        fontSize: scale*20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Expanded(child: 
            SizedBox()
          ),
          Padding(
            padding: EdgeInsets.only(bottom: scale*20, left: 20, right: 20),
            child: Container(
              width: scale*350,
              height: scale*40,
              decoration: BoxDecoration(
                  color: Color(0xFFa20409),
                  borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                  onPressed: () {
                    if (_isMovie || _isSerie){
                    Modular.to.pushReplacementNamed("/moviegenres", arguments: _isMovie);
                    }
                  },
                  child: Text('button-next'.i18n(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: scale*18,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ],
      ),
    )
    );
  }
}

