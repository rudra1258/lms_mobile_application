import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Odisha +3 Syllabus',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SyllabusPage(),
//       debugShowCheckedModeBanner: false,
//     );

//   }
// }

class new_syllabus_screen extends StatefulWidget {
  @override
  State<new_syllabus_screen> createState() => _new_syllabus_screenState();
}

class _new_syllabus_screenState extends State<new_syllabus_screen> {
  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'Odia',
      'code': 'ODI-101',
      'credits': 4,
      'units': ['Modern Literature', 'Classical Poetry', 'Grammar', 'Culture']
    },
    {
      'name': 'English',
      'code': 'ENG-101',
      'credits': 4,
      'units': ['Prose & Poetry', 'Grammar', 'Communication', 'Literature']
    },
    {
      'name': 'Physics',
      'code': 'PHY-101',
      'credits': 6,
      'units': ['Mechanics', 'Thermodynamics', 'Optics', 'Modern Physics']
    },
    {
      'name': 'Chemistry',
      'code': 'CHE-101',
      'credits': 6,
      'units': ['Organic', 'Inorganic', 'Physical', 'Analytical']
    },
    {
      'name': 'Mathematics',
      'code': 'MAT-101',
      'credits': 6,
      'units': ['Calculus', 'Algebra', 'Trigonometry', 'Geometry']
    },
    {
      'name': 'Biology',
      'code': 'BIO-101',
      'credits': 6,
      'units': ['Cell Biology', 'Genetics', 'Ecology', 'Physiology']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        title: Text(
          'Syllabus',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.orange[50],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'First Year - Semester I',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return _buildSubjectCard(context, subjects[index]);
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Text(
                'Total Credits: ${subjects.fold(0, (sum, s) => sum + (s['credits'] as int))}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard(BuildContext context, Map<String, dynamic> subject) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(
          subject['name'],
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              '${subject['code']} • ${subject['credits']} Credits',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubjectDetailPage(subject: subject),
            ),
          );
        },
      ),
    );
  }
}

class SubjectDetailPage extends StatelessWidget {
  final Map<String, dynamic> subject;

  SubjectDetailPage({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject['name']),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject Info
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject['name'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Course Code: ${subject['code']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Credits: ${subject['credits']}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Units
            Text(
              'Course Units',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: subject['units'].length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        'Unit ${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(subject['units'][index]),
                    ),
                  );
                },
              ),
            ),

            // Assessment
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assessment',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Theory Exam: 70%'),
                  Text('Internal Assessment: 20%'),
                  Text('Practical: 10%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
