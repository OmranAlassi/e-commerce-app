import 'package:clothing_store/classes/homestyle.dart';
import 'package:clothing_store/classes/signstyle.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                  signstyle[4].title,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Metropolis',
                  ),
                ),
              ),
              SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 5),
                child: Text(
                  signstyle[5].title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Metropolis',
                  ),
                ),
              ),
              textfield[3],
              Center(
                child: Text(
                  signstyle[6].title,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Metropolis',
                    color: signstyle[2].color,
                  ),
                ),
              ),

              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shadowColor: WidgetStatePropertyAll(homestyles[4].color),
                    backgroundColor: WidgetStatePropertyAll(signstyle[0].color),
                    fixedSize: WidgetStatePropertyAll(
                      Size(MediaQuery.of(context).size.width * 0.91, 48),
                    ),
                  ),
                  child: Text(
                    signstyle[7].title,
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
            ],
          ),
        ],
      ),
    );
  }
}
