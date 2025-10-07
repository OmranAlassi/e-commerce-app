import 'package:clothing_store/classes/homestyle.dart';
import 'package:clothing_store/classes/routes.dart';
import 'package:flutter/material.dart';
import 'classes/signstyle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: signstyle[1].color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 8, right: 8),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: signstyle2[2].color,
            ),
          ),
        ),
        toolbarHeight: 90,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  signstyle[3].title,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Metropolis',
                  ),
                ),
              ),
              SizedBox(height: 55),
              textfield[4],
              textfield[2],
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(flex: 10),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.forgotpassword);
                    },
                    child: Text(
                      signstyle2[5].title,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.w600,
                        color: signstyle2[2].color,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.009),
                  Icon(
                    Icons.arrow_right_alt_rounded,
                    color: signstyle[0].color,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.035),
                ],
              ),

              SizedBox(height: 28),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.navegator);
                    c3.clear();
                  },
                  style: ButtonStyle(
                    shadowColor: WidgetStatePropertyAll(homestyles[4].color),
                    backgroundColor: WidgetStatePropertyAll(signstyle[0].color),
                    fixedSize: WidgetStatePropertyAll(
                      Size(MediaQuery.of(context).size.width * 0.91, 48),
                    ),
                  ),
                  child: Text(
                    signstyle[2].title,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w500,
                      color: signstyle[1].color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 155),
              Center(
                child: Text(
                  signstyle2[6].title,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w600,
                    color: signstyle2[2].color,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 2),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      elevation: 0,
                    ),
                    child: Container(
                      height: 64,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        color: signstyle[1].color,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 8,
                            color: signstyle2[1].color,
                          ),
                        ],
                      ),
                      child: Image.asset('assets/images/Group.png'),
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.035),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      elevation: 0,
                    ),
                    child: Container(
                      height: 64,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        color: signstyle[1].color,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 8,
                            color: signstyle2[1].color,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/iconfinder_square-facebook_317727.png',
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
