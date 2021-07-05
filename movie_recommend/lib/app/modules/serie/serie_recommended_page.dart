import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/chosen_serie.dart';
import 'package:localization/localization.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hive/hive.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'serie_controller.dart';
import 'package:movie_recommend/shared/constants.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';
import 'dart:math';

const String testDevice = 'A989A52316DA84C85DE19DC08FE4D029';
InterstitialAd _interstitialAd;


class SerieRecommendedPage extends StatefulWidget {
  final String title;
  final List<ChosenSerie> chosenSerie;
  const SerieRecommendedPage({Key key, this.title = "Serie", this.chosenSerie}) : super(key: key);

  @override
  _SerieRecommendedPageState createState() => _SerieRecommendedPageState();
}

class _SerieRecommendedPageState extends ModularState<SerieRecommendedPage, SerieController> {
  //use 'controller' variable to access controller
  bool tap = false;
  String video = "";
  String language = 'language'.i18n();
  int randomNumber;

static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['games', 'space', 'movies', 'entertainment', 'series', 'tv', 'filmes'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

 InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: Constants.IS_PRODUCTION == false ? InterstitialAd.testAdUnitId : Constants.KEY_ADMOB_INTERSTICIAL,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }


  
  Future<bool> _onWillPop() async {
    print("chegou");
    Modular.to.pushReplacementNamed("/login");
    return false;
  }

  @override
  void initState() {
    countRecommend();
    int size = widget.chosenSerie.length;
    print("size: " + size.toString());
    Random random = new Random();
    randomNumber = random.nextInt(size);
    print("random: " + randomNumber.toString());
    ChosenSerie serie = widget.chosenSerie[randomNumber];
    print("here");
    controller.getVideo(serie.id);
    controller.getReviews(serie.id);
    controller.getWatchProviders(serie.id);
    video = controller.video;
    FirebaseAdMob.instance.initialize(
        appId: Constants.IS_PRODUCTION == false
            ? Constants.KEY_ADMOB_DEBUG
            : Constants.KEY_ADMOB);
    _interstitialAd = createInterstitialAd()
      ..load();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


//ChosenMovie m = widget.chosenMovies;

  void showVideo() {
    var alertStyle = AlertStyle(
      alertPadding: EdgeInsets.all(0),
      animationType: AnimationType.fromTop,
      backgroundColor: Colors.black,
      isButtonVisible: true,
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.black,
        ),
      ),
      alertAlignment: Alignment.center,
    );

    Alert(
        context: context,
        title: "",
        style: alertStyle,
        content: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  initialVideoId: controller.video,
                  flags: YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  )),
              showVideoProgressIndicator: true,
            )
          ],
        ),
        buttons: [
          DialogButton(
            color: Colors.black,
            onPressed: () => Navigator.pop(context),
            child: Text(
              "close",
              style: TextStyle(color: Colors.white54, fontWeight: FontWeight.w300 ,fontSize: 16),
            ),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double scale = scaleSmallDevice(height);
    ChosenSerie serie = widget.chosenSerie[randomNumber];
    print(widget.chosenSerie);
    //print(serie.overview.length);
    String releaseDate = "";
    String genreNames = "";
    if (serie.first_air_date != null){
      releaseDate = getDate(serie.first_air_date);
    }
    if (serie.genre_ids != null){
      genreNames = getGenre(serie.genre_ids);
    }
    // print("AQUI");
    // controller.getVideo(movie.id);
    // print("DEPOIS VIDEO");

    //getDate(movie.release_date);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(child: Column(
                  children: [
                    Container(
                        child: Stack(children: [
                      Container(
                          color: Colors.black,
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width, height: scale*220)),
                      Container(
                          child: Opacity(
                              opacity: 0.8,
                              child: serie.backdrop_path != null ? Image.network(
                                'https://image.tmdb.org/t/p/original/${serie.backdrop_path}',
                                fit: BoxFit.fill,
                              ) : Image.asset(language == "pt-BR" ? "assets/images/no-poster-ptm.png" : "assets/images/no-poster-enm.png"))),
                      Container(
                        alignment: Alignment.topRight,  
                        padding: EdgeInsets.only(top: scale*35),
                        child: MaterialButton(
                                onPressed: () {
                                  Modular.to.pushReplacementNamed("/serieRecommended", arguments: widget.chosenSerie);
                                },
                                color: Color(0xFFa20409),
                                textColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.redoAlt,
                                  size: scale*20,
                                ),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                              ),),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: scale*130),
                          child: Column(
                            children: [
                              Text(serie.name.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: scale*26,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                releaseDate,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: scale*14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: scale*10),
                              ),
                              
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: RatingBar.readOnly(
                                      initialRating: (serie.vote_average / 2),
                                      filledIcon: Icons.star,
                                      emptyIcon: Icons.star_border,
                                      filledColor: Colors.yellow[600],
                                      size: scale*20,
                                    )),
                                    serie.vote_average > 0.0 ? Text(" " + serie.vote_average.toString(), 
                                      style: TextStyle(
                                        color: Colors.yellow[600],
                                        fontSize: scale*14,
                                        fontWeight: FontWeight.w900),) : Text(""),
                                  ],
                                )
                            ],
                          )),
                    ])),
                    Container(
                      padding: EdgeInsets.only(top: scale*20, bottom: scale*10, left:20, right: 20),
                      child: genreNames.length > 0 ? Text(
                        'string-gender'.i18n() + genreNames,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white),
                      ) : Text(""),
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.width / 10,
                          height: serie.overview.length < 200 ? scale*120 : scale*180,
                          //color: Colors.white,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: scale*5),
                          decoration: BoxDecoration(
                              color: Colors.white, //Color(0xFFA20409),
                              border: Border.all(width: 3.0, color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: SingleChildScrollView(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                  top: scale*5, left: 20, right: 20, bottom: scale*10),
                              child: AutoSizeText(serie.overview.length > 0 ? serie.overview : 'string-no-overview'.i18n(),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color(0xFFa20409),//(0xFFA20409),
                                      fontSize: scale*16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),

                     Column(
                      children: [
                        Observer(builder: (_) {
                          return controller.providers.length > 0 ? Container(
                            padding: EdgeInsets.only(left:45, top:scale*20, bottom:scale*10),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'string-watch'.i18n().toUpperCase(),
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: scale*12,
                                fontWeight: FontWeight.bold),
                            ),
                          ) : SizedBox();
                        }),
                        Observer(builder: (_) {
                          return Container(
                            height: scale*60,
                            padding: EdgeInsets.only(left:25, right: 25),
                            child: controller.providers.length > 0
                                ?
                                //return Expanded(
                                ListView.builder(
                                    shrinkWrap: true,
                                    //physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.providers.length,
                                    itemBuilder: (_, index) {
                                      return controller
                                                  .providers[index].logo_path !=
                                              null
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Image.network(
                                                    'https://image.tmdb.org/t/p/w200${controller.providers[index].logo_path}'),
                                                SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            )
                                          : SizedBox();
                                    },
                                    //  ),
                                  )
                                : SizedBox(),
                          );
                        }),
                       controller.providers.length > 0 ? Padding(
                        padding: EdgeInsets.only(bottom:scale*20)) : SizedBox(),
                      ],
                    ),

                    
                    Observer(builder: (_) {return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: (controller.video != null && controller.isReview == true) 
                      ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                      children: [
                      Observer(builder: (_) {
                      return Container(
                        //width: MediaQuery.of(context).size.width,
                        //alignment: Alignment.center,
                        padding: EdgeInsets.only(top: scale*20),
                          child: controller.video != null ? Row(
                            children: [
                                   GestureDetector(
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          FaIcon(FontAwesomeIcons.eye, color: Colors.white, size: 16),
                                          Padding(padding: EdgeInsets.only(left: 10)),
                                          controller.tapTrailer == false ? Text(
                                            'string-watch-trailer'.i18n(), 
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: scale*12, 
                                              fontWeight: FontWeight.w500
                                              ),
                                          ) : Text(
                                            'string-hide-trailer'.i18n(), 
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: scale*12, 
                                              fontWeight: FontWeight.w500
                                              ),
                                          ),
                                        ],
                                      ),
                                      onTap: showVideo
                                      /*() {
                                         controller.tapTrailer = !controller.tapTrailer;
                                        print("TAP TRAILER");
                                        print(controller.tapTrailer);} */
                                      )
                            ],
                          ) : Text("", style: TextStyle(color: Colors.white)));
                    }),
                    Observer(builder: (_) {
                      return Container(
                        //width: MediaQuery.of(context).size.width,
                        //alignment: Alignment.center,
                        padding: EdgeInsets.only(top: scale*20),
                          child: (controller.isReview == true) ? Row(
                            children: [
                                   GestureDetector(
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          FaIcon(FontAwesomeIcons.readme, color: Colors.white, size: 16),
                                          Padding(padding: EdgeInsets.only(left: 10)),
                                          controller.tapReviews == false ? Text(
                                            'string-read-review'.i18n(), 
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: scale*12, 
                                              fontWeight: FontWeight.w500
                                              ),
                                          ) : Text(
                                            'string-hide-review'.i18n(), 
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: scale*12, 
                                              fontWeight: FontWeight.w500
                                              ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        controller.tapReviews = !controller.tapReviews;
                                        print("TAP REVIEWS");
                                        print(controller.tapReviews);
                                      })
                            ]) : Text("", style: TextStyle(color: Colors.white)));
                    }),
                    ]);}),
                    Observer(builder: (_) {
                      return Container(
                          padding: EdgeInsets.only(top: scale*20, left:20, right: 20, bottom: scale*10),
                          child: controller.tapTrailer == true
                              ? YoutubePlayer(
                                  controller: YoutubePlayerController(
                                      initialVideoId: controller.video,
                                      flags: YoutubePlayerFlags(
                                        autoPlay: true,
                                        mute: false,
                                      )),
                                  showVideoProgressIndicator: true,
                                  //videoProgressIndicatorColor: Colors.amber,
                                  //progressColors: ProgressColors(
                                  //    playedColor: Colors.amber,
                                  //   handleColor: Colors.amberAccent,
                                  //),
                                )
                              : SizedBox()
                              );
                    }),
                     Observer(builder: (_) {
                            return Container(
                              height : (controller.tapReviews == true && controller.reviews.length < 1 && controller.reviews[0].content.length < 200) ? 200 : MediaQuery.of(context).size.height - 300,
                              child: controller.tapReviews == true
                                  ? ListView.builder(
                                            itemCount: controller.reviews.length,
                                            itemBuilder: (_, index) {
                                              return ListTile(
                                                contentPadding: EdgeInsets.only(right: 25, left: 25),
                                                leading: FaIcon(
                                                  FontAwesomeIcons.comments,
                                                  color: Colors.white,
                                                ),
                                                title: Text(controller.reviews[index].author,
                                                    style: TextStyle(
                                                      color: Colors.white, 
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: scale*16),
                                                    ),
                                                subtitle: Text(
                                                    controller.reviews[index].content,
                                                    textAlign: TextAlign.justify,
                                                    style: TextStyle(color: Colors.white, fontSize: scale*16))
                                                    ,
                                              );
                                            })
                                  : SizedBox(),
                            );
                          }),
                      
                    //SizedBox(height: 150)
                  ],
                ),
      ),
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Padding(
                padding: EdgeInsets.only(top: scale*10, bottom: 65, left: 20),
                child: Container(
                  width: (width/2.5),
                  height: scale*40,
                  decoration: BoxDecoration(
                      color: Color(0xFFa20409),
                      borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed("/login");
                      },
                      child: Text('button-main-menu'.i18n(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: scale*16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: scale*10, bottom: 65, right: 20),
                child: Container(
                  width: (width/2.5),
                  height: scale*40,
                  decoration: BoxDecoration(
                      color: Color(0xFFa20409),
                      borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed("/choices");
                      },
                      child: Text('button-get-recommend'.i18n(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: scale*16,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,)),
                ),
              )
            ],)
            ],
          ),
        ),
    );
  }
}

Future<void> countRecommend() async{
  var box = await Hive.openBox('countRecommend');
  var num = box.get('number');
  if (num != null){
    num = box.get('number') + 1;
    box.put('number', num);
  } else {
    box.put('number', 0);
  }
  print("num");
  print(num);
  if (num % 5 == 0){
    print("NUMMMMMMM");
    _interstitialAd.show();
  }  
}


String getDate(String data) {
  String language = 'language'.i18n();
  String ano = data.substring(0, 4);
  String mes = data.substring(5, 7);
  String dia = data.substring(8, 10);
  String date;
  if (language == "pt-BR") {
    date = dia + "/" + mes + "/" + ano;
  } else if (language == "en-US") {
    date = mes + "/" + dia + "/" + ano;
  }
  return date;
}

String getGenre(List<int> ids) {
  List<String> genres = [];
  String genresStrings = "";
  for (int i = 0; i < ids.length; i++) {
    switch (ids[i]) {
      case 28:
        genres.add('genre-action'.i18n());
        break;
      case 16:
        genres.add('genre-animation'.i18n());
        break;
      case 12:
        genres.add('genre-adventure'.i18n());
        break;
      case 35:
        genres.add('genre-comedy'.i18n());
        break;
      case 80:
        genres.add('genre-crime'.i18n());
        break;
      case 99:
        genres.add('genre-documentary'.i18n());
        break;
      case 18:
        genres.add('genre-drama'.i18n());
        break;
      case 10751:
        genres.add('genre-family'.i18n());
        break;
      case 878:
        genres.add('genre-scifi'.i18n());
        break;
      case 37:
        genres.add('genre-western'.i18n());
        break;
      case 14:
        genres.add('genre-fantasy'.i18n());
        break;
      case 10752:
        genres.add('genre-war'.i18n());
        break;
      case 36:
        genres.add('genre-history'.i18n());
        break;
      case 10402:
        genres.add('genre-music'.i18n());
        break;
      case 10749:
        genres.add('genre-romance'.i18n());
        break;
      case 9648:
        genres.add('genre-mistery'.i18n());
        break;
      case 27:
        genres.add('genre-horror'.i18n());
        break;
      case 53:
        genres.add('genre-thriller'.i18n());
        break;
      case 10759:
        genres.add('genre-action-adventure'.i18n());
        break;
      case 10765:
        genres.add('genre-fiction-fantasy'.i18n());
        break;
      case 10768:
        genres.add('genre-war-politics'.i18n());
        break;
      case 10762:
        genres.add('genre-kids'.i18n());
        break;
      case 10766:
        genres.add('genre-soap'.i18n());
        break;
      case 10764:
        genres.add('genre-reality'.i18n());
        break;
      case 10767:
        genres.add('genre-talk'.i18n());
        break;
      default:
    }
    
    genresStrings += genres[i];
    if (i + 2 < ids.length) {
      genresStrings += ", ";
    }
    if (i + 2 == ids.length) {
      genresStrings += 'string-and'.i18n();
    }
  }
  print(genresStrings);
  return genresStrings;
}
