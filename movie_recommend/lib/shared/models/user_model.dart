import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType (typeId: 1)
class UserModel extends HiveObject{
  
  @HiveField(0)
  String nome;

  @HiveField(1)
  String email;

  @HiveField(2)
  String foto;
    
  UserModel({this.nome, this.email, this.foto});

}