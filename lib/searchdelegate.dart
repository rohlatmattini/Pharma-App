
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homework/item_info.dart';
import 'package:homework/item_info2.dart';
import 'package:homework/searchlist.dart';
import 'package:http/http.dart'as http;
import 'Navo.dart';

class Search extends StatefulWidget {
  State<Search> createState() => Search1();
}

class Search1 extends State<Search> {

  TextEditingController search=TextEditingController();

  Products p=Products(searchList: <SearchList>[]);

  getData()async{
    var headers = {
      'search': search.text,
      'role':'pharmacist'
    };
    var request = http.Request('GET', Uri.parse('http://10.0.2.2:8000/api/search_list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String info=(await response.stream.bytesToString());
      setState(() {
        p=new Products.fromRawJson(info);

        print(p);
        print(p.toJson());
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Navo(),
      appBar: AppBar(
        backgroundColor: Colors.pink[600],
        actions: [
        Row(children: [

          IconButton(
            onPressed: (){
             getData();
          },icon: Icon(Icons.search),),
        ],)
      ],),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(

          children:[ Column(children: [
              // Row(children: [

                Form(
                  child: TextFormField(

                    controller: search,
                    onChanged: (value) {
                      setState(() {
                        search.text = value;
                      });
                    },

                    decoration: InputDecoration(
                        prefixIconColor: Colors.pink[600],
                        hintText: "search",
                        prefixIcon: Icon(Icons.search),

                    ),
                  ),
                ),

           ListView.builder(
             shrinkWrap: true,
               itemCount: p.searchList.length,
               itemBuilder:(context,i){
                 return InkWell(
                   onTap: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>(item_info2(mes: p.searchList[i]))));
                   },
                   child: Card(
                     child: ListTile(
                       title: Text('Name: ${p.searchList[i].name}',
                       style: TextStyle(
                               fontSize: 15, fontWeight: FontWeight.bold)),
                        subtitle: Text('Type: ${p.searchList[i].type}'),

                     ),

                   ),
                 );
               }
           )

          ],),
       ] ),
      )
     );
  }
}

