import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String cityName = "Jakarta";
    int currTemp = 32;
    int maxTemp = 35;
    int minTemp = 31;
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                        horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.bars,
                              color: isDarkMode ? Colors.white : Colors.white,
                            ),
                            Align(
                              child: Text(
                                "Weather App",
                                style: GoogleFonts.questrial(
                                  color: isDarkMode ? Colors.white : Colors.brown,
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.circlePlus,
                              color: isDarkMode ? Colors.white : Colors.black,
                            )
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: size.height * 0.03,),
                        child: Align(
                          child: Text(
                            cityName,
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: size.height * 0.005,),
                        child: Align(
                          child: Text(
                            "Hari ini",
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black54,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top:size.height * 0.03),
                        child: Align(
                          child: Text(
                            "$currTemp°C",
                            style: GoogleFonts.questrial(
                              color: currTemp <= 0 ? Colors.blue :
                              currTemp > 0 && currTemp <= 20 ? Colors.indigo :
                              currTemp > 21 && currTemp < 32 ? Colors.deepPurple :
                              Colors.pink,
                              fontSize: size.height * 0.04,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.grey[900] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Align(
                                child: Text(
                                  "Forecast for today",
                                  style: GoogleFonts.questrial(
                                    fontSize: size.height * 0.025,
                                    color: isDarkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  forecastColumn("Now", "2°C", Icons.wb_sunny, "20 km/h", "0%"),
                                  forecastColumn("15:00", "1°C", Icons.cloud, "10 km/h", "40%"),
                                  forecastColumn("16:00", "0°C", Icons.cloud_queue, "25 km/h", "80%"),
                                  forecastColumn("17:00", "-2°C", Icons.ac_unit, "28 km/h", "60%"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.grey[900] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Align(
                                child: Text(
                                  "7-day Forecast",
                                  style: GoogleFonts.questrial(
                                    fontSize: size.height * 0.025,
                                    color: isDarkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),

                              forecastRow("Today", "32°C", Icons.wb_sunny, "40%"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget forecastColumn(String time, String temp, IconData icon, String wind, String rainChance) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Column(
      children: [
        Text(
          time,
          style: GoogleFonts.questrial(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: size.height * 0.02,
          ),
        ),
        Icon(
          icon,
          color: isDarkMode ? Colors.white : Colors.black,
          size: size.height * 0.04,
        ),
        Text(
          temp,
          style: GoogleFonts.questrial(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: size.height * 0.02,
          ),
        ),
        Text(
          wind,
          style: GoogleFonts.questrial(
            color: isDarkMode ? Colors.white : Colors.black54,
            fontSize: size.height * 0.018,
          ),
        ),
        Icon(
          FontAwesomeIcons.umbrella,  // Umbrella icon for rain chance
          color: Colors.blueAccent,
          size: size.height * 0.035,
        ),
        Text(
          rainChance,
          style: GoogleFonts.questrial(
            color: Colors.blueAccent,
              fontSize: size.height * 0.021,
              ),
        ),
      ],
    );
  }


  Widget forecastRow(String day, String temp, IconData icon, String rainChance) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: GoogleFonts.questrial(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: size.height * 0.02,
          ),
        ),
        Icon(
          icon,
          color: isDarkMode ? Colors.white : Colors.black,
          size: size.height * 0.04,
        ),
        Text(
          temp,
          style: GoogleFonts.questrial(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: size.height * 0.02,
          ),
        ),
        Text(
          rainChance,
          style: GoogleFonts.questrial(
            color: Colors.blueAccent,
            fontSize: size.height * 0.02,
          ),
        ),
      ],
    );
  }
}
