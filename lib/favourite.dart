import 'package:flutter/material.dart';
import 'package:homework/item_info2.dart';
import 'package:homework/item_info3.dart';
import 'package:homework/searchdelegate.dart';
import 'package:http/http.dart' as http;
import 'Navo.dart';
import 'homepage.dart';
import 'listfav.dart';
import 'login.dart';
import 'orderlist.dart';

class favourite extends StatefulWidget {
  State<favourite> createState() => favourite1();
}

class favourite1 extends State<favourite> {

    Favourite f=Favourite(favorites:<Favorite> []);
    getData()async{

      var request = http.Request('GET', Uri.parse('http://10.0.2.2:8000/api/favorite_list'));


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String info=(await response.stream.bytesToString());
        setState(() {
          f=new Favourite.fromRawJson(info);

          print(f);
          print(f.toJson());
        });
      }
      else {
        print(response.reasonPhrase);
      }



    }
  @override
  void initState() {
    getData();
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

                Row(children: [
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
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
                  )
                ]),
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    ' Favourit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '  Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Icon(
                    Icons.wallet,
                    color: Colors.black87,
                  ),
                ],
              )
            ],
          ),
        ),

        /////////////////////////////////////////////////////////////////////////////

        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount:f.favorites.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                   InkWell(
                     onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>item_info4(mef: f.favorites[i])));
                     },
                     child:  Card(
                         child: ListTile(
                             title: Text('Name: ${f.favorites[i].name}',
                                 style: TextStyle(
                                     fontSize: 15, fontWeight: FontWeight.bold)),
                             subtitle: Text(
                               'Quantity: ${f.favorites[i].quantity}',
                               style: TextStyle(
                                   fontSize: 15, fontWeight: FontWeight.bold),
                             ),
                             trailing: Text(
                                 'Price: ${f.favorites[i].price*f.favorites[i].quantity} SYP',
                                 style: TextStyle(
                                     fontSize: 15, fontWeight: FontWeight.bold)))),

                   )
                  ],
                );
              }),
        ));
  }
}
