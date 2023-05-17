import 'package:flutter/material.dart';
import 'package:mmom/sign_in_class.dart';

import 'component.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _obscureText = true;
  bool _check = false;



  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Container(
      decoration: const BoxDecoration(
          // image:  DecorationImage(image: AssetImage('assets/images/1.png'),
          //  fit: BoxFit.cover),

          ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff57c0ff),
                Colors.blue,
              ],
            ),
          ),
          alignment: AlignmentDirectional.topCenter,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextFormField(
                  obscureText: false,
                  hint: 'enter your user name',
                  label: 'user name',
                  suffixOnPressed: () {},
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  validate: emptyValidate,
                ),
                const SizedBox(height: 20),
                MyTextFormField(
                  label: 'Password',
                  hint: 'enter your password',
                  suffixIcon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.white,
                  ),
                  suffixOnPressed: () {
                    _obscureText = !_obscureText;
                    setState(() {});
                  },
                  prefixIcon: const Icon(
                    Icons.vpn_key_rounded,
                    color: Colors.white,
                  ),
                  controller: _passwordController,
                  inputType: TextInputType.emailAddress,
                  obscureText: _obscureText,
                  validate: emptyValidate,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: _check,
                        // activeColor:Colors.white ,

                        onChanged: (not) {
                          _check = !_check;
                          setState(() {});
                        }),
                    const Text(
                      'remmeber me?',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MyMaterialButton(
                  width: 240,
                  text: 'Confirm',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    }},
                ),

                const SizedBox(height: 15),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 1,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child: Text("OR",style: TextStyle(color: Colors.white),),
                      ),
                      Container(
                        width: 100,
                        height: 1,
                        color: Colors.white,
                      ),
                    ],
                ),
                const SizedBox(height: 15),
                MyMaterialButton(

                    width: 240, text: "Login with Google", onPressed: signIn),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Login();
                          }));
                        },
                        child: const Text(
                          'register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? emptyValidate(String? value) {
    if (value!.isEmpty){
      return "can't be empty";
    }
    else
    {
      return null;
    }
  }

  Future signIn() async {
    await GoogleSignInApi.login();
  }
}
