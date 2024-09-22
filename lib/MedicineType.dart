import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/ShowMedicineType.dart';
import 'package:homework/searchdelegate.dart';
import 'package:http/http.dart'as http;
import 'Navo.dart';
import 'homepage.dart';
import 'item_info.dart';
import 'item_info4.dart';
import 'login.dart';

class medicineType extends StatefulWidget {
  String type;
  medicineType(this.type);
  State<medicineType> createState() => medicineType1(type);
}

class medicineType1 extends State<medicineType> {

String type;

medicineType1(this.type);


  MedicineType m=MedicineType(typeList: <TypeList>[]);

  getDatamedicineType()async{
    var headers = {
      'type': type
    };
    var request = http.MultipartRequest('GET', Uri.parse('http://10.0.2.2:8000/api/type_list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String medicineinfo=(await response.stream.bytesToString());
      setState(() {
         m =new MedicineType.fromRawJson(medicineinfo);
        print(m);
        print(m.toJson());
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }

@override
  void initState() {
    getDatamedicineType();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.pink[600]),
                        title: Text("User Name"),
                      ),
                    ),
                  )
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.home, color: Colors.pink[600]),
                        title: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => homepage()));
                            },
                            child: Text(
                              "Home",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                        leading:
                            Icon(Icons.logout_sharp, color: Colors.pink[600]),
                        title: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => login()));
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(color: Colors.pink[700]),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navo(),
      appBar: AppBar(
        backgroundColor: Colors.pink[600],
        actions: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 100),
                  width: 100,
                  height: 200,
                  child: Image.asset(
                    "images/0000.png",
                    fit: BoxFit.fill,
                  )),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Search()));
                },
                icon: Icon(Icons.search),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          for (int i = 0; i <m.typeList.length; i++)
            InkWell(
              onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => item_info8(mel:m.typeList[i])));
              },
              child:Container(
                height: 200,
                width:200,
                margin:EdgeInsets.symmetric(horizontal:20),
                decoration:BoxDecoration(
                  color:Colors.grey[200],
                  boxShadow:[BoxShadow( color:Colors.pink,offset:Offset(-1,-1),spreadRadius:5,blurRadius:10) ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [Text("name:${m.typeList[i].name}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],),
                      Row(children: [Text("quantity:${m.typeList[i].quantity}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      ],),
                      Row(children: [Text("price:${m.typeList[i].price}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      ],),
                    ],
                  ),
                ),
              ),
            ),
        ]),


    );
  }
}
