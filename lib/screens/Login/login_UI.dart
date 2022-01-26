// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/components/ordivider.dart';
import 'package:flutter_project/models/API/login_response_model.dart';
import 'package:flutter_project/providers/google_signin_provider.dart';
import 'package:flutter_project/screens/Dashboard/dashboard_UI.dart';
import 'package:flutter_project/screens/Login/login_logic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_project/global/config.dart';
import 'package:flutter_project/models/Data/user_model.dart';
import 'package:flutter_project/models/API/login_request_model.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isAPIcallProcess = false;
  bool hidepsswrd = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? psswrd;
  late LoginResponseModel response;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: HexColor("#1C3144"),
          body: ProgressHUD(
            child: Form(
              key: globalFormKey,
              child: _loginUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
          )),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/new-student.png",
                    width: 175,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 20,
              top: 20,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            const Icon(Icons.person),
            "Email",
            "Email",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Email can\'t be empty";
              }
              return null;
            },
            (onSaveVal) {
              email = onSaveVal;
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.6),
            borderRadius: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
                context, const Icon(Icons.lock), "Password", "Password",
                (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Password can\'t be empty";
              }
              return null;
            }, (onSaveVal) {
              psswrd = onSaveVal;
            },
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.6),
                borderRadius: 10,
                obscureText: hidepsswrd,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidepsswrd = !hidepsswrd;
                      });
                    },
                    color: Colors.white.withOpacity(0.7),
                    icon: Icon(
                        hidepsswrd ? Icons.visibility_off : Icons.visibility))),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 25, top: 10),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Forget password ?',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Forget password");
                              })
                      ]),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Login",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isAPIcallProcess = true;
                  });

                  LoginRequestModel model = LoginRequestModel(
                    email: email,
                    password: psswrd,
                  );
                  LoginService.login(model).then((response) {
                    setState(() {
                      isAPIcallProcess = false;
                    });

                    if (response) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardScreen(),
                          ));
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Invalid email/password !!",
                        "OK",
                        () {
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  });
                }
              },
              btnColor: HexColor("#1C3144"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(child: OrDivider()),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: Size(100, 50)),
              icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
              label: Text("Sign up with Google"),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 25, bottom: 15),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: "Dont have an account? "),
                        TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed(
                                  '/signup',
                                );
                              })
                      ]),
                ),
              )),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  /*Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //userEmail = googleUser.email;

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }*/
}
