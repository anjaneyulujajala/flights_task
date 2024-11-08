import 'package:devtask/presentation/widgets/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        title: Text(
          "Ezy Travel",
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 4,
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: Column(
                children: [
                  Text(
                    "BLR - Bengaluru to DXB - Dubai",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Departure: Sat, 23 Mar - Return: Sat, 23 Mar",
                    style: GoogleFonts.montserrat(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "(Round Trip)",
                        style: GoogleFonts.montserrat(
                            color: const Color(0xffFA7927)),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Modify Search",
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff2EA446)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0xffC8C8C8),
                    indent: 16,
                    endIndent: 16,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Sort",
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff434343),
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      Text(
                        "Non - Stop",
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff434343),
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      Text(
                        "Filter",
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff434343),
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xff79747E)),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Text(
                          "Mar 22 - Mar 23",
                          style: GoogleFonts.montserrat(
                              fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("From AED 741",
                            style: GoogleFonts.montserrat(
                              fontSize: 11,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xff2EA446)),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Text(
                          "Mar 22 - Mar 23",
                          style: GoogleFonts.montserrat(
                              fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("From AED 721",
                            style: GoogleFonts.montserrat(
                              fontSize: 11,
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xff79747E)),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Text(
                          "Mar 22 - Mar 23",
                          style: GoogleFonts.montserrat(
                              fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text("From AED 750",
                            style: GoogleFonts.montserrat(
                              fontSize: 11,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "851 Flight Found",
                style: GoogleFonts.montserrat(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                return SearchResultItem();
              }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 16,
                  );
              },),
            )
          ],
        ),
      ),
    );
  }
}
