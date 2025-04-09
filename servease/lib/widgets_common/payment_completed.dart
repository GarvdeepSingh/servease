import 'package:flutter/material.dart';
import 'package:servease/widgets_common/booking_details.dart';

class PaymentCompleted extends StatefulWidget {
  const PaymentCompleted({super.key});

  @override
  State<PaymentCompleted> createState() => _PaymentCompletedState();
}

class _PaymentCompletedState extends State<PaymentCompleted> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BookingDetailsScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(38),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFEE9A1),
              ),
              child: Container(
                padding: const EdgeInsets.all(38),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xBFF8C648),
                ),
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 38,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Service Booked",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: "uber",
              ),
            )
          ],
        ),
      ),
    );
  }
}
