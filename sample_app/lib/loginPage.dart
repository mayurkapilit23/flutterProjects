import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_app/homePage.dart';
import 'package:sample_app/widgets/custome_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;

    print('Email: $email');
    print('Password: $password');
    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Invalid Name!!!')));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              HomePage(name: _nameController.text.toString().trim()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/car_svg.svg',
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Text(
                    "CarPoolin",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Join today to unlock",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "100+ travels everyday!",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 30,
                children: [
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: _emailController,

                    hintText: "Email",
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextField(
                    controller: _passwordController,

                    hintText: "Password",
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),

                  CustomTextField(
                    controller: _nameController,

                    hintText: "Name",
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),

                  CustomTextField(
                    controller: _surnameController,

                    hintText: "Surname",
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),

                  CustomTextField(
                    controller: _phoneController,
                    hintText: "Phone",
                    obscureText: false,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),

            GestureDetector(
              onTap: () {
                _login();
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Start',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
