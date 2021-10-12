import 'package:api_project/register.dart';
import 'package:api_project/ui/another_home_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              padding: EdgeInsets.only(left: 10),
              icon: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: Container(
            margin: EdgeInsets.only(right: 30, left: 30, top: 20),
            child: Column(children: <Widget>[
              Form(
                child: Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Text(
                          'Log in to your ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFEE5E69),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Text(
                          'account ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFFEE5E69),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Email', border: InputBorder.none),
                          // validator: (String value) {
                          //   if (value.isEmpty ||
                          //       value.indexOf("@") == -1 ||
                          //       value.indexOf(".") == -1) {
                          //     return "enter vaild Email";
                          //   }
                          //   return "";
                          // },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: InputBorder.none),
                                // validator: (String value) {
                                //   if (value.isEmpty || value.length < 1) {
                                //     return "enter password";
                                //   }
                                //   return "";
                                // },
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                'Forget?',
                                style: TextStyle(color: Color(0xFFEE5E69)),
                              ),
                              onTap: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => ForgetPass()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 300),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color(0xFFEE5E69),
                            borderRadius: BorderRadius.circular(25)),
                        child: MaterialButton(
                            child: Text(
                              'Log in',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AnotherHome()));
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 20, left: 60, right: 60, top: 100),
                        child: Row(
                          children: [
                            Text(
                              'Don\'t have an accounnt?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              child: Text('Sign up',
                                  style: TextStyle(color: Color(0xFFEE5E69))),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 120, right: 120, top: 30),
                        height: 6,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                ),
              )
            ])));
  }
}
