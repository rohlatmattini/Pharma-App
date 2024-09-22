import 'package:flutter/material.dart';
import 'package:homework/homepage.dart';
import 'package:homework/sign_up.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  State<login> createState() => _login1();
}

class _login1 extends State<login> {
  TextEditingController mobile_number = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  postData() async {
    var headers = {'Accept': 'application/json'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://10.0.2.2:8000/api/log_in'));
    request.fields.addAll({
      'mobile_number': mobile_number.text,
      'password': password.text,
      'role': 'pharmacist'
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      int code = response.statusCode;
      print(code);

      if (code == 200) {
        String responseBody = await response.stream.bytesToString();

        print(responseBody);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => homepage()),
        );
      } else {
        String responseBody = await response.stream.bytesToString();
        print(responseBody);

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Login failed"),
              content: Text("One of the credentials is not correct"),
              actions: [
                MaterialButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      }
    } catch (e) {
      print("Error: $e");
      // Handle other errors, e.g., network issues
    }
  } //login

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "images/333.jpg",
          ),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 150,
                  height: 180,
                  child: Image.asset(
                    "images/0000.png",
                    fit: BoxFit.fill,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 0, right: 20, left: 20),
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Container(
                        height: 10,
                      ),
                      Text(
                        "Welcome to our App",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        height: 40,
                      ),
                      Form(
                        key: formstate,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: mobile_number,
                              onChanged: (value) {
                                setState(() {
                                  mobile_number.text = value;
                                });
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "The Field is empty";
                                }
                                if (val.length < 10) {
                                  return "must be 10 numbers";
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIconColor: Colors.pink[600],
                                  hintText: "phone",
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
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.yellowAccent,
                                      ),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            Container(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: password,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "The Field is empty";
                                }
                                if (val.length < 5) {
                                  return "it must be more than 5 elements";
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIconColor: Colors.pink[600],
                                  hintText: "password",
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
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.yellowAccent),
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            Container(
                              height: 20,
                            ),
                            Center(
                                child: MaterialButton(
                                    color: Colors.pink[400],
                                    child: Text("login",
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      setState(() {
                                        if (formstate.currentState!.validate())
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text('warning'),
                                                  content: Text(
                                                      "are you sure from this password ?"),
                                                  actions: [
                                                    TextButton(
                                                        child: Text(
                                                          'No',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .blueAccent),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        }),
                                                    TextButton(
                                                      child: Text('Yes',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .blueAccent)),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        postData();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              });
                                      });
                                    })),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
