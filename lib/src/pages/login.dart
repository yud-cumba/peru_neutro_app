import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peru_neutro/src/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  var _errorText;

  void initState() {
    _errorText = '';
    super.initState();
  }

  void validateAndSave() {
    if (_password.text == 'codegirl') {
      Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      setState(() {
        _errorText = 'Error de contraseña';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'assets/images/login.svg',
        ),
        // Image(
        //       height: 300,
        //       image: AssetImage(
        //         'assets/images/codegirl.png',
        //       ),
        //     ),
        myTextField(_email, 'EMAIL', 'correo@email.com'),
        myTextField(_password, 'CONTRASEÑA', '********'),
        myButton('MIDE TU HUELLA DE CARBONO', validateAndSave),
        errorText(_errorText)
      ],
    )));
  }
}

Widget errorText(text) {
  return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Text(text, style: TextStyle(fontSize: 15, color: Colors.red)));
}

Widget myButton(title, pressed) {
  final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      )));
  return ElevatedButton(
    child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Text(title, style: TextStyle(fontSize: 18))),
    style: buttonStyle,
    onPressed: () {
      pressed();
    },
  );
}

Widget myTextField(value, label, hintText) {
  return Container(
      margin: new EdgeInsets.all(20.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: value,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      hintText: hintText),
                ))
          ]));
}
