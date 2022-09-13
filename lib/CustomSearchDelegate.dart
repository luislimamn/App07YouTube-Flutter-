import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: (){
            query = "";
          },
          icon: Icon(Icons.clear),
      )
    ];
    //throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: (){
          close(context, "");
        },
        icon: Icon(Icons.arrow_back),
    );
    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //print("Resultado: Pesquisa Realizada");
    close(context, query);
    return Container();
    //throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String>? lista = [];
    if(query.isNotEmpty){
      lista = [
        "Android",
        "Android Auto",
        "Android Development",
        "Android Navegação",
        "Development"
      ].where((element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();

      return ListView.builder(
          itemCount: lista!.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                close(context, lista![index]);
              },
              title: Text(lista![index]),
            );
          }
      );
    }else{
      return Center(child: Text("Nenhum Resultado para a Pesquisa"),);
    }

    //throw UnimplementedError();
  }
  
}