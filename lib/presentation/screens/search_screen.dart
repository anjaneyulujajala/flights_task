import 'package:devtask/presentation/screens/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedTripType = 1;
  final fromController = TextEditingController();
  final toController = TextEditingController();
  DateTime? departureDate;
  DateTime? returnDate;

  final DateFormat _dateFormat = DateFormat('EEE, dd MMM - yyyy');

  // For locations
  String _selectedLocation = "Dubai";
  final List<String> _locationOptions = ["Dubai", "New York", "London", "Paris", "Tokyo"]; // List of location options

  // For passengers
  int _selectedPassengers = 1;
  final List<int> _passengerOptions = [1, 2, 3, 4, 5];

  // For cabin class
  String _selectedCabinClass = 'Economy class';
  final List<String> _cabinClassOptions = ['Economy class', 'Business class', 'First class'];


  // Function to show the date picker and update the selected date
  Future<void> _selectDate(BuildContext context, bool isDeparture) async {
    final DateTime initialDate = DateTime.now();
    final DateTime firstDate = DateTime(2000);
    final DateTime lastDate = DateTime(2101);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isDeparture
          ? (departureDate ?? initialDate)
          : (returnDate ?? initialDate),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null &&
        picked != (isDeparture ? departureDate : returnDate)) {
      setState(() {
        if (isDeparture) {
          departureDate = picked;
        } else {
          returnDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: Text(
          "Search Flights",
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset("assets/images/search_header.png"),
                Positioned(
                  bottom: -20,
                  child: Container(
                    width: size.width - 32,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 4,
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() {
                              selectedTripType = 0;
                            }),
                            child: Container(
                              decoration: selectedTripType == 0
                                  ? BoxDecoration(
                                      color: const Color(0xff2EA446),
                                      borderRadius: BorderRadius.circular(16))
                                  : null,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: Text(
                                  "Round Trip",
                                  style: GoogleFonts.montserrat(
                                      color: selectedTripType == 0
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: selectedTripType == 0
                                          ? FontWeight.w600
                                          : null),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() {
                              selectedTripType = 1;
                            }),
                            child: Container(
                              decoration: selectedTripType == 1
                                  ? BoxDecoration(
                                      color: const Color(0xff2EA446),
                                      borderRadius: BorderRadius.circular(16))
                                  : null,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: Text(
                                  "One Way",
                                  style: GoogleFonts.montserrat(
                                      color: selectedTripType == 1
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: selectedTripType == 1
                                          ? FontWeight.w600
                                          : null),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() {
                              selectedTripType = 2;
                            }),
                            child: Container(
                              decoration: selectedTripType == 2
                                  ? BoxDecoration(
                                      color: const Color(0xff2EA446),
                                      borderRadius: BorderRadius.circular(16))
                                  : null,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: Text(
                                  "Multi-City",
                                  style: GoogleFonts.montserrat(
                                      color: selectedTripType == 2
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: selectedTripType == 2
                                          ? FontWeight.w600
                                          : null),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Transform.rotate(
                              angle: 45,
                              child: const Icon(
                                Icons.flight,
                                color: Color(0xff2EA446),
                                size: 28,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: fromController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "From",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 3,
                          margin: const EdgeInsets.fromLTRB(42, 8, 8, 8),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Color(0xff63AF23),
                            Colors.white,
                          ])),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Color(0xff2EA446),
                              size: 28,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: toController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "To",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    onTap: swapLocations,
                    child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xffECF2E7)),
                        child: const Icon(
                          Icons.swap_vert_rounded,
                          color: Color(0xff2EA446),
                          size: 32,
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context, true),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: const Color(0xff79747E)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      departureDate == null
                                          ? "Select Date"
                                          : _dateFormat.format(departureDate!),
                                      style: GoogleFonts.montserrat(
                                          color: const Color(0xff5B5B5B),
                                          fontSize: 12)),
                                  const Icon(Icons.calendar_month)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -14,
                            left: 16,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              color: const Color(0xffE9F0E4),
                              child: Text(
                                "Departure",
                                style: GoogleFonts.montserrat(
                                    color: const Color(0xff2D2D2D),
                                    fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => selectedTripType == 0 ? _selectDate(context, false) : (){},
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: selectedTripType == 0 ? const Color(0xff79747E) : const Color(0xffD4D4D4)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      returnDate == null
                                          ? "Select Date"
                                          : _dateFormat.format(returnDate!),
                                      style: GoogleFonts.montserrat(
                                          color: selectedTripType == 0 ? const Color(0xff5B5B5B) : const Color(0xffD4D4D4),
                                          fontSize: 12)),
                                  Icon(Icons.calendar_month, color: selectedTripType == 0 ? const Color(0xff5B5B5B) : const Color(0xffD4D4D4),)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -14,
                            left: 16,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              color: selectedTripType == 0 ? const Color(0xffE9F0E4) : const Color(0xffD4D4D4),
                              child: Text(
                                "Return",
                                style: GoogleFonts.montserrat(
                                    color: selectedTripType == 0 ? const Color(0xff2D2D2D) : const Color(0xffB5B5B5),
                                    fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 46,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xff79747E)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12),
                            child: DropdownButton<int>(
                              value: _selectedPassengers,
                              onChanged: (int? newValue) {
                                setState(() {
                                  _selectedPassengers = newValue!;
                                });
                              },
                              items: _passengerOptions.map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(
                                    "$value Passenger${value > 1 ? 's' : ''}",
                                    style: GoogleFonts.montserrat(
                                        color: const Color(0xff5B5B5B), fontSize: 12),
                                  ),
                                );
                              }).toList(),
                              isExpanded: true,
                              underline: Container(), // Remove underline
                              icon: const Icon(Icons.arrow_drop_down),
                              style: GoogleFonts.montserrat(color: const Color(0xff5B5B5B), fontSize: 12),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -14,
                          left: 16,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            color: const Color(0xffE9F0E4),
                            child: Text(
                              "Travelers",
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xff2D2D2D), fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 46,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xff79747E)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12),
                            child: DropdownButton<String>(
                              value: _selectedCabinClass,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCabinClass = newValue!;
                                });
                              },
                              items: _cabinClassOptions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.montserrat(
                                        color: const Color(0xff5B5B5B), fontSize: 12),
                                  ),
                                );
                              }).toList(),
                              isExpanded: true,
                              underline: Container(), // Remove underline
                              icon: const Icon(Icons.arrow_drop_down),
                              style: GoogleFonts.montserrat(color: const Color(0xff5B5B5B), fontSize: 12),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -14,
                          left: 16,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            color: const Color(0xffE9F0E4),
                            child: Text(
                              "Cabin Class",
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xff2D2D2D), fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchResultScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2EA446),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(size.width * 0.35, 46),
                  maximumSize: Size(size.width * 0.5, 46),
                ),
                child: Text(
                  "Search Flights",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                )),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Travel Inspirations",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  Container(
                    height: 46,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 12),
                      child: DropdownButton<String>(
                        value: _selectedLocation,
                        alignment: Alignment.centerRight,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedLocation = newValue!;
                          });
                        },
                        items: _locationOptions.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                                textAlign: TextAlign.end,
                                style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 17)
                            ),
                          );
                        }).toList(),
                        isExpanded: true,
                        underline: Container(), // Remove underline
                        icon: const Icon(Icons.arrow_drop_down),
                        style: GoogleFonts.montserrat(color: const Color(0xff5B5B5B), fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return index.isEven
                      ? Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                "assets/images/saudi.png",
                                width: size.width * 0.55,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "From AED867",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text("Economy round trip",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text("Saudi Arabia",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                ],
                              ),
                            )
                          ],
                        )
                      : Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                "assets/images/kuwait.png",
                                width: size.width * 0.55,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "From AED867",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text("Economy round trip",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text("Kuwait",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                ],
                              ),
                            )
                          ],
                        );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 16);
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Flight & Hotel Packages",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset("assets/images/ad.png")),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  // Method to swap the values of the two controllers
  void swapLocations() {
    String temp = fromController.text;
    fromController.text = toController.text;
    toController.text = temp;
  }
}
