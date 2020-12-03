import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:rescue/global/controllers/auth.dart';
import 'package:rescue/global/controllers/auth_provider.dart';
import 'package:rescue/pages/signin_screen.dart';


class  SignUpPage extends StatefulWidget {
  const SignUpPage({this.onSignedIn});
  final VoidCallback onSignedIn;
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController _emailcontroller;
  TextEditingController _passwordcontroller;
  @override
  void initState(){
    super.initState();
    _emailcontroller= TextEditingController(text: "");
    _passwordcontroller= TextEditingController(text: "");
  }
  Widget build(BuildContext context) {
    theme: Theme.of(context);
    final BaseAuth auth = AuthProvider.of(context).auth;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top:30.0,left: 16,right: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "SIGN UP",
                        style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).buttonColor),

                      ),
                      GestureDetector(
                        child:Text(
                          "SIGN IN",
                          style: Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).buttonColor),
                        ),
                          onTap: () =>
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
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
                            ),),
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
                        InkResponse(
                            onTap: () async {
                              if(_emailcontroller.text.isEmpty || _passwordcontroller.text.isEmpty){
                                print("Email or Password cannot be empty");
                                return;
                              }
                              try{
                                final BaseAuth auth = AuthProvider.of(context).auth;
                                final String userId = await auth.signUpWithEmail(_emailcontroller.text, _passwordcontroller.text);
                                if(userId != null){
                                  print("login successfull");
                                  Phoenix.rebirth(context);
                                }
                              }catch(e){
                                print(e);
                              }
                            },
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
                              Icons.arrow_forward,
                            ),
                          )
                        ),
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
