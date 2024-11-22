// import 'package:flutter/material.dart';
// import 'package:mychat/rooms/data/models/category_model.dart';
// import 'package:mychat/shared/app_theme.dart';
//
// class CategoriesDropDownBtn extends StatefulWidget {
//   final Function(String?)onCategorySelected;
//    CategoriesDropDownBtn({
//      required this.onCategorySelected,
//      super.key});
//
//   @override
//   State<CategoriesDropDownBtn> createState() => _CategoriesDropDownBtnState();
// }
//
// class _CategoriesDropDownBtnState extends State<CategoriesDropDownBtn> {
//  String? selectCategory;
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//         validator: (value){
//           if(value==null){
//             return "you must choose one category";
//           }else{
//             return null;
//           }
//         },
// isExpanded: true,
//
//         value: selectCategory,
//
//         hint: Text("Select category",style: TextStyle(
//             fontSize: 16.0,
//             fontWeight:FontWeight.w400,
//             color: Colors.grey
//         ),),
//         items:CategoryModel.categories.map((e) =>
//         DropdownMenuItem(
//
//           child: Row(
//             children: [
//               Image.asset("assets/images/${e.imageName}.png",height: 30.0,),
// SizedBox(width: 5.0,),
//               Text(e.name,style:TextStyle(
//               color: AppTheme.grey,
//               fontSize: 14.0,
//               fontWeight: FontWeight.bold
//                       ) ,),
//             ],
//           ),
//           value: e.id,)).toList(),
//         onChanged: (category){
//           widget.onCategorySelected(selectCategory);
//     selectCategory=category;
//     setState(() {
//
//     });
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:mychat/rooms/data/models/category_model.dart';

class categoriesDropDownBtn extends StatefulWidget {
  Function(String?)onPress;
   categoriesDropDownBtn({
  required this.onPress
  ,super.key});

  @override
  State<categoriesDropDownBtn> createState() => _categoriesDropDownBtnState();
}

class _categoriesDropDownBtnState extends State<categoriesDropDownBtn> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedCategory,
      isExpanded: true,
      validator: (value){
        if(value!.isEmpty||value==null){
          return "You must choose one category";
        }else{
          return null;
        }
      },
        items: CategoryModel.categories
        .map((category) =>DropdownMenuItem(

        value: category.id,
        child: Row(
          children: [
            Image.asset('assets/images/${category.imageName}.png',height: 30.0,),
            SizedBox(width: 5.0,),
            Text(category.name
                  ,style:Theme.of(context).textTheme.headlineSmall ),
          ],
        ))).toList(),
        onChanged: (category){
          selectedCategory=category;
          widget.onPress(selectedCategory);
          setState(() {});
        });
  }
}

