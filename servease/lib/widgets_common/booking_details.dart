import 'package:flutter/material.dart';
import 'package:servease/views/home/get_lat_long.dart';
import 'package:servease/views/home/home.dart';
import 'package:servease/widgets_common/progress_card.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GetLatLongScreen(),
            ),
          ),
          icon: Icon(Icons.adaptive.arrow_back_outlined),
          color: Colors.black,
        ),
        title: Text(
          "Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'uber',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Help",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.red,
                fontFamily: "uber",
              ),
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          BookingProgressCard(),
          const SizedBox(
            height: 32,
          ),
          SummaryWidget()
        ],
      ),
    );
  }
}

class SummaryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      tilePadding: EdgeInsets.zero,
      title: Text(
        "Summary",
      ),
      children: [
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Deepak Kumar',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(Icons.star, color: Colors.amber, size: 18);
                      }),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // Service Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AC service',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '₹ 2,500',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(),
                SizedBox(height: 8),
                buildDetailsRow('Subtotal', '₹ 2,500'),
                SizedBox(height: 8),
                buildDetailsRow('Promo - (FIRST11)', '-₹ 150.5'),
                SizedBox(height: 8),
                buildDetailsRow('Taxes', '₹ 100.5'),
                SizedBox(height: 8),
                buildDetailsRow('Coins', '-₹ 80.6'),
                SizedBox(height: 8),
                Divider(),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₹ 2,369.4',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     // Header Row
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(
    //           'Summary',
    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //         ),
    //         Icon(Icons.keyboard_arrow_down),
    //       ],
    //     ),
    //     SizedBox(height: 16),

    //     // Customer Name and Rating

    //   ],
    // );
  }

  Widget buildDetailsRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        Text(value, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
      ],
    );
  }
}
