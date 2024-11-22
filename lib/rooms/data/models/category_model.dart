// class CategoryModel{
//   final String id;
//   final String name;
//   final String imageName;
//   CategoryModel({
//     required this.id,
//     required this.name,
//     required this.imageName,
// });
//  static List<CategoryModel> categories=[
//     CategoryModel(id: "sports", name: "Sports",
//         imageName: "sports"),
//     CategoryModel(id: "music", name: "Music",
//         imageName: "music"),
//     CategoryModel(id: "movies", name: "Movies",
//         imageName: "movies"),
//   ];
// }
class CategoryModel{
   String id;
  final String name;
  final String imageName;

  CategoryModel({ this.id="",
    required this.name,
    required this.imageName});
  static List<CategoryModel>categories=[
    CategoryModel(id: "sports", name: "sports", imageName: "sports"),
    CategoryModel(id: "movies", name: "movies", imageName: "movies"),
    CategoryModel(id: "music", name: "music", imageName: "music"),
  ];


}