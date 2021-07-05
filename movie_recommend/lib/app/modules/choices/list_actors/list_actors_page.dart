import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_recommend/app/modules/choices/argumentos.dart';
import 'package:localization/localization.dart';
import 'package:movie_recommend/app/modules/scaleSmallDevice.dart';
import 'list_actors_controller.dart';

class ListActorsPage extends StatefulWidget {
  final String title;
  final Argumentos argumentos;

  const ListActorsPage({Key key, this.title = "ListActors", this.argumentos})
      : super(key: key);

  @override
  _ListActorsPageState createState() => _ListActorsPageState();
}

class _ListActorsPageState
    extends ModularState<ListActorsPage, ListActorsController> {
  //use 'controller' variable to access controller

  ReactionDisposer _dispose;

  @override
  void initState() {
    controller.getActorID(widget.argumentos.actor);
    super.initState();
  }

  Future<bool> _onWillPop() async {
    print("chegou");
    Modular.to.pushReplacementNamed("/actors", arguments: widget.argumentos);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scale = scaleSmallDevice(height);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: scale*70),
                child: Text('string-desired-option'.i18n(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: scale*20))),
            Expanded(child: Observer(builder: (_) {
              return ListView.builder(
                  itemCount: controller.listaActor.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            (controller.listaActor[index].profile_path != null)
                                ? 'https://image.tmdb.org/t/p/w200${controller.listaActor[index].profile_path}'
                                : 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg',
                          )),
                      title: Text(controller.listaActor[index].name,
                          style: TextStyle(color: Colors.white, fontSize: scale*16)),
                      subtitle: Text(""),
                      onTap: () {
                        Argumentos newArg = widget.argumentos;
                        newArg.actor = controller.listaActor[index].name;
                        newArg.actorID = controller.listaActor[index].id;
                        // newArg.actorID = controller.listaAtor[index].id;
                        Modular.to.pushReplacementNamed("/splashMovie",
                            arguments: newArg);
                      },
                    );
                  });
            })),
            Padding(
              padding:
                  EdgeInsets.only(top: scale*50, bottom: 65, left: 20, right: 20),
              child: Container(
                width: scale*350,
                height: scale*40,
                decoration: BoxDecoration(
                    color: Color(0xFFA20409),
                    borderRadius: BorderRadius.circular(10)),
                child: FlatButton(
                    onPressed: () {
                      Modular.to.pushReplacementNamed("/actors",
                          arguments: widget.argumentos);
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
