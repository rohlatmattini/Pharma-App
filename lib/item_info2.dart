import 'package:flutter/material.dart';
import 'package:homework/orders.dart';
import 'package:homework/searchlist.dart';
import 'package:homework/showlist.dart';
import 'package:http/http.dart'as http;
import 'homepage.dart';
import 'login.dart';
import 'navo.dart';
class item_info2 extends StatefulWidget {

  SearchList  mes;

  item_info2({required this.mes}); // item_info( {required Message med});


  // Product product;
  // item_info(this.product);
  State<item_info2> createState() => item_info3();
}

class item_info3 extends State<item_info2> {
  int counter = 1;
  int index = 0;
  bool state=true;
  getfav()async{

    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8000/api/add_favorite'));
    request.fields.addAll({
      'product_id': widget.mes.id.toString()
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }


  }

  postdata()async{
    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8000/api/order'));
    request.fields.addAll({
      'quantity': counter.toString(),
      'product_id': widget.mes.id.toString(),
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }


  void navigateToOrderDetails() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => order(1),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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

          /////////////////////////////////////////////////////////////////////////////

          appBar: AppBar(
              backgroundColor: Colors.pink[600],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medical_services,
                    color: Colors.black87,
                  ),
                  Text(
                    ' Medecation',
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
              )),

          //////////////////////////////////////////////////////////////////////////
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.mes.name,
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            child: IconButton(
                              icon:Icon(Icons.favorite_border),
                              onPressed: () {
                                getfav();
                                // Additional logic if needed based on the state
                              },
                            ),
                            decoration: BoxDecoration(
                                color: Colors.pink[600],
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.mes.composition,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.mes.type,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " quantity : ${widget.mes.quantity} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Expiration date:   ${widget.mes.expirationDate}"
                              ,style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.mes.price.toStringAsFixed(1),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (counter > 1) {
                                          counter --;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "$counter",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if(counter<widget.mes.quantity)
                                          counter++;
                                      });
                                    },
                                    icon: Icon(Icons.add, color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        MaterialButton(
                            onPressed: () {
                              postdata();

                            },
                            // cart.add();

                            child: Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 50,
                              child:Text('order now',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.pink[600],
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                            ))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
