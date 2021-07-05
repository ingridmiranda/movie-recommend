import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'about_us_controller.dart';
import 'package:movie_recommend/shared/constants.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';

const String testDevice = 'A989A52316DA84C85DE19DC08FE4D029';

class AboutUsPage extends StatefulWidget {
  final String title;
  const AboutUsPage({Key key, this.title = "AboutUs"}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

Future<bool> _onWillPop() async{
  print("chegou");
  Modular.to.pushReplacementNamed("/login");
  return false;
}

class _AboutUsPageState extends ModularState<AboutUsPage, AboutUsController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale = scaleSmallDevice(height);
    return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
        backgroundColor: Colors.black,
        //appBar: AppBar(
       //   title: Text(widget.title),
        //),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: scale*70, bottom: scale*10),
              child: Text('string-about-us'.i18n().toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: scale*16),
                  textAlign: TextAlign.center),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top:scale*20, left:30, right: 30, bottom: scale*20),
              child: Text('string-about-us-text'.i18n(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: scale*16,
                ),
                textAlign: TextAlign.justify),),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left:30, right: 30, bottom: scale*30),
              child: Text('string-about-us-tmdb'.i18n(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: scale*16,
                ),
                textAlign: TextAlign.justify),),
            Padding(
              padding: EdgeInsets.only(left:20, right: 20),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: scale*20, left:scale*25, right: scale*15, bottom: scale*20),
                //color: Colors.white24,
                decoration: BoxDecoration(
                    color: Color(0xFFa20409),
                    border: Border.all(color: Colors.white, width:3),
                    borderRadius: BorderRadius.circular(20)),
                //decoration: BoxDecoration(
                //  color: Colors.grey,
                //  borderRadius: BorderRadius.circular(10),
               //   border: Border.all(color: Colors.white)),
                child: 
                Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(bottom:scale*15),
                      child: Text('string-contact'.i18n(),
                        style: TextStyle(color: Colors.white, fontSize: scale*18, fontWeight: FontWeight.bold),),
                    ),
                    GestureDetector(
                      onTap: _launchURLMail,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Icon(FontAwesomeIcons.envelope, color: Colors.white),
                        Text("    "),
                        Text("movierecommend.app@gmail.com", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: scale*16,
                            fontWeight: FontWeight.bold),)
                      ],),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:scale*10, left:50),
                    ),
                    GestureDetector(
                        onTap: _launchURLInstagram,
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Icon(FontAwesomeIcons.instagram, color: Colors.white),
                        Text("    "),
                        Text("movierecommend.app", 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: scale*16,
                            fontWeight: FontWeight.bold),)
                      ],),
                    ),
                  ],
                ),
                ),
            ),
              Expanded(child: Container(),),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 20, bottom: 10),
                child: Image.asset('assets/images/movie-db-api.png', scale: 2.5/scale)),

          ],
        ),
      ),
    );
  }

}

_launchURLMail() async {
  print("TAAAP");
  const url = 'mailto:<movierecommend.app@gmail.com>?subject=&body=';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLInstagram() async {
  print("TAAAP");
  const url = 'https://www.instagram.com/movierecommend.app/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
