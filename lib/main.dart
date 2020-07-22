import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Form'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
          child: Form(
            key: _keyForm,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) => value.isEmpty ? 'Fill Email' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) => value.isEmpty ? 'Fill Password' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Builder(
                      builder: (context) => FlatButton(
                        color: Colors.blue,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_keyForm.currentState.validate()) {
                            print(_passwordController.text);
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Processing..'),
                            ));
                          }
                        },
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
