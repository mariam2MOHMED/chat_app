// class UserModel{
//   String id;
//   String email;
//   String password;
//   UserModel({
//     required this.id,
//     required this.email,
//     required this.password,
//
// });
//   UserModel.fromJson(Map<String,dynamic>json):
//   this(
//   id: json['id'],
//         email: json['email'],
//         password: json['password']
//   );
//   Map<String,dynamic>toJson()=>{
//     'id':id,
//     'email':email,
//     'password':password
//   };
// }
class UserModel{
  String id;
  String email;
  String password;
  String name;
  UserModel({
     this.id='',
    required this.email,
    required this.password,
    required this.name,
  });
  UserModel.fromJson(Map<String,dynamic>json):this(
    id: json['id'],
    email: json['email'],
    password: json['password'],
    name: json['name']
  );
    Map<String,dynamic>toJson()=>{
      'id':id,
      'email':email,
      'password':password,
      'name':name
    };
}