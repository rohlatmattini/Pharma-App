import 'package:flutter/material.dart';
import 'package:homework/searchdelegate.dart';
import 'package:http/http.dart' as http;
import 'Navo.dart';
import 'homepage.dart';
import 'login.dart';
import 'orderlist.dart';

class order extends StatefulWidget {
  int x;

  order(this.x);

  State<order> createState() => _order1(x);
}

class _order1 extends State<order> {
  int x;

  _order1(this.x);

  TextEditingController From = TextEditingController();
  TextEditingController to = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  Orderlist orderlist = Orderlist(userOrders: <UserOrder>[]);

  getData() async {
    var headers = {'role': 'pharmacist'};
    var request =
    http.Request('GET', Uri.parse('http://10.0.2.2:8000/api/order_list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String info = (await response.stream.bytesToString());
      setState(() {
        orderlist = new Orderlist.fromRawJson(info);

        print(orderlist);
        print(orderlist.toJson());
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  getData2() async {
    var headers = {
      'from': From.text,
      'to': to.text,
      'role': 'pharmacist'
    };
    var request = http.Request(
        'GET', Uri.parse('http://10.0.2.2:8000/api/time_frame'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print (await response.stream.bytesToString());}
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    if(x==1)
    getData();
    else
      getData2();
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
                    ' Order',
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
    child:
    SingleChildScrollView(
      child: Column(
        children:[
          Form(
            child: Column(
              children: [
                TextFormField(
                  controller: From,
                  decoration: InputDecoration(
                      prefixIconColor: Colors.pink[600],
                      hintText: "From",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))),
                    ),
                ),
                TextFormField(
                  controller: to,
                  decoration: InputDecoration(
                      prefixIconColor: Colors.pink[600],
                      hintText: "to",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))),
                         ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.pink[600],
                      borderRadius:
                      BorderRadius.all(Radius.circular(20))),

                  child: MaterialButton(
                      child:Text("press"),

                      onPressed:(){
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>order(2)));

                        });
                      }


                  ),
                )
              ],
            ),
          ),
          
          ListView.builder(
            shrinkWrap:true,
        itemCount: orderlist.userOrders.length,
        itemBuilder: (context, i) {
        return Column(
        children: [
        Card(
        child: ListTile(
        title: Text('Name: ${orderlist.userOrders[i].name}',
        style: TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold)),
        subtitle: Text(
        'Quantity: ${orderlist.userOrders[i].quantity}',
        style: TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
        'Price: ${orderlist.userOrders[i].price*orderlist.userOrders[i].quantity} SYP',
        style: TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold)))),

          Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
        Text("status:  ${orderlist.userOrders[i].status}", style: TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold)),
        Text("payment:  ${orderlist.userOrders[i].payment}", style: TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold)),
        ]),
          ]
          );
        }),
            ]
      ),
    ),


    ));
    }
    }
