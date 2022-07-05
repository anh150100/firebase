import 'package:a1/controller/auth_controller.dart';
import 'package:a1/controller/google_contrller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController? _email;
  TextEditingController? _password;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    _email!.dispose();
    _password!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<AuthController>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    controller: _email,
                    validator: (val) =>
                        val!.isNotEmpty ? null : "Please enter a email address",
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    // onSaved: (input) => _email = input! as TextEditingController?,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    controller: _password,
                    validator: (val) =>
                        val!.length < 6 ? "Enter more than 6 character" : null,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    // obscureText:true,
                    // onSaved: (input) => _password = input! as TextEditingController?,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        print("Email: ${_email!.text}");
                        print("Email: ${_password!.text}");
                        await signUpProvider.signUp(
                            _email!.text.trim(), _password!.text.trim());
                      }
                    },
                    height: 60,
                    minWidth: signUpProvider.isLoading ? null : double.infinity,
                    color: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: signUpProvider.isLoading
                        ? const CircularProgressIndicator()
                        : const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ],
            ),
          ),
          Text("Or"),
          GestureDetector(
            onTap: () {
              var provider =
                  Provider.of<GoogleController>(context, listen: false);
              provider.ggLogin();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text('Google'),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
