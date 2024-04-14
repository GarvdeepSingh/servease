import 'package:servease/consts/consts.dart';

class authscreen1 extends StatelessWidget {
  const authscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg-login.png"),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
