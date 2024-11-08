import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 4,
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/flight_logo.png",
                      height: 32,
                      width: 32,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Onward - Garuda Indonesia",
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "AED 409",
                      style: GoogleFonts.montserrat(
                          color: const Color(0xff2EA446),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "14:35",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          "BLR - Bengaluru",
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/flight_divider.png",
                          scale: 3,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "4h 30m",
                          style: GoogleFonts.montserrat(),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "14:35",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          "DXB - Dubai",
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "2 Stops",
                  style: GoogleFonts.montserrat(),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color(0xffC8C8C8),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/flight_logo.png",
                      height: 32,
                      width: 32,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Onward - Garuda Indonesia",
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "AED 409",
                      style: GoogleFonts.montserrat(
                          color: const Color(0xff2EA446),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "14:35",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          "BLR - Bengaluru",
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/flight_divider.png",
                          scale: 3,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "4h 30m",
                          style: GoogleFonts.montserrat(),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "14:35",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          "DXB - Dubai",
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final boxWidth = constraints.constrainWidth();
                const dashWidth = 10.0;
                const dashHeight = 1.5;
                final dashCount = (boxWidth / (2 * dashWidth)).floor();
                return Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: List.generate(dashCount, (_) {
                    return const SizedBox(
                      width: dashWidth,
                      height: dashHeight,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xffC8C8C8)),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff63AF23)
                      ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text("Cheapest", style: GoogleFonts.montserrat(color: const Color(0xff63AF23), fontSize: 10),),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xff1673E1)
                      ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text("Refundable", style: GoogleFonts.montserrat(color: const Color(0xff1673E1), fontSize: 10),),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text("Flight Details", style: GoogleFonts.montserrat(color: const Color(0xffFA7927), fontWeight: FontWeight.w600),),
                    const SizedBox(width: 4,),
                    const Icon(Icons.keyboard_arrow_down, color: Color(0xffFA7927))
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
