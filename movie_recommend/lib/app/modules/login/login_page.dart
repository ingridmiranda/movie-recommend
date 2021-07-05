import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';
import 'package:localization/localization.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  Future<auth.User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final auth.GoogleAuthCredential credential =
        auth.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return (await auth.FirebaseAuth.instance.signInWithCredential(credential))
        .user;
  }

  @override
  void initState() {
    autorun((_) {
      if (controller.user != null) {
        controller.changeLoged(change: true);
        Modular.to.pushReplacementNamed("/home", arguments: controller.user);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale = scaleSmallDevice(height);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            //height: 200,
            padding: EdgeInsets.only(top: scale*100, bottom: scale*20, left:20, right: 20),
            color: Colors.black,
            child: Column(
              children: [
                Image.asset('assets/images/logo_movie_recommend.png', scale:3.5/scale,),
                Container(
                   padding: EdgeInsets.only(top: scale*15, bottom: scale*30),
                   child: Text('string-welcome'.i18n(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: scale*18,
                    fontWeight: FontWeight.w300)),
                 ),
                 
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:scale*30, left: 40, right: 40, bottom: scale*30),
            child: Text('text-login'.i18n(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: scale*18,
              fontWeight: FontWeight.w400),),
          ),
          Center(
            child: GoogleSignInButton(
              borderRadius: 10,
              darkMode: false,
              text: 'language'.i18n() == "pt-BR" ? "Logar com o Google " : "Sign in with Google ",
              onPressed: () async {
                try {
                  var user = await signInWithGoogle();
                  if (user != null) {
                    controller.changeLoged(change: true);
                    controller.addUser(user);
                    Modular.to.pushReplacementNamed("/home", arguments: user);
                  }
                } finally {
                  controller.changeLoged(change: false);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
