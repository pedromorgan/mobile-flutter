import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mattermost/assets.dart';
import 'package:mattermost/login_screen.dart';

class SelectServer extends StatefulWidget {
  SelectServer({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SelectServerState();
  }
}

class SelectServerState extends State<SelectServer> {
  final TextEditingController _controller = TextEditingController();
  bool _isError = false;
  bool _isConnecting = false;

  bool notNull(Object o) => o != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(ImageAssets.logoImage),
            ),
            Text(
              'Enter Server URL',
              style: const TextStyle(fontSize: 18.0,),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                autofocus: false,
                autocorrect: false,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  labelText: 'Server URL',
                  hintText: 'https://mattermost.example.com',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0)
                  ),
                  errorText: _isError && !_isConnecting ? 'Cannot connect to the server.' : null,
                ),
                onChanged: (str) {
                  setState(() {
                    _isError = false;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: OutlineButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      !_isConnecting ? null : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                          height: 20.0,
                          width: 20.0,
                        ),
                      ),
                      Text(_isConnecting ? 'Connecting' : 'Connect'),
                    ].where(notNull).toList(),
                  ),
                  color: Colors.white,
                  splashColor: Colors.blueAccent,
                  textColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                  borderSide: BorderSide(color: Colors.blueAccent),
                  onPressed: () {
                    setState(() {
                      _isConnecting = true;
                    });

                    Timer(
                      Duration(seconds: 2),
                      () {
                        setState(() {
                          _isConnecting = false;
                        });

                        if (_controller.text == 'http://localhost:8065') {
                          setState(() {
                              _isConnecting = false;
                              _isError = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        } else {
                          setState(() {
                              _isError = true;
                          });
                        }
                      }
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
