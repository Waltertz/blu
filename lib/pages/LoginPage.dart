import 'package:amis/pages/utils/FirstoreReferences.dart';
import 'package:amis/pages/utils/studentPref/studentPref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String idScreen = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    get_token();
  }

  final TextEditingController _phoneNumber = TextEditingController();

  String countryCode = '+255';
  static bool phoneFirebaseValidatorHasError = false;
  static String phoneFieldErrorMessage = "";
  late String _token = "";
  bool isTextChanged = false;
  final Map<String, dynamic> _userData = {};
  var currentFocus;
  bool showVerificationLoader = false;
  int selectedValue = 0;
  unfocus() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  Widget _topWidget() {
    //_phoneNumber.text = "0734598207";
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Enter your phone number",
            style: TextStyle(
                fontSize: 20.0, fontFamily: "gotham_bold", color: Colors.black),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Will send verification code to this number",
            style: TextStyle(
                fontSize: 16.0,
                fontFamily: "gotham_normal",
                color: Colors.black),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          width: 350,
          height: 55,
          decoration: ShapeDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  side: BorderSide(
                      width: 2, color: Theme.of(context).primaryColor))),
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Icon(Icons.phone),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Text(countryCode, style: TextStyle(fontSize: 20)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 15.0,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            controller: _phoneNumber,
                            onChanged: (text) {
                              setState(() {
                                phoneFirebaseValidatorHasError = false;
                                if (text.length > 0) {
                                  isTextChanged = true;
                                } else {
                                  isTextChanged = false;
                                }
                              });
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                            ),
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                            maxLength: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        if (phoneFirebaseValidatorHasError)
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              phoneFieldErrorMessage,
              style: TextStyle(color: Colors.red, fontSize: 12.0),
            ),
          ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RadioListTile(
                  value: 0,
                  groupValue: selectedValue,
                  title: Text("As Student"),
                  onChanged: (value) => setState(() {
                        selectedValue = 0;
                      })),
              RadioListTile(






          /*        import 'package:flutter/material.dart';

                  void main() {
        runApp(const MaterialApp(
        title: 'Navigation Basics',
        home: FirstRoute(),
        ));
        }

            class FirstRoute extends StatelessWidget {
        const FirstRoute({super.key});

        @override
        Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
        title: const Text('First Route'),
        ),
        body: Center(
        child: ElevatedButton(
        child: const Text('Open route'),
        onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondRoute()),
        );
        },
        ),
        ),
        );
        }
        }

            class SecondRoute extends StatelessWidget {
        const SecondRoute({super.key});

        @override
        Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
        title: const Text('Second Route'),
        ),
        body: Center(
        child: ElevatedButton(
        onPressed: () {
        Navigator.pop(context);
        },
        child: const Text('Go back!'),
        ),
        ),
        );
        }
        }
*/





                  value: 1,
                  groupValue: selectedValue,
                  title: Text("As Parent"),
                  onChanged: (value) => setState(() {
                        selectedValue = 1;
                      })),
              RadioListTile(
                  value: 2,
                  groupValue: selectedValue,
                  title: Text("As Lecturer"),
                  onChanged: (value) => setState(() {
                        selectedValue = 2;
                      })



              )
            ],
          ),
        )
      ],
    );
  }

  Widget _bottomWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(),
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        Align(
          child: SizedBox(
            width: 350.0,
            height: 55.0,
            child: ElevatedButton(
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: isTextChanged ? Colors.white : Colors.black38,
                      fontFamily: 'gotham_bold'),
                ),
                onPressed: () {
                  if (!isTextChanged) {
                    setState(() {
                      phoneFirebaseValidatorHasError = true;
                      phoneFieldErrorMessage =
                          "Please provide your phone number.";
                    });
                    return;
                  }
                  String phone = _phoneNumber.text.trim();
                  if (phone.startsWith("+255")) {
                    setState(() {
                      phoneFirebaseValidatorHasError = true;
                      phoneFieldErrorMessage =
                          "The phone number you provided is invalid.";
                    });
                    return;
                  }

                  if (phone.length < 9) {
                    setState(() {
                      phoneFirebaseValidatorHasError = true;
                      phoneFieldErrorMessage =
                          "The phone number you provided is invalid.";
                    });
                    return;
                  }

                  if (phone.startsWith("0") && phone.length == 10) {
                    phone = phone.replaceRange(0, 1, "");
                  }
                  phone = countryCode.trim() + phone;

                  // unfocus();

                  _check_if_user_exists(phone);
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    elevation: isTextChanged ? 2 : 0,
                    onPrimary: Colors.white,
                    primary: isTextChanged
                        ? Palette.PrimaryColor
                        : const Color(0x0d000000))),
          ),
        )
      ],
    );
  }

  Future get_token() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      final tokenStr = token.toString();
      setState(() {
        _token = tokenStr;
        print("new token " + token!);
      });
    });
  }

  _check_if_user_exists(String phoneNumber) async {
    EasyLoading.show(
      dismissOnTap: false,
      status: 'Loging in...',
      maskType: EasyLoadingMaskType.custom,
    );
    await studentCollectionReference
        .where('phone', isEqualTo: phoneNumber)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        setState(() {
          phoneFirebaseValidatorHasError = false;
        });
        LoginUser(phoneNumber);
      } else {
        EasyLoading.dismiss();
        setState(() {
          phoneFieldErrorMessage =
              "No account is associated with this phone number please register a new account.";
          phoneFirebaseValidatorHasError = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: _topWidget(),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: _bottomWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Future LoginUser(String phoneNumber) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          Navigator.of(context)
              .pop(); //this will dismiss dialog box from CodeSent callback
          //This callback will only get called when verification is done automatically
          final result = await _auth.signInWithCredential(credential);
          User? user = result.user;

          if (user != null) {
            String doc_id;
            await studentCollectionReference
                .where('user_id', isEqualTo: user.uid)
                .get()
                .then((value) => {
                      doc_id = value.docs.single.id,
                      studentPrefData().set_doc_id(doc_id).then((value) => {
                            studentCollectionReference.doc(doc_id).set(
                                {"token": _token},
                                SetOptions(merge: true)).then(
                              (value) async => {
                                print("new token " + _token),
                                EasyLoading.dismiss(),
                              },
                            ),
                          })
                    });
          } else {
            _auth.signOut();
            EasyLoading.showError('No user with that account.');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            EasyLoading.showError('The provided phone number is not valid');
          }
        },
        timeout: Duration(seconds: 60),
        codeSent: (String verificationId, [int? forceResendingToken]) {
          _userData['verificationId'] = verificationId;
          EasyLoading.dismiss();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                contentPadding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10, right: 10),
                title: Text('Enter your verification code'),
                content: Container(
                  width: double.infinity,
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: true,
                    obscuringCharacter: '*',
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {},
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        inactiveFillColor: Colors.white,
                        inactiveColor: Palette.PrimaryColor,
                        activeFillColor: Colors.white,
                        selectedColor: Palette.PrimaryColor,
                        selectedFillColor: Colors.white),
                    cursorColor: Colors.black54,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    // errorAnimationController: errorController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (codes) async {
                      debugPrint("Completed");
                      setState(() {
                        showVerificationLoader = true;
                      });
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: _userData['verification_id'],
                              smsCode: codes);

                      try {
                        UserCredential? result =
                            await firebaseAuth.signInWithCredential(credential);
                        User? user = result.user;
                      } catch (e) {
                        setState(() {
                          showVerificationLoader = false;
                        });
                        Fluttertoast.showToast(
                            msg: "Invalid verification Code.",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
              );
            },
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          print(verificationId);
          print("Timeout");
        },
      );
      // return await driver.doc().set(driverInfo);
    } catch (e) {
      FocusScope.of(context).unfocus();
      EasyLoading.showError('${e.toString()}');
      print(e);
    }
  }
}
