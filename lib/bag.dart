import 'package:clothing_store/classes/bagstyle.dart';
import 'package:clothing_store/classes/categoriestyle.dart';
import 'package:clothing_store/classes/homestyle.dart';
import 'package:clothing_store/classes/signstyle.dart';
import 'package:flutter/material.dart';

TextEditingController e1 = TextEditingController();

class Bag extends StatefulWidget {
  const Bag({super.key});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        backgroundColor: categoriestyles[0].color,

        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ),
        ],
      ),
      backgroundColor: Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                bagstyles[0].title,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Metropolis',
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bagstyles3.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16, right: 14, left: 14),
                  child: Container(
                    height: 104,
                    width: MediaQuery.of(context).size.width * 0.92,
                    decoration: BoxDecoration(
                      color: bagstyles3[0].color,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 104,
                          width: MediaQuery.of(context).size.width * 0.27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            image: DecorationImage(
                              image: AssetImage(bagstyles2[index].image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bagstyles3[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Metropolis',
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Color:',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Metropolis',
                                      color: bagstyles[2].color,
                                    ),
                                  ),

                                  Text(
                                    titles[index],
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Metropolis',
                                      color: bagstyles[0].color,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Text(
                                    'Size:',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Metropolis',
                                      color: bagstyles[2].color,
                                    ),
                                  ),
                                  Text(
                                    titles2[index],
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Metropolis',
                                      color: bagstyles[0].color,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        number <= 0 ? number = 0 : number--;
                                      });
                                    },
                                    child: Container(
                                      height: 36,
                                      margin: EdgeInsets.only(top: 12),
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.1,
                                      decoration: BoxDecoration(
                                        color: bagstyles3[0].color,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            color: Color(
                                              0xff000000,
                                            ).withValues(alpha: 0.1),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 18,
                                        ),
                                        child: Icon(
                                          Icons.minimize,
                                          color: bagstyles[2].color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text('$number'),
                                  SizedBox(width: 12),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        number++;
                                      });
                                    },
                                    child: Container(
                                      height: 36,
                                      margin: EdgeInsets.only(top: 12),
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.1,
                                      decoration: BoxDecoration(
                                        color: bagstyles3[0].color,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            color: Color(
                                              0xff000000,
                                            ).withValues(alpha: 0.1),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: bagstyles[2].color,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(flex: 20),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Icon(
                                Icons.more_vert_sharp,
                                size: 20,
                                color: bagstyles[2].color,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 38),
                              child: Text(
                                bagstyles2[index].title,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Metropolis',
                                  color: bagstyles[0].color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 1),
                      color: Color(0XFF000000).withValues(alpha: 0.05),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: TextField(
                  onChanged: (value) {},
                  controller: e1,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w500,
                    color: signstyle2[4].color,
                  ),
                  cursorColor: signstyle2[3].color,
                  cursorWidth: 1.5,
                  autofocus: false,
                  showCursor: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.arrow_circle_right,
                      size: 40,
                      color: bagstyles[0].color,
                    ),
                    hint: Text(
                      bagstyles[3].title,
                      style: TextStyle(
                        color: bagstyles[3].color,
                        fontFamily: 'Metropolis',
                        fontSize: 13,
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
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Text(
                    bagstyles[4].title,
                    style: TextStyle(
                      color: bagstyles[3].color,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(flex: 12),
                  Text(
                    bagstyles[2].title,
                    style: TextStyle(
                      color: bagstyles[0].color,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    e1.clear();
                  },
                  style: ButtonStyle(
                    shadowColor: WidgetStatePropertyAll(homestyles[4].color),
                    backgroundColor: WidgetStatePropertyAll(signstyle[0].color),
                    fixedSize: WidgetStatePropertyAll(
                      Size(MediaQuery.of(context).size.width * 0.91, 48),
                    ),
                  ),
                  child: Text(
                    bagstyles[1].title,
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
            ),
          ],
        ),
      ),
    );
  }
}
