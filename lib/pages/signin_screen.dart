import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/global/controllers/auth_provider.dart';
import 'package:rescue/global/themes/themes.dart';
import 'package:rescue/global/widget/signInButton.dart';
import 'package:rescue/pages/root.dart';
import 'package:rescue/pages/signup_screen.dart';

class  LoginPage extends StatefulWidget {
  const LoginPage({this.onSignedIn});
  final VoidCallback onSignedIn;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailcontroller;
  TextEditingController _passwordcontroller;
  @override
  void initState(){
    super.initState();
    _emailcontroller= TextEditingController(text: "");
    _passwordcontroller= TextEditingController(text: "");
  }
  @override
  Widget build(BuildContext context) {
    final BaseAuth auth = AuthProvider.of(context).auth;
    theme: Theme.of(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child:Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
              //height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Illustration.png"),
                  //fit: BoxFit.cover,
                  //alignment: Alignment.bottomCenter,
                ),
              ),
            ),
      ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "SIGN IN",
                        style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).buttonColor),

                      ),
                      GestureDetector(
                        child:Text(
                          "SIGN UP",
                          style: Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).buttonColor),
                        ),
                          onTap: () => {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpPage(onSignedIn: widget.onSignedIn)),
                            ),
                      }
                      )

                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.email_outlined,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _emailcontroller,
                            decoration: InputDecoration(
                              hintText: "Email Address",
                              focusedBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Theme.of(context).accentColor,
                                  )
                              )

                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.lock,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          controller: _passwordcontroller,
                          decoration: InputDecoration(
                            hintText: "Password",
                              focusedBorder: new UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Theme.of(context).accentColor,
                                  )
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: <Widget>[
                        InkResponse(
                          onTap: () async{
                            try{
                              final String userId = await auth.signInWithGoogle();
                              Phoenix.rebirth(context);
                            }catch(e){
                              print(e);
                            }
                          },
                          child:Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Theme.of(context).iconTheme.color,
                                  width: 2.1,
                                ),
                              ),
                              child: Icon(
                                LineIcons.google,
                              ),
                            ),
                          ),
                        SizedBox(width: 20),
                        InkResponse(
                          onTap: ()=>{},
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).iconTheme.color,
                                width: 2.1,
                              ),
                            ),
                            child: Icon(
                              LineIcons.facebook,
                            ),
                          ),
                        ),
                        Spacer(),
                        SignInButton(
                          text: "ok",
                          onPressed: () async {
                            if (_emailcontroller.text.isEmpty ||
                                _passwordcontroller.text.isEmpty) {
                              print("Email or Password cannot be empty");
                              return;
                            }
                            try {
                              final String userId = await auth.signInWithEmail(
                                  _emailcontroller.text,
                                  _passwordcontroller.text);
                              if (userId != null) {
                                print("login successfull");
                                Phoenix.rebirth(context);
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
