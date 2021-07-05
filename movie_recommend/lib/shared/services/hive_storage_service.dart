import 'dart:async';

import 'package:hive/hive.dart';
import 'package:movie_recommend/shared/models/user_model.dart';
import 'package:movie_recommend/shared/services/interfaces/ilocal_storage_service.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
class HiveStorageService implements ILocalStorageService{
 
var comp = Completer<Box>();

 HiveStorageService(){
   initDB();
 }


  @override
  Future<UserModel> add(UserModel u) async{
      final box = await comp.future;
      //u.id = box.values.length;
      box.put('userLogado', u);
      return u;
    }
  
    @override
    Future<UserModel> getUserLogado() async{
      final box = await comp.future;
      UserModel u = await box.get('userLogado');
      return u;
    }
  
    @override
  update(UserModel u) async{
    final box = await comp.future;
      box.put('userLogado', u);
      return u;
  }

  void initDB() async{
   final pathDir = await path_provider.getApplicationDocumentsDirectory();
   Hive.init(pathDir.path);
   Hive.registerAdapter(UserModelAdapter());
   final box = await Hive.openBox<UserModel>('user');
   if (!comp.isCompleted) comp.complete(box);
 }
}
