import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'list_controller.dart';
import 'package:localization/localization.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';

class ListPage extends StatefulWidget {
  final String title;
  final String search;
  const ListPage({Key key, this.title = "List", this.search}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends ModularState<ListPage, ListController> {
  //use 'controller' variable to access controller
  String language = 'language'.i18n();

  @override
  void initState() {
    controller.getSeriesMovies(widget.search);
    super.initState();
  }

  Future<bool> _onWillPop() async {
    Modular.to.pushReplacementNamed("/search");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale = scaleSmallDevice(height);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: scale*70),
                child: Text('string-desired-option'.i18n(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: scale*20))),
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: controller.chosenMovie.length +
                      controller.chosenSerie.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: index < controller.chosenMovie.length
                          ? ( (controller.chosenMovie[index].poster_path != null) ? 
                          Image.network('https://image.tmdb.org/t/p/w200${controller.chosenMovie[index].poster_path}') :
                          Image.asset(language == "pt-BR" ? 'assets/images/no-image-pt.png' : 'assets/images/no-image-en.png'))
                          : ((controller.chosenSerie[index - controller.chosenMovie.length].poster_path != null) ? 
                          Image.network('https://image.tmdb.org/t/p/w200${controller.chosenSerie[index - controller.chosenMovie.length].poster_path}')
                          : Image.asset(language == "pt-BR" ? 'assets/images/no-image-pt.png' : 'assets/images/no-image-en.png')),
                      title: index < controller.chosenMovie.length
                          ? Text(controller.chosenMovie[index].title,
                              style: TextStyle(color: Colors.white, fontSize: scale*16))
                          : Text(
                              controller
                                  .chosenSerie[
                                      index - controller.chosenMovie.length]
                                  .name,
                              style: TextStyle(color: Colors.white, fontSize: scale*16)),
                      subtitle: Text(""),
                      onTap: () {
                        if (index < controller.chosenMovie.length) {
                          Modular.to.pushReplacementNamed("/movies",
                              arguments: controller.chosenMovie[index]);
                        } else {
                          Modular.to.pushReplacementNamed("/series",
                              arguments: controller.chosenSerie[
                                  index - controller.chosenMovie.length]);
                        }
                      },
                    );
                  },
                );
              }),
            ),
            /* Observer(builder: (_) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.chosenSerie.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: Image.network(
                          'https://image.tmdb.org/t/p/original/${controller.chosenSerie[index].poster_path}'),
                      title: Text(controller.chosenSerie[index].name,
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text(""),
                      onTap: () {
                        Modular.to.pushReplacementNamed("/series",
                            arguments: controller.chosenSerie[index]);
                      },
                    );
                  },
                ),
              );
            }), */
            Padding(
              padding:
                  EdgeInsets.only(top: scale*30, bottom: 65, left: 20, right: 20),
              child: Container(
                width: scale*350,
                height: scale*40,
                decoration: BoxDecoration(
                    color: Color(0xFFA20409),
                    borderRadius: BorderRadius.circular(10)),
                child: FlatButton(
                    onPressed: () {
                      Modular.to.pushReplacementNamed("/search");
                    },
                    child: Text('string-search'.i18n(),
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
