// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SignUpApp(),

  ));
}

class SignUpApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SignUpApp>
{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  dynamic dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGN UP PAGE'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                child: Text(
                  'Welcome Page!',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w500,
                      fontSize: 40),
                )),

            //image
            Container(
              child:Image.network('https://picsum.photos/250?image=9',
              height: 200,
              width: 200,),
              ),

            //input username
            Container(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),

            // input email
            Container(
              padding: EdgeInsets.all(8),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 150),
              child: TextField(
                style: TextStyle(
                  fontSize: 15,
                  height: 2.0,
                ),
                controller: emailController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:20, horizontal:15),
                  border: OutlineInputBorder(),
                  labelText: 'Your Email',
                ),
                ),
              ),
            ),

            //input password
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            //drop down button function
            Container(
                padding: EdgeInsets.fromLTRB(10,10,10,0),
                child: DropdownButton<String>(
                  value: dropDownValue,
                  hint: Text('Gender'),
                  items: <String>['Male', 'Female', 'Rather not to say']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropDownValue = value;
                    });
                    print(value);
                  },
                ),
            ),

            Container(
              height: 50,
                padding: EdgeInsets.fromLTRB(10,10,10,0),
                child~: ElevatedButton(
                  child: Text('SIGN UP'),
                  onPressed:(){
                    final snackBar = SnackBar(
                      content: const Text("Congratulations! You have signed up successfully"),
                      action:SnackBarAction(label: "Undo",onPressed: (){

                      },),);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    print(nameController.text);
                    print(emailController);
                    print(passwordController);
                  },
                )),
        ],
        ),
      ),
    );
  }
}