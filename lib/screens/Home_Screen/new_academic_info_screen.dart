import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class new_academic_info_screen extends StatefulWidget {
  @override
  _new_academic_info_screenState createState() => _new_academic_info_screenState();
}

class _new_academic_info_screenState extends State<new_academic_info_screen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CoursesPage(),
    ResultsPage(),
    ExamPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.deepOrange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Exams',
          ),
        ],
      ),
    );
  }
}

// Data Models
class Course {
  final String code;
  final String name;
  final int credits;
  final String instructor;
  final String semester;
  final List<String> schedule;

  Course({
    required this.code,
    required this.name,
    required this.credits,
    required this.instructor,
    required this.semester,
    required this.schedule,
  });
}

class Result {
  final String courseCode;
  final String courseName;
  final String semester;
  final int marks;
  final String grade;
  final double gpa;

  Result({
    required this.courseCode,
    required this.courseName,
    required this.semester,
    required this.marks,
    required this.grade,
    required this.gpa,
  });
}

class Exam {
  final String courseCode;
  final String courseName;
  final DateTime date;
  final String time;
  final String venue;
  final String type;
  final String status;

  Exam({
    required this.courseCode,
    required this.courseName,
    required this.date,
    required this.time,
    required this.venue,
    required this.type,
    required this.status,
  });
}

// Sample Data
class AcademicData {
  static final List<Course> courses = [
    Course(
      code: 'ODI-101',
      name: 'Odia Literature',
      credits: 4,
      instructor: 'Dr. Pratima Mishra',
      semester: 'Semester I',
      schedule: ['Mon 9:00 AM', 'Wed 9:00 AM', 'Fri 9:00 AM'],
    ),
    Course(
      code: 'ENG-101',
      name: 'English Communication',
      credits: 4,
      instructor: 'Prof. Sarah Johnson',
      semester: 'Semester I',
      schedule: ['Tue 10:00 AM', 'Thu 10:00 AM', 'Sat 10:00 AM'],
    ),
    Course(
      code: 'PHY-101',
      name: 'Physics Fundamentals',
      credits: 6,
      instructor: 'Dr. Rajesh Kumar',
      semester: 'Semester I',
      schedule: ['Mon 11:00 AM', 'Wed 11:00 AM', 'Fri 11:00 AM'],
    ),
    Course(
      code: 'CHE-101',
      name: 'General Chemistry',
      credits: 6,
      instructor: 'Dr. Priya Sharma',
      semester: 'Semester I',
      schedule: ['Tue 2:00 PM', 'Thu 2:00 PM', 'Sat 2:00 PM'],
    ),
    Course(
      code: 'MAT-101',
      name: 'Mathematics',
      credits: 6,
      instructor: 'Prof. Anil Patel',
      semester: 'Semester I',
      schedule: ['Mon 2:00 PM', 'Wed 2:00 PM', 'Fri 2:00 PM'],
    ),
  ];

  static final List<Result> results = [
    Result(
        courseCode: 'ODI-100',
        courseName: 'Odia Literature',
        semester: 'Previous Sem',
        marks: 85,
        grade: 'A',
        gpa: 8.5),
    Result(
        courseCode: 'ENG-100',
        courseName: 'English Communication',
        semester: 'Previous Sem',
        marks: 78,
        grade: 'B+',
        gpa: 7.8),
    Result(
        courseCode: 'PHY-100',
        courseName: 'Physics Basics',
        semester: 'Previous Sem',
        marks: 92,
        grade: 'A+',
        gpa: 9.2),
    Result(
        courseCode: 'CHE-100',
        courseName: 'Chemistry Basics',
        semester: 'Previous Sem',
        marks: 88,
        grade: 'A',
        gpa: 8.8),
    Result(
        courseCode: 'MAT-100',
        courseName: 'Basic Mathematics',
        semester: 'Previous Sem',
        marks: 95,
        grade: 'A+',
        gpa: 9.5),
  ];

  static final List<Exam> exams = [
    Exam(
      courseCode: 'ODI-101',
      courseName: 'Odia Literature',
      date: DateTime(2024, 12, 15),
      time: '9:00 AM - 12:00 PM',
      venue: 'Hall A',
      type: 'Final Exam',
      status: 'Upcoming',
    ),
    Exam(
      courseCode: 'ENG-101',
      courseName: 'English Communication',
      date: DateTime(2024, 12, 17),
      time: '9:00 AM - 12:00 PM',
      venue: 'Hall B',
      type: 'Final Exam',
      status: 'Upcoming',
    ),
    Exam(
      courseCode: 'PHY-101',
      courseName: 'Physics Fundamentals',
      date: DateTime(2024, 12, 20),
      time: '2:00 PM - 5:00 PM',
      venue: 'Lab 1',
      type: 'Final Exam',
      status: 'Upcoming',
    ),
    Exam(
      courseCode: 'CHE-101',
      courseName: 'General Chemistry',
      date: DateTime(2024, 11, 25),
      time: '9:00 AM - 11:00 AM',
      venue: 'Hall C',
      type: 'Mid-term',
      status: 'Completed',
    ),
    Exam(
      courseCode: 'MAT-101',
      courseName: 'Mathematics',
      date: DateTime(2024, 12, 22),
      time: '9:00 AM - 12:00 PM',
      venue: 'Hall A',
      type: 'Final Exam',
      status: 'Upcoming',
    ),
  ];
}

// Courses Page
class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        title: Text(
          'My Courses',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.orange[50],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Semester',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: AcademicData.courses.length,
                itemBuilder: (context, index) {
                  final course = AcademicData.courses[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                course.code,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                              Text(
                                '${course.credits} Credits',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            course.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Instructor: ${course.instructor}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Schedule: ${course.schedule.join(', ')}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Total Credits: ${AcademicData.courses.fold(0, (sum, course) => sum + course.credits)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Results Page
class ResultsPage extends StatelessWidget {

  Future<void> _openResultsWebsite() async {
    final url = Uri.parse('https://www.samsodisha.gov.in');
    try {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalGPA =
        AcademicData.results.fold(0.0, (sum, result) => sum + result.gpa) /
            AcademicData.results.length;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        title: Text(
          'Academic Results',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.orange[50],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                children: [
                  Text(
                    'Overall GPA',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    totalGPA.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openResultsWebsite,
                icon: Icon(Icons.web),
                label: Text('View Official Results Online'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[900],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Previous Semester Results',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: AcademicData.results.length,
                itemBuilder: (context, index) {
                  final result = AcademicData.results[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(
                        result.courseName,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle:
                      Text('${result.courseCode} • ${result.semester}'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            result.grade,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _getGradeColor(result.grade),
                            ),
                          ),
                          Text(
                            '${result.marks}/100',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A+':
        return Colors.green.shade700;
      case 'A':
        return Colors.green;
      case 'B+':
        return Colors.orange;
      case 'B':
        return Colors.orange.shade700;
      default:
        return Colors.red;
    }
  }
}

// Exam Page
class ExamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final upcomingExams =
    AcademicData.exams.where((exam) => exam.status == 'Upcoming').toList();
    final completedExams =
    AcademicData.exams.where((exam) => exam.status == 'Completed').toList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        title: Text(
          'Exam Schedule',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.orange[50],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Exams',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              ...upcomingExams.map((exam) => _buildExamCard(exam, true)),
              SizedBox(height: 24),
              Text(
                'Completed Exams',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              ...completedExams.map((exam) => _buildExamCard(exam, false)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExamCard(Exam exam, bool isUpcoming) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      color: isUpcoming ? Colors.blue.shade50 : Colors.grey.shade50,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  exam.courseCode,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isUpcoming ? Colors.blue.shade700 : Colors.grey[600],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isUpcoming ? Colors.orange : Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    exam.type,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              exam.courseName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  _formatDate(exam.date),
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  exam.time,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  exam.venue,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
