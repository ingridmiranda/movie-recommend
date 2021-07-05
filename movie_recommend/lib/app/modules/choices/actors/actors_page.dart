import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:movie_recommend/app/modules/choices/argumentos.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:movie_recommend/shared/constants.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';
import 'actors_controller.dart';

bool indifferentActor = false;
const String testDevice = 'A989A52316DA84C85DE19DC08FE4D029';

class ActorsPage extends StatefulWidget {
  final String title;
  final argumentos;
  const ActorsPage({Key key, this.title = "Actors", this.argumentos})
      : super(key: key);

  @override
  _ActorsPageState createState() => _ActorsPageState();
}

class _ActorsPageState extends ModularState<ActorsPage, ActorsController> {
  //use 'controller' variable to access controller
  int selectedIndex = 0;
  String name;

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
      adUnitId: Constants.IS_PRODUCTION == false ? BannerAd.testAdUnitId : Constants.KEY_ADMOB4,
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
        .initialize(appId: Constants.IS_PRODUCTION == false ? Constants.KEY_ADMOB_DEBUG : Constants.KEY_ADMOB4);
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
  Modular.to.pushReplacementNamed("/moviegenres", arguments: widget.argumentos.isMovie);
  return false;
}

    final ValueChanged _onChanged = (val) {
    indifferentActor = val;
    print(val);
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale = scaleSmallDevice(height);
    indifferentActor = false;
    Argumentos arguments = widget.argumentos;
    print("movie: " + arguments.isMovie.toString());
    //print("genre: " + arguments.listGenre[0]);
    return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: scale*70, right: 20, left: 20),
                    child: Text(
                      'actor-phrase'.i18n(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: scale*20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: scale*50, left: 40),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'actor-name-phrase'.i18n(),
                        style: TextStyle(fontSize: scale*14, color: Colors.white),
                      )),
                  Container(
                    padding: EdgeInsets.only(top: scale*10, left: 30, right: 30),
                    child: FormBuilderTypeAhead(
                      decoration: const InputDecoration(
                          //labelText: 'Insira o nome',
                          contentPadding: EdgeInsets.only(left: 20),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(40.0),
                            ),
                          )),
                      attribute: '',
                      // onChanged: _onChanged,
                      itemBuilder: (context, country) {
                        return ListTile(
                          title: Text(country),
                        );
                      },
                      controller: TextEditingController(text: 'Ator'),
                      initialValue: '',
                      suggestionsCallback: (query) {
                        if (query.isNotEmpty && indifferentActor == false) {
                          arguments.actor = query;
                          name = query;
                        }
                      },
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Theme(
                      data: ThemeData(unselectedWidgetColor: Colors.white),
                      child: FormBuilderCheckbox(
                        contentPadding: EdgeInsets.only(left: 30, right: 20),
                        attribute: 'checkbox',
                        checkColor: Colors.black,
                        activeColor: Colors.white,
                        onChanged: _onChanged,
                        label: Text('preference-phrase'.i18n(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: scale*16,
                                fontWeight: FontWeight.bold)),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 65, left: 20, right: 20),
                    child: Container(
                      width: scale*350,
                      height: scale*40,
                      decoration: BoxDecoration(
                          color: Color(0xFFA20409),
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton(
                          onPressed: () {
                            //print("1:" + name);
                            //controller.getMovies(name);
                            //print(controller.moviesList);
                            //Modular.to.pushReplacementNamed("/splashMovie", arguments: arguments);
                            arguments.indifferentActor = indifferentActor;
                            indifferentActor == true ? Modular.to.pushReplacementNamed("/splashMovie", arguments: arguments) : Modular.to.pushReplacementNamed("/selectactors", arguments: arguments);
                          },
                          child: Text('button-next'.i18n(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: scale*18,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              )),
    );
  }
}
