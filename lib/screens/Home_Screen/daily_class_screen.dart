import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';

class daily_class_screen extends StatefulWidget {
  const daily_class_screen({Key? key}) : super(key: key);

  @override
  State<daily_class_screen> createState() => _daily_class_screenState();
}

class _daily_class_screenState extends State<daily_class_screen> {
  int selectedIndex = 0;
  bool isSunday = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("_______________ date ${DateTime.now().weekday}");
    if(DateTime.now().weekday == 7){
      print("sunday");
      setState(() {
        isSunday = true;
      });
    }else{
      print("other than sunday");
      setState(() {
        isSunday = false;
      });
    }
  }


  final List<String> weekdays = ["Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // extendBodyBehindAppBar: true, // Image goes behind AppBar

      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        title: Text(
          'Your Classes',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.orange[50],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Stack(
        children: [
          // Background Image with opacity
          // Opacity(
          //   opacity: 0.3,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage("assets/img/Picsart_25-08-21_15-14-30-585.jpg"),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),

          // Foreground Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // space below AppBar
              SizedBox(height: kToolbarHeight + 30),

              HorizontalWeekCalendar(
                borderRadius: BorderRadius.circular(10),
                activeBackgroundColor: Colors.blue,
                inactiveTextColor: Colors.black,
                scrollPhysics: BouncingScrollPhysics(),
                monthColor: Colors.orange,
                showNavigationButtons: false,
                showTopNavbar: true,
                minDate: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day - 10,
                ),
                initialDate:DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                ),
                maxDate: DateTime(
                  DateTime.now().year,
                  DateTime.now().month + 1,
                  DateTime.now().day ,
                ),
                onDateChange: (date) {
                  setState(() {
                    print("Date selected: ${date.weekday}");
                    print("Date selected: ${date.weekday.runtimeType}");

                    if(date.weekday == 7){
                      print("sunday");
                      setState(() {
                        isSunday = true;
                      });
                      print("is sunday - $isSunday");
                    }else{
                      print("other than sunday");
                      setState(() {
                        isSunday = false;
                      });
                      print("is sunday - $isSunday");
                    }

                  });
                },
              ),
              SizedBox(height: 10),

              // Clickable Horizontal date selector
              // SizedBox(
              //   height: 110,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 7,
              //     padding: EdgeInsets.symmetric(horizontal: 12),
              //     itemBuilder: (context, index) {
              //       bool isSelected = index == selectedIndex;
              //       return GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             selectedIndex = index; // update selected index
              //           });
              //         },
              //         child: Container(
              //           width: 64,
              //           margin: EdgeInsets.only(right: 8, top: 8, bottom: 8),
              //           decoration: BoxDecoration(
              //             color: isSelected ? Colors.blue : Colors.grey.shade200,
              //             borderRadius: BorderRadius.circular(10),
              //             border: isSelected ? Border.all(color: Colors.blueAccent, width: 1) : null,
              //           ),
              //           padding: EdgeInsets.symmetric(vertical: 8),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 "Sep",
              //                 style: TextStyle(
              //                   color: isSelected ? Colors.white : Colors.black,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               SizedBox(height: 4),
              //               Text(
              //                 "${3 + index}",
              //                 style: TextStyle(
              //                   color: isSelected ? Colors.white : Colors.black,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               SizedBox(height: 2),
              //               Text(
              //                 weekdays[index],
              //                 style: TextStyle(
              //                   color: isSelected ? Colors.white : Colors.black,
              //                   fontSize: 12,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),

              // Timeline / Routine
              
              isSunday?_buildHoliday(context):_buildPeriodSection(context)
              
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodSection(context){
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          RoutineTile(
            time: "10:00 AM\n10:45 AM",
            title: "First Period",
            subject: "English",
            teacher: "Prof. David Johnson",
            color: Color(0xFF42A5F5),
          ),
          RoutineTile(
            time: "11:00 AM\n11:45 AM",
            title: "Second Period",
            subject: "Computer Science",
            teacher: "Prof. David Johnson",
            color: Color(0xFF42A5F5),
          ),
          RoutineTile(
            time: "12:00 PM\n12:45 PM",
            title: "Third Period",
            subject: "Mechanics",
            teacher: "Prof. David Johnson",
            color: Color(0xFF42A5F5),
          ),
          RoutineTile(
            time: "1:00 PM\n2:00 PM",
            title: "Lunch Break",
            subject: "Break Time",
            teacher: "",
            color: Color(0xFFFBC02D),
            isBreak: true,
          ),
          RoutineTile(
            time: "2:00 PM\n3:00 PM",
            title: "Fourth Period",
            subject: "Edusport",
            teacher: "Prof. David Johnson",
            color: Color(0xFF78909C),
          ),
        ],
      ),
    );
  }

  Widget _buildHoliday(context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
            child: Image.asset("assets/img/daily_class/happy-sunday_1286238-4060.jpg")
        ),
      ),
    );
  }

}

// ----------------- Routine Tile -----------------
class RoutineTile extends StatelessWidget {
  final String time;
  final String title;
  final String subject;
  final String teacher;
  final Color color;
  final bool isBreak;

  const RoutineTile({
    Key? key,
    required this.time,
    required this.title,
    required this.subject,
    required this.teacher,
    required this.color,
    this.isBreak = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time column
        SizedBox(
          width: 70,
          child: Text(
            time,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),

        // Timeline dot + line
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 2,
              height: 60,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        SizedBox(width: 10),

        // Subject card
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 4),
                Text(subject,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                if (!isBreak) ...[
                  SizedBox(height: 4),
                  Text(teacher,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      )),
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}


