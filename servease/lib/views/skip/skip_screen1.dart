// ignore: unused_import
import 'package:get/get.dart';
import 'package:servease/consts/consts.dart';
// ignore: unused_import
import 'package:servease/views/auth/auth_s1.dart';
import 'package:servease/views/auth/wrapper.dart';
// ignore: unused_import
import 'package:servease/views/skip/skip_screen.dart';

class onboard extends StatefulWidget {
  const onboard({super.key});

  @override
  State<onboard> createState() => __onboardState();
}

class __onboardState extends State<onboard> {
  List onboarddata = [
    {
      "image": para1,
      "title": "Every service",
      "description":
          "Everyday services at any\n hour at your doorstep one\n click away!"
    },
    {
      "image": para,
      "title": "Affordable rates",
      "description": "Serivces at your local rates with\n facility to bargain"
    },
    {
      "image": para2,
      "title": "Start Today!",
      "description": "Start with us today!"
    },
  ];

  PageController pageController = PageController();

  continuemethod() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const mywrapper()),
        (Route<dynamic> route) => false);
  }

  int currentpage = 0;
  onchanged(int index) {
    setState(() {
      currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10),
            child: TextButton(
                onPressed: continuemethod,
                child: Text(
                  'skip',
                  style: TextStyle(color: color1, fontSize: 20),
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: onboarddata.length,
            onPageChanged: onchanged,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  50.heightBox,
                  Image.asset(onboarddata[index]['image']),
                  10.heightBox,
                  Text(
                    onboarddata[index]['title'],
                    style: const TextStyle(
                      fontSize: 50,
                      color: color1,
                      fontWeight: FontWeight.normal,
                      fontFamily: ba,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    onboarddata[index]['description'],
                    style: const TextStyle(
                      fontSize: 20,
                      color: color1,
                      fontWeight: FontWeight.bold,
                      fontFamily: ak,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                (currentpage == (onboarddata.length - 1))
                    ? ElevatedButton(
                        onPressed: continuemethod,
                        child: const Text('continue'),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List<Widget>.generate(onboarddata.length, (index) {
                          return AnimatedContainer(
                            duration: const Duration(
                              microseconds: 200,
                            ),
                            height: 10,
                            width: (index == currentpage) ? 15 : 10,
                            margin: const EdgeInsetsDirectional.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == currentpage) ? color2 : color3,
                            ),
                          );
                        }),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
