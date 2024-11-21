import 'package:servease/consts/consts.dart';

class BookingProgressCard extends StatelessWidget {
  const BookingProgressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFDBDBDB),
        borderRadius: BorderRadius.circular(33),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFDBDBDB),
            blurRadius: 9.9,
            offset: const Offset(-2, 3),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Image.asset("assets/images/delivery_man.png"),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 14,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFEFEBEB),
                  borderRadius: BorderRadius.circular(23),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFDBDBDB),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Text(
                  "Arriving to you soon",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: "uber",
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 38,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Text(
                  "Time",
                  style: TextStyle(
                    fontFamily: "uber",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF9A7E7E),
                          width: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: -12,
                      right: 8,
                      child: Text(
                        "24:45",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 42,
                          fontFamily: "pro-bold",
                        ),
                        softWrap: false,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
