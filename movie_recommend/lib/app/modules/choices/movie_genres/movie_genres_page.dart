import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_recommend/app/modules/choices/argumentos.dart';
import 'package:movie_recommend/app/modules/choices/item_categoria/item_categoria_widget.dart';
import 'package:localization/localization.dart';
import 'movie_genres_controller.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:movie_recommend/shared/constants.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';

const String testDevice = 'A989A52316DA84C85DE19DC08FE4D029';
bool indifferentGenre = false;

class MovieGenresPage extends StatefulWidget {
  final String title;
  final bool isMovie;
  const MovieGenresPage({Key key, this.title = "MovieGenres", this.isMovie})
      : super(key: key);

  @override
  _MovieGenresPageState createState() => _MovieGenresPageState();
}

class _MovieGenresPageState
    extends ModularState<MovieGenresPage, MovieGenresController> {
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
      adUnitId: Constants.KEY_ADMOB3,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  static List<String> listGenre = [];
  static List<int> listGenreID = [];
  //bool value = false;

  List<Widget> _itensMovie = [
    ItemCategoriaWidget(
      title: 'genre-action'.i18n(),
      iconsText: "assets/images/action_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Action');
          listGenreID.add(28);
        } else {
          listGenre.remove('Action');
          listGenreID.remove(28);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-animation'.i18n(),
      iconsText: "assets/images/animation_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Animation');
          listGenreID.add(16);
        } else {
          listGenre.remove('Animation');
          listGenreID.remove(16);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-adventure'.i18n(),
      iconsText: "assets/images/adventure_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Adventure');
          listGenreID.add(12);
        } else {
          listGenre.remove('Adventure');
          listGenreID.remove(12);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-comedy'.i18n(),
      iconsText: "assets/images/comedy_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Comedy');
          listGenreID.add(35);
        } else {
          listGenre.remove('Comedy');
          listGenreID.remove(35);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-crime'.i18n(),
      iconsText: "assets/images/crime_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Crime');
          listGenreID.add(80);
        } else {
          listGenre.remove('Crime');
          listGenreID.remove(80);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-documentary'.i18n(),
      iconsText: "assets/images/documentary_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Documentary');
          listGenreID.add(99);
        } else {
          listGenre.remove('Documentary');
          listGenreID.remove(99);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-drama'.i18n(),
      iconsText: "assets/images/drama_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Drama');
          listGenreID.add(18);
        } else {
          listGenre.remove('Drama');
          listGenreID.remove(18);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-family'.i18n(),
      iconsText: "assets/images/family_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Family');
          listGenreID.add(10751);
        } else {
          listGenre.remove('Family');
          listGenreID.remove(10751);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-fantasy'.i18n(),
      iconsText: "assets/images/fantasy_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Fantasy');
          listGenreID.add(14);
        } else {
          listGenre.remove('Fantasy');
          listGenreID.remove(14);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-western'.i18n(),
      iconsText: "assets/images/western_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Western');
          listGenreID.add(37);
        } else {
          listGenre.remove('Western');
          listGenreID.remove(37);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-scifi'.i18n(),
      iconsText: "assets/images/fiction_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Science Fiction');
          listGenreID.add(878);
        } else {
          listGenre.remove('Science Fiction');
          listGenreID.remove(878);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-war'.i18n(),
      iconsText: "assets/images/war_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('War');
          listGenreID.add(10752);
        } else {
          listGenre.remove('War');
          listGenreID.remove(10752);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-history'.i18n(),
      iconsText: "assets/images/history_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('History');
          listGenreID.add(36);
        } else {
          listGenre.remove('History');
          listGenreID.remove(36);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-music'.i18n(),
      iconsText: "assets/images/musical_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Music');
          listGenreID.add(10402);
        } else {
          listGenre.remove('Music');
          listGenreID.remove(10402);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-romance'.i18n(),
      iconsText: "assets/images/romance2_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Romance');
          listGenreID.add(10749);
        } else {
          listGenre.remove('Romance');
          listGenreID.remove(10749);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-mistery'.i18n(),
      iconsText: "assets/images/suspense_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Mistery');
          listGenreID.add(9648);
        } else {
          listGenre.remove('Mistery');
          listGenreID.remove(9648);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-horror'.i18n(),
      iconsText: "assets/images/horror_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Horror');
          listGenreID.add(27);
        } else {
          listGenre.remove('Horror');
          listGenreID.remove(27);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-thriller'.i18n(),
      iconsText: "assets/images/thriller_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Thriller');
          listGenreID.add(53);
        } else {
          listGenre.remove('Thriller');
          listGenreID.remove(53);
        }
      },
    ),
  ];

  List<Widget> _itensSerie = [
    ItemCategoriaWidget(
      title: 'genre-action-adventure'.i18n(),
      iconsText: "assets/images/action_adventure_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Action & Adventure');
          listGenreID.add(10759);
        } else {
          listGenre.remove('Action & Adventure');
          listGenreID.remove(10759);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-animation'.i18n(),
      iconsText: "assets/images/animation_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Animation');
          listGenreID.add(16);
        } else {
          listGenre.remove('Animation');
          listGenreID.remove(16);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-comedy'.i18n(),
      iconsText: "assets/images/comedy_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Comedy');
          listGenreID.add(35);
        } else {
          listGenre.remove('Comedy');
          listGenreID.remove(35);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-crime'.i18n(),
      iconsText: "assets/images/crime_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Crime');
          listGenreID.add(80);
        } else {
          listGenre.remove('Crime');
          listGenreID.remove(80);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-documentary'.i18n(),
      iconsText: "assets/images/documentary_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Documentary');
          listGenreID.add(99);
        } else {
          listGenre.remove('Documentary');
          listGenreID.remove(99);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-drama'.i18n(),
      iconsText: "assets/images/drama_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Drama');
          listGenreID.add(18);
        } else {
          listGenre.remove('Drama');
          listGenreID.remove(18);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-family'.i18n(),
      iconsText: "assets/images/family_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Family');
          listGenreID.add(10751);
        } else {
          listGenre.remove('Family');
          listGenreID.remove(10751);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-western'.i18n(),
      iconsText: "assets/images/western_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Western');
          listGenreID.add(37);
        } else {
          listGenre.remove('Western');
          listGenreID.remove(37);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-fiction-fantasy'.i18n(),
      iconsText: "assets/images/fiction_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Sci-Fi & Fantasy');
          listGenreID.add(10765);
        } else {
          listGenre.remove('Sci-Fi & Fantasy');
          listGenreID.remove(10765);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-war-politics'.i18n(),
      iconsText: "assets/images/war_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('War & Politics');
          listGenreID.add(10768);
        } else {
          listGenre.remove('War & Politics');
          listGenreID.remove(10768);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-kids'.i18n(),
      iconsText: "assets/images/kids_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Kids');
          listGenreID.add(10762);
        } else {
          listGenre.remove('Kids');
          listGenreID.remove(10762);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-mistery'.i18n(),
      iconsText: "assets/images/suspense_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Mistery');
          listGenreID.add(9648);
        } else {
          listGenre.remove('Mistery');
          listGenreID.remove(9648);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-soap'.i18n(),
      iconsText: "assets/images/soap_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Soap');
          listGenreID.add(10766);
        } else {
          listGenre.remove('Soap');
          listGenreID.remove(10766);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-reality'.i18n(),
      iconsText: "assets/images/reality_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Reality');
          listGenreID.add(10764);
        } else {
          listGenre.remove('Reality');
          listGenreID.remove(10764);
        }
      },
    ),
    ItemCategoriaWidget(
      title: 'genre-talk'.i18n(),
      iconsText: "assets/images/talk_icon.png",
      onChanged: (value) {
        if (value == true) {
          listGenre.add('Talk');
          listGenreID.add(10767);
        } else {
          listGenre.remove('Talk');
          listGenreID.remove(10767);
        }
      },
    ),
  ];

  Future<bool> _onWillPop() async {
    print("chegou");
    Modular.to.pushReplacementNamed("/choices");
    return false;
  }

  final ValueChanged _onChanged = (val) {
    indifferentGenre = val;
    if (val == true){ 
      print("clear");
      listGenreID.clear();
      }
    print(val);
  };

 @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: Constants.IS_PRODUCTION == false ? Constants.KEY_ADMOB_DEBUG : Constants.KEY_ADMOB3);
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

  int initial = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale = scaleSmallDevice(height);
    if (initial == 0){
      listGenreID.clear();
      indifferentGenre = false;
    }
    //print(widget.isMovie);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: scale*70, left: 20, right: 20),
              child: Text(
                'genre-phrase'.i18n(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: scale*20),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                child: Expanded(
              child: GridView.count(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: scale*30, bottom: scale*10),
                mainAxisSpacing: scale*10,
                crossAxisSpacing: scale*30,
                crossAxisCount: 3,
                children: widget.isMovie == true ? _itensMovie : _itensSerie,
              ),
            )),
            Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: FormBuilderCheckbox(
                  contentPadding: EdgeInsets.only(left: 40, right: 20),
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
                    color: Color(0xFFa20409),
                    borderRadius: BorderRadius.circular(10)),
                child: FlatButton(
                    onPressed: () {
                      initial = 1;
                      //print("selected:" + listGenre[0]);
                      Argumentos argumentos = new Argumentos();
                      argumentos.isMovie = widget.isMovie;
                      argumentos.listGenre = listGenre;
                      argumentos.indifferentGenre = indifferentGenre;
                      print("Indiferente: " + indifferentGenre.toString());
                      print(listGenreID);
                      print("isMOVIE" + widget.isMovie.toString());
                      //print("lISt" + listGenre[1]);
                      if (listGenreID.length > 0 || indifferentGenre == true){
                      argumentos.listGenreID = listGenreID;
                      widget.isMovie == true ? Modular.to.pushReplacementNamed("/actors", arguments: argumentos) 
                      : Modular.to.pushReplacementNamed("/splashMovie", arguments: argumentos);
                      }
                    },
                    child: Text('button-next'.i18n(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: scale*18,
                            fontWeight: FontWeight.bold))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
