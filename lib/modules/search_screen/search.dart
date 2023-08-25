

import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String>{
  List names =['manar','ahmed','farouk','sohaila','mohamed'];
  @override
  List<Widget>? buildActions(BuildContext context) {
  return   [IconButton(icon: const Icon(Icons.clear),
    onPressed: () {
    query='';
    },),]  ;
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return   IconButton(icon: const Icon(Icons.arrow_back),
      onPressed: () {     close(context, '');
      },)  ;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("$query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {

     List filter = names.where((element) => element.contains(query)).toList();

    return ListView.builder(
        itemCount: query==''?names.length:filter.length ,
        itemBuilder: (context,i){
          return InkWell(
            onTap: (){
              query==''?names[i]:filter[i];
              showResults(context);},
            child: Container(

                child:query==""? Text("${names[i]}"):Text("${filter[i]}")
            ),
          );
    //       itemCount: 15,
    // itemBuilder: (context,i){
    // return ColumnList();



        }) ;
      
    
      
  }


}


















//
// import '../component/component.dart';
//
// class SearchScreen extends StatelessWidget {
// var searchcontroller=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: defaultFormField(
//               controller: searchcontroller,
//                 type: TextInputType.text
//             ,validate:(String value){
//                 if(value.isEmpty){
//                   return 'search must not be empty';
//                 }else null;
//             },onChange:(value){},
//
//               label:'Search',
//               prefix:Icons.search
//             ),
//           ),
//
//         ],
//
//       ),
//     );
//   }
// }
