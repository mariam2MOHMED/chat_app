// class RoomModel{
//    String id;
//   final String name;
//   final String desc;
// final   String categoryId;
//   RoomModel({
//      this.id='',
//     required this.name,
//     required this.desc,
//     required   this.categoryId,
// });
//   RoomModel.fromJson(Map<String,dynamic>json):this(
//     id: json['id'],
//     name: json['name'],
//     desc: json['desc'],
//     categoryId: json['categoryId'],
//   );
//   Map<String,dynamic>toJson()=>{
//     'id':id,
//     'name':name,
//     'desc':desc,
//     'categoryId':categoryId
//   };
// }
class RoomModel{
   String id;
  final String name;
  final String desc;
  final String categoryId;

  RoomModel({ this.id='',
    required this.name,
    required this.desc,
    required this.categoryId});
  RoomModel.fromJson(Map<String,dynamic>json):this(
    id: json['id'],
    name: json['name'],
    desc: json['desc'],
    categoryId: json['categoryId']
  );
  Map<String,dynamic>toJson()=>{
    'id':id,
    'name':name,
    'desc':desc,
    'categoryId':categoryId
  };
}