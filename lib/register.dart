import 'package:api_project/ui/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        child: Column(
          children: <Widget>[
            Form(
                child: Expanded(
              child: ListView(
                children: [
                  Container(
                    child: Text(
                      'Create your ',
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
                          hintText: 'Username', border: InputBorder.none),
                      // validator: (String value) {
                      //   if (value.isEmpty || value.length < 1) {
                      //     return "enter username";
                      //   }
                      //   return "";
                      // },
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
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password', border: InputBorder.none),
                      // validator: (String value) {
                      //   if (value.isEmpty || value.length < 1) {
                      //     return "enter password";
                      //   }
                      //   return "";
                      // },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    margin: EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Phone', border: InputBorder.none),
                      validator: (String value) {
                        if (value.isEmpty || value.length < 5) {
                          return "enter phone";
                        }
                        return "";
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFEE5E69),
                        borderRadius: BorderRadius.circular(25)),
                    child: MaterialButton(
                        child: Text(
                          'Log in',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        onPressed: () {}),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 20),
                    child: Text(
                      'By clicking Sign up you agree to the our Terms and Conditions',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  )
                ],
              ),
            )),
            Container(
              margin: EdgeInsets.only(bottom: 60, left: 70, right: 70),
              child: Row(
                children: [
                  Text(
                    'Already an account?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: Text('Logn in',
                        style: TextStyle(color: Color(0xFFEE5E69))),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 120,
              height: 6,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
      ),
    );
  }
}
