import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/auth.dart';
import '../services/text_field.dart';


class Managersignup extends StatefulWidget {
  const Managersignup({Key? key}) : super(key: key);

  @override
  _ManagersignupState createState() => _ManagersignupState();
}

class _ManagersignupState extends State<Managersignup> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController Name =
  new TextEditingController();
  TextEditingController email =
  new TextEditingController();
  TextEditingController contactNo =
  new TextEditingController();
  TextEditingController password =
  new TextEditingController();

  // Add Panel

  addPanel() async {
    try {
      if (formKey.currentState!.validate()) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Row(
                  children: [
                    new CircularProgressIndicator(),
                    SizedBox(
                      width: 25.0,
                    ),
                    new Text("Loading, Please wait"),
                  ],
                ),
              ),
            );
          },
        );
        await AuthService()
            .AddManager(
            Name.text,
            email.text,
            contactNo.text,
            password.text,
            'manager')
            .then((value) {
          if (value != null) {
            value.sendEmailVerification().then((value) async {
              // await AuthData().addSlot(5, tchremailEditingController.text);
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Managersignup(),
                ),
              );
              Fluttertoast.showToast(
                  msg: "Signup Sucessfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.green,
                  fontSize: 16.0);
            });
          } else {
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: "Panel already exist",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.red,
                fontSize: 16.0);
          }
        }).catchError((e) {
          Navigator.pop(context);
          print(e.toString());
          Fluttertoast.showToast(
              msg: e.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      }
    } catch (e) {
      Navigator.pop(context);
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('Manager Signup'),
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/choose_field/bg.jpg'),
                fit: BoxFit.cover
            )
        ),
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[

            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller:Name,
                            validator: (val) {
                              return val!.isEmpty || val.length < 3
                                  ? "Enter Name 3+ characters"
                                  : null;
                            },
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.lightBlueAccent,
                              ),
                              hintText: 'Name',
                              border: InputBorder.none,
                            ),

                          ),
                        ),

                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.lightBlueAccent,
                              ),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                            controller: email,
                            //style: TextStyle(color: Colors.black, fontSize: 16),
                            validator: (val) {
                              return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                                  ? null
                                  : "Enter Correct Email";
                            },
                          ),
                        ),
                        //SizedBox(height: 8.0),

                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: contactNo,
                            maxLength: 11,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone,
                                color: Colors.lightBlueAccent,
                              ),
                              hintText: 'Contact Number',
                              //labelText: 'like sp18-bse-b10-042',
                              border: InputBorder.none,
                            ),
                            //cursorColor: Colors.black26,

                            style: TextStyle(color: Colors.black, fontSize: 16),
                            validator: (val) {
                              return val!.length != 11
                                  ? "Phone # be like 03000000000"
                                  : null;
                            },
                          ),
                        ),
                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: password,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.password,
                                color: Colors.lightBlueAccent,
                              ),
                              hintText: 'Password',
                              // labelText: 'like sp18-bse-b10-042',
                              border: InputBorder.none,
                            ),
                            //controller: userpasswordEditingController,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            validator: (val) {
                              return val!.length < 6
                                  ? "Enter Password 6+ characters"
                                  : null;
                            },
                            obscureText: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40),
                              color: Colors.green,
                              onPressed: () {
                                addPanel();
                              },
                              child: Text(
                                'Sign UP',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
