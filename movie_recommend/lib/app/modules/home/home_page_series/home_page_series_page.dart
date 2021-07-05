import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page_series_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:movie_recommend/shared/models/user_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_serie.dart';
import 'package:movie_recommend/app/modules/choices/choices_home_page.dart';
import 'package:movie_recommend/app/modules/about_us/about_us_page.dart';
import 'package:movie_recommend/app/modules/home/home_page.dart';
import 'package:movie_recommend/app/modules/search/search_home_page.dart';
import 'package:movie_recommend/shared/constants.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';

const String testDevice = 'A989A52316DA84C85DE19DC08FE4D029';

class HomePageSeriesPage extends StatefulWidget {
  final String title;
  final UserModel user;
  const HomePageSeriesPage({Key key, this.title = "HomePageSeries", this.user})
      : super(key: key);

  @override
  _HomePageSeriesPageState createState() => _HomePageSeriesPageState();
}

class _HomePageSeriesPageState extends ModularState<HomePageSeriesPage, HomePageSeriesController> {
  //use 'controller' variable to access controller
    String language = 'language'.i18n();
    int _currentIndex = 0;
    final List<StatefulWidget> _children = [
        HomePage(),
        ChoicesHomePage(),
        SearchHomePage(),
        AboutUsPage(),
    ];

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
      adUnitId: Constants.IS_PRODUCTION == false ? BannerAd.testAdUnitId : Constants.KEY_ADMOB7,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }


  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: Constants.IS_PRODUCTION == false ? Constants.KEY_ADMOB_DEBUG : Constants.KEY_ADMOB7);
    _bannerAd = createBannerAd()
      ..load()
      ..show();
    if (language == "en-US"){
      controller.getEmAlta();
      controller.getBemAvaliados();
      controller.getPopular();
      controller.getNowPlaying();
    }
    if (language == "pt-BR"){
      controller.getBemAvaliados();
      controller.getPopular();
      controller.getNowPlaying();
    }
    //controller.getNowPlaying();
//Constants.KEY_ADMOB7
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
/*   
  List<String> _getListaFilmesDestaques() {
    return ["XXXXXXX", "YYYYYY"];
  } 
  */

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.home_menu,
      animatedIconTheme: IconThemeData(size: 22.0),
      backgroundColor: Color(0xFFa20409),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 18.0),
            child: FaIcon(FontAwesomeIcons.home, color: Colors.white),
          ),
          backgroundColor: Color(0xFFa20409),
          onTap: () {
            //Modular.to.pushReplacementNamed("/home");
            print('Home');
          },
          label: 'Home',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Color(0xFFa20409),
        ),
        SpeedDialChild(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 22.0),
            child: FaIcon(FontAwesomeIcons.question, color: Colors.white),
          ),
          backgroundColor: Color(0xFFa20409),
          onTap: () {
            Modular.to.pushReplacementNamed("/choices");
            print('Recommend me');
          },
          label: 'Recommend me',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Color(0xFFa20409),
        )
      ],
    );
}

  @override
   Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale = scaleSmallDevice(height);
    return Scaffold(
      backgroundColor: Colors.black,
      //floatingActionButton: Padding(
      //    padding: EdgeInsets.only(bottom: 50), child: buildSpeedDial()),
      body: _currentIndex == 0 ? Padding(
        padding: EdgeInsets.only(bottom: scale*10),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: scale*30),
                child: Opacity(
                  opacity: 0.5,
                  //child: Image.asset("assets/images/bg.png"),
                ),
              ),
              Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30, top: scale*60, bottom: scale*20),
                      child: Row(
                        children: [
                          Observer(builder: (_) {
                            return CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    '${widget.user.foto ?? 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg'}'));
                          }),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Observer(builder: (_) {
                            return Text('string-hello'.i18n() + '${widget.user.nome ?? ''}!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: scale*18,
                                    fontWeight: FontWeight.bold));
                          })
                        ],
                      )),
                  Row(children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: scale*25, left: 20, right: 1),
                      child: Container(
                        width: MediaQuery.of(context).size.width/2 - 25,
                        height: scale*35,
                        decoration: BoxDecoration(
                            color: Colors.white, //Color(0xFFa20409).withOpacity(0.5),
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: new BorderRadius.only(
                              bottomLeft: Radius.circular(15), 
                              topLeft: Radius.circular(15)),
                            ), //BorderRadius.circular(10)),
                        child: FlatButton(
                            onPressed: () {
                              Modular.to.pushReplacementNamed("/home", arguments: widget.user);
                              
                            },
                            child: Text('movie-word'.i18n(),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: scale*16,
                                    fontWeight: FontWeight.normal))))),
                    Padding(
                      padding: EdgeInsets.only(bottom: scale*25, right: 20, left: 1),
                      child: Container(
                        width: MediaQuery.of(context).size.width/2 - 25,
                        height: scale*35,
                        decoration: BoxDecoration(
                            color: Color(0xFFa20409),
                            border: Border.all(color: Color(0xFFa20409), width: 2),
                            borderRadius: new BorderRadius.only(
                              bottomRight: Radius.circular(15), 
                              topRight: Radius.circular(15))), //BorderRadius.circular(10)),
                        child: FlatButton(
                            onPressed: () {
                              //Modular.to.pushReplacementNamed("/homeSeries");
                              
                            },
                            child: Text('serie-word'.i18n(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: scale*16,
                                    fontWeight: FontWeight.bold))))),
                  ],),
                  language == "en-US" ? Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 30, top: scale*10),
                        child: Text('string-trending'.i18n(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: scale*18,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: scale*10),
                        child: Observer(builder: (_) {
                          return CarouselSlider(
                            items: controller.emAlta.toList().map((ChosenSerie item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      child: GestureDetector(
                                          onTap: () {
                                            Modular.to.pushReplacementNamed("/series",
                                                arguments: item);
                                          },
                                          child: Stack(
                                            children: [
                                              item.backdrop_path != null ? CachedNetworkImage(
                                                              imageUrl: 'https://image.tmdb.org/t/p/w400${item.backdrop_path}',
                                                              fit: BoxFit.fitWidth,
                                                              placeholder: (context, url) =>
                                                                  const CircularProgressIndicator(),
                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                            ) : Image.asset("assets/images/no-poster-pt.png"),

                                              /* Image.network(
                                                  (item != null)
                                                      ? 'https://image.tmdb.org/t/p/original/${item.backdrop_path}'
                                                      : 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg',
                                                  fit: BoxFit.fitWidth), */
                                              Container(
                                                color: Colors.black45,
                                                padding: EdgeInsets.only(top: scale*135),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width - 100 ,
                                                        alignment: Alignment.center,
                                                        child: Text(item.name,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight:
                                                                    FontWeight.w600),
                                                            overflow: TextOverflow.fade,
                                                            softWrap: false,),
                                                      ),
                                                      SizedBox(width: 10),
                                                    ]),
                                              ),
                                              Container(
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                      children: [
                                                    Icon(Icons.star,
                                                        color: Colors.yellow[600]),
                                                    Text(item.vote_average.toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold))
                                                  ])),
                                            ],
                                          )));
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(autoPlay: true, height: scale*200),
                          );
                        }),
                      ),
                    ],
                  ) : SizedBox(),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 30),
                        child: Text('string-top-rated'.i18n(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: scale*18,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: scale*10),
                        child: Observer(builder: (_) {
                          return CarouselSlider(
                            items: controller.bemAvaliados
                                .toList()
                                .map((ChosenSerie item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      child: GestureDetector(
                                    onTap: () {
                                      Modular.to.pushReplacementNamed("/series",
                                          arguments: item);
                                    },
                                    child: Stack(
                                      children: [
                                        item.backdrop_path != null ? CachedNetworkImage(
                                          imageUrl: 'https://image.tmdb.org/t/p/w400${item.backdrop_path}',
                                          fit: BoxFit.fitWidth,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ) : Image.asset("assets/images/no-poster-pt.png"),
                                        /* Image.network(
                                            (item != null)
                                                ? 'https://image.tmdb.org/t/p/original/${item.backdrop_path}'
                                                : 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg',
                                            fit: BoxFit.fitWidth), */
                                        Container(
                                          color: Colors.black45,
                                          padding: EdgeInsets.only(top: scale*135),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width - 100 ,
                                                  alignment: Alignment.center,
                                                  child: Text(item.name,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w600),
                                                      overflow: TextOverflow.fade,
                                                      softWrap: false,),
                                                ),
                                                SizedBox(width: 10),
                                              ]),
                                        ),
                                        Container(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                              Icon(Icons.star,
                                                  color: Colors.yellow[600]),
                                              Text(item.vote_average.toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold))
                                            ])),
                                      ],
                                    ),
                                  ));
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(autoPlay: true, height: scale*200),
                          );
                        }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 30),
                        child: Text('string-popular'.i18n(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: scale*18,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: scale*10),
                        child: Observer(builder: (_) {
                          return CarouselSlider(
                            items: controller.maisPopulares
                                .toList()
                                .map((ChosenSerie item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      child: GestureDetector(
                                          onTap: () {
                                            Modular.to.pushReplacementNamed("/series",
                                                arguments: item);
                                          },
                                          child: Stack(
                                            children: [
                                              item.backdrop_path != null ? CachedNetworkImage(
                                                              imageUrl: 'https://image.tmdb.org/t/p/w400${item.backdrop_path}',
                                                              fit: BoxFit.fitWidth,
                                                              placeholder: (context, url) =>
                                                                  const CircularProgressIndicator(),
                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                            ) : Image.asset("assets/images/no-poster-pt.png"),
                                              /* Image.network(
                                                  (item != null)
                                                      ? 'https://image.tmdb.org/t/p/original/${item.backdrop_path}'
                                                      : 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg',
                                                  fit: BoxFit.fitWidth), */
                                              Container(
                                                color: Colors.black45,
                                                padding: EdgeInsets.only(top: scale*135),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width - 100 ,
                                                        alignment: Alignment.center,
                                                        child: Text(item.name,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight:
                                                                    FontWeight.w600),
                                                            overflow: TextOverflow.fade,
                                                            softWrap: false,),
                                                      ),
                                                      SizedBox(width: 10),
                                                    ]),
                                              ),
                                              Container(
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                      children: [
                                                    Icon(Icons.star,
                                                        color: Colors.yellow[600]),
                                                    Text(item.vote_average.toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold))
                                                  ])),
                                            ],
                                          )));
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(autoPlay: true, height: scale*200),
                          );
                        }),
                      ),
                    ],
                  ),
                   Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 30),
                        child: Text('string-tv-on-air'.i18n(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: scale*18,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: scale*10),
                        child: Observer(builder: (_) {
                          return CarouselSlider(
                            items: controller.nosCinemas
                                .toList()
                                .map((ChosenSerie item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      child: GestureDetector(
                                          onTap: () {
                                            Modular.to.pushReplacementNamed("/series",
                                                arguments: item);
                                          },
                                          child: Stack(
                                            children: [
                                              item.backdrop_path != null ? CachedNetworkImage(
                                                              imageUrl: 'https://image.tmdb.org/t/p/w400${item.backdrop_path}',
                                                              fit: BoxFit.fitWidth,
                                                              placeholder: (context, url) =>
                                                                  const CircularProgressIndicator(),
                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                            ) : Image.asset("assets/images/no-poster-pt.png"),
                                              /* Image.network(
                                                  (item != null)
                                                      ? 'https://image.tmdb.org/t/p/original/${item.backdrop_path}'
                                                      : 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg',
                                                  fit: BoxFit.fitWidth), */
                                              Container(
                                                color: Colors.black45,
                                                padding: EdgeInsets.only(top: scale*135),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width - 100 ,
                                                        alignment: Alignment.center,
                                                        child: Text(item.name,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w600),
                                                            overflow: TextOverflow.fade,
                                                            softWrap: false,
                                                            ),
                                                      ),
                                                      SizedBox(width: 10),
                                                    ]),
                                              ),
                                              Container(
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                      children: [
                                                    Icon(Icons.star,
                                                        color: Colors.yellow[600]),
                                                    Text(item.vote_average.toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold))
                                                  ])),
                                            ],
                                          )));
                                },
                              );
                            }).toList(),
                            options: CarouselOptions(autoPlay: true, height: scale*200),
                          );
                        }),
                      ),
                    ],
                  ), 
                ],
              ),
            ],
          ),
        )) : _children[_currentIndex],

        bottomNavigationBar: 'language'.i18n() == "pt-BR" ? Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              label: "Menu", 
               
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.film),
              label: 'Me recomende',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.search),
              label: 'Busca',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.infoCircle),
              label: 'Sobre nós',
            ),
          ],
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.grey[200],//[400], //.amber[800],
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          unselectedItemColor: Colors.grey, // Colors.white,
          backgroundColor: Colors.black,
          iconSize: scale*24,
          showUnselectedLabels: true
        ),
      ) : Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              label: "Home", 
               
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.film),
              label: 'Recommend',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.infoCircle),
              label: 'About us',
            ),
          ],
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.grey[200],//[400], //.amber[800],
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          unselectedItemColor: Colors.grey, // Colors.white,
          backgroundColor: Colors.black,
          iconSize: scale*24,
          showUnselectedLabels: true
        ))


    );
  }
  void onTabTapped(int index) {
  print("TAPPED");
   setState(() {
     _currentIndex = index;
   });
 }
}
