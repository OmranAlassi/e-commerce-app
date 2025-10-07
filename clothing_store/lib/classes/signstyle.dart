import 'package:flutter/material.dart';

TextEditingController c1 = TextEditingController();
TextEditingController c2 = TextEditingController();
TextEditingController c3 = TextEditingController();
TextEditingController c4 = TextEditingController();
TextEditingController c5 = TextEditingController();

class Signstyle {
  Color color;
  String title;
  Signstyle({required this.color, required this.title});
}

List<Signstyle> signstyle = [
  Signstyle(color: Color(0xffDB3022), title: 'SIGN UP'),
  Signstyle(color: Color(0xffffffff), title: 'Sign up'),
  Signstyle(color: Color(0xffF01F0E), title: 'LOGIN'),
  Signstyle(color: Color(0xffffffff), title: 'Login'),
  Signstyle(color: Color(0XFF2AA952), title: 'Forgot password'),
  Signstyle(
    color: Color(0xffffffff),
    title:
        'Please, enter your email address. You will receive a link to create a new password via email.',
  ),
  Signstyle(
    color: Color(0xffffffff),
    title: 'Not a valid address. Should be your@email.com',
  ),
  Signstyle(color: Color(0xffffffff), title: 'SEND'),
];
List<Signstyle> signstyle2 = [
  Signstyle(color: Color(0xffF9F9F9), title: 'Name'),
  Signstyle(color: Color(0xff000000).withValues(alpha: 0.05), title: 'Email'),
  Signstyle(color: Color(0xff222222), title: 'Password'),
  Signstyle(color: Color(0xff9B9B9B), title: 'Already have an account?'),
  Signstyle(color: Color(0xff2D2D2D), title: 'Or sign up with social account'),
  Signstyle(color: Color(0xff2D2D2D), title: 'Forgot your password?'),
  Signstyle(color: Color(0xff2D2D2D), title: 'Or login with social account'),
];

List<Widget> textfield = [
  Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
    child: Container(
      height: 64,
      decoration: BoxDecoration(
        color: signstyle[1].color,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 8,
            color: signstyle2[1].color,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4),
              child: Text(
                signstyle2[0].title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Metropolis',
                  color: signstyle2[3].color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              onChanged: (value) {},
              controller: c1,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500,
                color: signstyle2[4].color,
              ),
              cursorHeight: 15,
              cursorColor: signstyle2[3].color,
              cursorWidth: 1.5,
              autofocus: false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.check_rounded, size: 20),
                suffixIconColor: signstyle[4].color,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: signstyle[1].color),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: signstyle[1].color),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),

  Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
    child: Container(
      height: 64,
      decoration: BoxDecoration(
        color: signstyle[1].color,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 8,
            color: signstyle2[1].color,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4),
              child: Text(
                signstyle2[1].title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Metropolis',
                  color: signstyle2[3].color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              onChanged: (value) {},
              controller: c2,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500,
                color: signstyle2[4].color,
              ),
              cursorHeight: 15,
              cursorColor: signstyle2[3].color,
              cursorWidth: 1.5,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: signstyle[1].color),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: signstyle[1].color),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),

  Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
    child: Container(
      height: 64,
      decoration: BoxDecoration(
        color: signstyle[1].color,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 8,
            color: signstyle2[1].color,
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {},
        controller: c3,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Metropolis',
          fontWeight: FontWeight.w500,
          color: signstyle2[4].color,
        ),
        cursorHeight: 15,
        cursorColor: signstyle2[3].color,
        cursorWidth: 1.5,
        autofocus: false,
        showCursor: false,
        obscureText: true,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hint: Padding(
            padding: const EdgeInsets.only(left: 10, top: 4),
            child: Text(
              signstyle2[2].title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Metropolis',
                color: signstyle2[3].color,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: signstyle[1].color),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: signstyle[1].color),
          ),
        ),
      ),
    ),
  ),

  Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 4),
          child: Text(
            signstyle2[1].title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              fontFamily: 'Metropolis',
              color: signstyle[2].color,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextField(
          onChanged: (value) {},
          controller: c4,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w500,
            color: signstyle2[4].color,
          ),
          cursorHeight: 15,
          cursorColor: signstyle2[3].color,
          cursorWidth: 1.5,
          textInputAction: TextInputAction.send,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            suffix: Icon(Icons.close, color: signstyle[2].color),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: signstyle[2].color),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: signstyle[2].color),
            ),
          ),
        ),
      ],
    ),
  ),

  Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
    child: Container(
      height: 64,
      decoration: BoxDecoration(
        color: signstyle[1].color,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 8,
            color: signstyle2[1].color,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4),
              child: Text(
                signstyle2[1].title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Metropolis',
                  color: signstyle2[3].color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextField(
              onChanged: (value) {},
              controller: c5,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500,
                color: signstyle2[4].color,
              ),
              cursorHeight: 15,
              cursorColor: signstyle2[3].color,
              cursorWidth: 1.5,
              autofocus: false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.check_rounded, size: 20),
                suffixIconColor: signstyle[4].color,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: signstyle[1].color),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: signstyle[1].color),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
];
