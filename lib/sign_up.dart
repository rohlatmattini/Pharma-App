import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';

class signup extends StatefulWidget {
  State<signup> createState() => _signup1();
}

class _signup1 extends State<signup> {
  String? gender;
  GlobalKey<FormState> formState1 = GlobalKey();
  int v = 0;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController mobile_number = TextEditingController();
  TextEditingController governorate = TextEditingController();

  postData() async {
    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8000/api/sign_up'));
    request.fields.addAll({
      'first_name': firstname.text,
      'last_name': lastname.text,
      'email': email.text,
      'password': password.text,
      'mobile_number': mobile_number.text,
      'governorate': governorate.text,
      'role':'pharmacist'
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => homepage()));
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
    }

  } //sign up

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  width: 150,
                  height: 140,
                  child: Image.asset(
                    "images/0000.png",
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SingleChildScrollView(
                  child: Form(
                    key: formState1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            "Please enter your info",
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            height: 40,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              runSpacing: 20,
                              children: [
                                Container(
                                    width: 180,
                                    child: TextFormField(
                                      controller: firstname,
                                      keyboardType: TextInputType.text,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "the field is empty";
                                        }
                                        if (val!.length < 3) {
                                          return "FirstName must be at least 3 charecter";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: "firstname",
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.pink[600],
                                        ),
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
                                    )),
                                Container(
                                    width: 180,
                                    child: TextFormField(
                                      controller: lastname,
                                      keyboardType: TextInputType.text,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "the field is empty";
                                        }
                                        if (val!.length < 3) {
                                          return "LastName must be at least 3 character";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: "lastname",
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.pink[600],
                                        ),
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
                                    )),
                                Container(
                                    width: 180,
                                    child: TextFormField(
                                      controller: mobile_number,
                                      keyboardType: TextInputType.phone,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "the field is empty";
                                        }
                                        if (val!.length != 10) {
                                          return "PhoneNumber must be 10 numbers";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: "+963 | Mobile",
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: Colors.pink[600],
                                        ),
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
                                    )),
                                Container(
                                    width: 180,
                                    child: TextFormField(
                                      controller: governorate,
                                      keyboardType: TextInputType.text,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "the field is empty";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: "governorate",
                                        prefixIcon: Icon(
                                          Icons.location_city,
                                          color: Colors.pink[600],
                                        ),
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
                                    )),
                                Container(
                                    width: 180,
                                    child: TextFormField(
                                      controller: email,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "the field is empty";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: "email",
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.pink[600],
                                        ),
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
                                    )),
                                Container(
                                    width: 180,
                                    child: TextFormField(
                                      obscureText:true,
                                      controller: password,
                                      keyboardType: TextInputType.text,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "the field is empty";
                                        }
                                        if (val!.length < 5) {
                                          return "password must be at least 5 characters";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: "password",
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.pink[600],
                                        ),
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
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(height: 20),
                          MaterialButton(
                              height: 50,
                              color: Colors.pink[300],
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (formState1.currentState!.validate()) {
                                  postData();
                                }
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
