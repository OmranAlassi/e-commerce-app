import 'package:clothing_store/classes/homestyle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _VisualsearchPageState();
}

class _VisualsearchPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homestyles[0].color,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 536,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(homestyles[0].image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 15),
                  Text(
                    homestyles[0].title!,
                    style: TextStyle(
                      color: homestyles[0].color,
                      fontWeight: FontWeight.w900,
                      fontSize: 48,
                    ),
                  ),
                  Text(
                    homestyles[1].title!,
                    style: TextStyle(
                      color: homestyles[0].color,
                      fontWeight: FontWeight.w900,
                      fontSize: 48,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shadowColor: WidgetStatePropertyAll(
                          homestyles[3].color,
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          homestyles[3].color,
                        ),
                        fixedSize: WidgetStatePropertyAll(
                          Size(MediaQuery.of(context).size.width * 0.45, 36),
                        ),
                      ),
                      child: Text(
                        homestyles[2].title!,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Metropolis',
                          fontWeight: FontWeight.w500,
                          color: homestyles[0].color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        homestyles[3].title!,
                        style: TextStyle(
                          color: homestyles[2].color,
                          fontWeight: FontWeight.w700,
                          fontSize: 34,
                        ),
                      ),
                      Text(
                        homestyles[4].title!,
                        style: TextStyle(
                          color: homestyles[4].color,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Metropolis',
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, top: 15),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      homestyles[5].title!,
                      style: TextStyle(
                        color: homestyles[2].color,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Metropolis',
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 270,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homestyles2.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 14, top: 18),
                    child: Stack(
                      children: [
                        Container(
                          height: 260,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: homestyles[0].color,
                            shape: BoxShape.rectangle,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Image.asset((homestyle4[1].image)),
                              SizedBox(height: 3),
                              Text(
                                homestyle5[index],
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Metropolis',
                                  color: homestyles[4].color,
                                ),
                              ),
                              Text(
                                homestyles2[index].title!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Metropolis',
                                  color: homestyles[2].color,
                                ),
                              ),
                              Text(
                                homestyle3[index].title!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Metropolis',
                                  color: homestyles[2].color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 167,
                          width: MediaQuery.of(context).size.width * 0.38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(homestyles2[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentGeometry.xy(1.04, 1.25),
                            child: Container(
                              height: 36,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    color: Color(
                                      0XFF000000,
                                    ).withValues(alpha: 0.08),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.favorite_border_rounded,
                                color: homestyles[4].color,
                                size: 15,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: 24,
                            width: MediaQuery.of(context).size.width * 0.1,
                            decoration: BoxDecoration(
                              color: homestyles[2].color,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                homestyles[6].title!,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: homestyles[0].color,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
