import 'package:a1/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class Wapper extends StatefulWidget {
  const Wapper({key}) : super(key: key);

  @override
  State<Wapper> createState() => _WapperState();
}

class _WapperState extends State<Wapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset(
              "assets/images/undraw_access_account_re_8spm.svg",
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width - 20,
            ),
            Row(children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text('Login'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text('Sign Up'),
                  ),
                ),
              ),
            ]),
            Center(
              child: Text('Or'),
            ),
            GestureDetector(
              onTap: () {},
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
      ),
    );
  }
}
