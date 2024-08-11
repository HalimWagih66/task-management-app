class UserModel{
  String? name;
  String? email;
  String? imageUrl;
  String? id;
  UserModel({this.name,this.email,this.imageUrl,this.id});

   factory UserModel.fromFJson(json){
    return UserModel(name: json['name'], email: json['email'], imageUrl: json['imageUrl'], id: json['id']);
  }
  Map<String,dynamic>toJson(){
     return {
       "name" : name,
       "email" : email,
       "imageUrl":imageUrl,
       "id":id
     };
  }
}