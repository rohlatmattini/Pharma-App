import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homework/ListType.dart';
import 'package:homework/MedicineType.dart';
import 'package:homework/navo.dart';
import 'package:homework/login.dart';
import 'package:homework/searchdelegate.dart';
import 'package:homework/searchlist.dart';
import 'package:homework/item_info.dart';
import 'package:homework/showlist.dart';
import 'package:homework/sign_up.dart';
import 'package:http/http.dart'as http;

class homepage extends StatefulWidget {
  State<homepage> createState() => homepage1();
}

class homepage1 extends State<homepage> {
  // TextEditingController mobile_number=TextEditingController();

  @override

  String? gender;
  int index = 0;


  List advertisement =[
    "images/a1.jpg",
    "images/a2.jpg",
    "images/a3.jpg",
    "images/a4.jpg",
    "images/a5.jpg",
    "images/a6.jpg",

  ];


  Show1 s1=Show1(list: <ListElement>[]);
  Show1 s2=Show1(list: <ListElement>[]);
  Show1 s3=Show1(list: <ListElement>[]);
  Show1 s4=Show1(list: <ListElement>[]);
  Show1 s5=Show1(list: <ListElement>[]);

  ListType listType=ListType(listType: <ListTypeElement>[]);

  getDatatype()async{
    var request = http.MultipartRequest('GET', Uri.parse('http://10.0.2.2:8000/api/types'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      String infotype=(await response.stream.bytesToString());
      setState(() {
       listType=new ListType.fromRawJson(infotype);
       print(response.statusCode);

       print(listType);
        print(listType.toJson());
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }

  getData1()async{

    var headers = {
      'company': 'Thameco'
    };
    var request = http.Request('GET', Uri.parse('http://10.0.2.2:8000/api/user_list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String info1=(await response.stream.bytesToString());
      setState(() {
        s1=new Show1.fromRawJson(info1);

        print(s1);
        print(s1.toJson());
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }


  getData2()async{
    var headers = {
      'company': 'Diamond Pharma'
    };
    var request = http.Request('GET', Uri.parse('http://10.0.2.2:8000/api/user_list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String info2=(await response.stream.bytesToString());
      setState(() {
        s2=new Show1.fromRawJson(info2);

        print(s2);
        print(s2.toJson());
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }


  getData3()async{
    var headers = {
      'company': 'Uni Pharma'
    };
    var request = http.Request('GET', Uri.parse('http://10.0.2.2:8000/api/user_list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String info3=(await response.stream.bytesToString());
      setState(() {
        s3=new Show1.fromRawJson(info3);

        print(s3);
        print(s3.toJson());
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }

  getData4()async{
    var headers = {
      'company': 'Medico'
    };
    var request = http.Request('GET', Uri.parse('http://10.0.2.2:8000/api/user_list'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String info4=(await response.stream.bytesToString());
      setState(() {
        s4=new Show1.fromRawJson(info4);

        print(s4);
        print(s4.toJson());
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData1();
    getData2();
    getData3();
    getData4();
    getDatatype();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 50),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.pink[600]),
                        title: Text("User Name"),
                       // subtitle: Text('fadi@gmail.com'),
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Search()));
                },
                icon: Icon(Icons.search),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: [

                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),

                  SizedBox(height: 15,),

                  Container(//بيعطي error بلاها لانو listview داخل listview 
                    height:170,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: listType.listType.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>medicineType(listType.listType[i].type)));
                                    },
                                    child:
                                    Container(
                                      height: 130,
                                      width:130,
                                      margin:EdgeInsets.symmetric(horizontal:20),
                                      decoration:BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:Colors.grey[200],
                                        boxShadow:[BoxShadow( color:Colors.pink,offset:Offset(-1,-1),spreadRadius:5,blurRadius:10) ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 35),//مشان تطلع الكتابة بالنص
                                        child: Column(
                                          children: [
                                            Text(listType.listType[i].type,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  /////////////////////////////////////////////////////////////////

                  Column(//هاد العمود التاني مشان الكلمات تكون علر اليسار
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Center(
                            child: Text(
                              "Advertisement",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.pink[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        CarouselSlider(
                            items: [

                              for (int i = 0; i < advertisement.length; i++)
                                     Image.asset(
                                        advertisement[i])
                            ],
                            options: CarouselOptions(
                              height: 200,
                              viewportFraction: 0.6,
                              //هي حجم الصورة(بالعرض)بالسلايد
                              initialPage: 0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 2),
                              enlargeCenterPage:
                                  true, //بتطلع االمسافات بين الصور
                            )),



                      ////////////////////////////////////////////////////////////////////////////////

                        Container(height: 20,),


                        Text(
                          "Thameco",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        Container(height: 20,),

                         SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              for (int i = 0; i <s1.list.length; i++)
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => item_info( med:s1.list[i])));
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
                                            children: [Text("name: ${s1.list[i].name}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                          ],),
                                          Row(children: [Text("quantity: ${s1.list[i].quantity}" ,style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                          ],),
                                          Row(children: [Text("price: ${s1.list[i].price}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                          ],),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ]),
                          ),
                        //),


                        ////////////////////////////////////////////////////////////////////////////


                        Container(height: 20,),


                        Text(
                          "Diamond Pharma",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        Container(height: 20,),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            for (int i = 0; i < s2.list.length; i++)
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => item_info( med:s2.list[i])));
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
                                          children: [Text("name:${s2.list[i].name}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                          ],),
                                        Row(children: [Text("quantity:${s2.list[i].quantity}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                        ],),
                                        Row(children: [Text("price:${s2.list[i].price}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                        ],),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ]),
                        ),


                        Container(height: 20,),


                        //////////////////////////////////////////////////////////////////////////////
                        Text(
                          "Uni Pharma",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        Container(height: 20,),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            for (int i = 0; i < s3.list.length; i++)
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => item_info(med:s3.list[i])));
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
                                          children: [Text("name:${s3.list[i].name}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                          ],),
                                        Row(children: [Text("quantity:${s3.list[i].quantity}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                        ],),
                                        Row(children: [Text("price:${s3.list[i].price}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                        ],),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ]),
                        ),
                        /////////////////////////////////////////////////////////////////////////////////////////

                        Container(height: 20,),


                        Text(
                          "Medico",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        Container(height: 20,),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            for (int i = 0; i < s4.list.length; i++)
                              InkWell(
                                onTap: () {
                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => item_info( med:s4.list[i],)));
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
                                          children: [Text("name:${s4.list[i].name}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                          ],),
                                        Row(children: [Text("quantity:${s4.list[i].quantity}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                        ],),
                                        Row(children: [Text("price:${s4.list[i].price}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                        ],),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ]),
                        ),



                        //////////////////////////////////////////////////////////////////////////////////



                        // Text(
                        //   "Alpha",
                        //   style: TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.bold),
                        // ),
                        //
                        // Container(height: 10,),
                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: Row(children: [
                        //     for (int i = 0; i < s5.list.length; i++)
                        //       InkWell(
                        //         onTap: () {
                        //          Navigator.of(context).push(MaterialPageRoute(builder: (context) => item_info( med:s1.list[i])));
                        //         },
                        //         child:Container(
                        //           height: 200,
                        //           width:200,
                        //           margin:EdgeInsets.symmetric(horizontal:20),
                        //           decoration:BoxDecoration(
                        //             color:Colors.grey[200],
                        //             boxShadow:[BoxShadow( color:Colors.pink,offset:Offset(-1,-1),spreadRadius:5,blurRadius:10) ],
                        //           ),
                        //           child: Padding(
                        //             padding: const EdgeInsets.symmetric(horizontal: 15),
                        //             child: Column(
                        //               mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        //               children: [
                        //                 Row(
                        //                   children: [Text("name: ${s5.list[i].name}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        //                   ],),
                        //                 Row(children: [Text("quantity: ${s5.list[i].quantity}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        //                 ],),
                        //                 Row(children: [Text("price: ${s5.list[i].price}",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        //                 ],),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //   ]),
                        // ),
                      ]),
                ]))
          ],
        ),
      ),
    );
  }
}
