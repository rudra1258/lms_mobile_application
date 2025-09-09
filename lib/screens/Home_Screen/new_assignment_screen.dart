import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Assignment Management',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: AssignmentHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class new_assignment_screen extends StatefulWidget {
  @override
  _new_assignment_screenState createState() => _new_assignment_screenState();
}

class _new_assignment_screenState extends State<new_assignment_screen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ProjectScreen(),
    AssignmentScreen(),
    DueAssignmentScreen(),
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
            icon: Icon(Icons.folder_open),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Assignments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Due Soon',
          ),
        ],
      ),
    );
  }
}

// Data Models
class Project {
  final String id;
  final String title;
  final String course;
  final String description;
  final DateTime startDate;
  final DateTime dueDate;
  final String status;
  final int progress;
  final List<String> members;

  Project({
    required this.id,
    required this.title,
    required this.course,
    required this.description,
    required this.startDate,
    required this.dueDate,
    required this.status,
    required this.progress,
    required this.members,
  });
}

class Assignment {
  final String id;
  final String title;
  final String course;
  final String instructor;
  final DateTime assignedDate;
  final DateTime dueDate;
  final String status;
  final String priority;
  final String? submissionLink;

  Assignment({
    required this.id,
    required this.title,
    required this.course,
    required this.instructor,
    required this.assignedDate,
    required this.dueDate,
    required this.status,
    required this.priority,
    this.submissionLink,
  });
}

// Sample Data
class AssignmentData {
  static List<Project> projects = [
    Project(
      id: 'P001',
      title: 'Physics Lab Report',
      course: 'Physics',
      description:
      'Complete analysis of pendulum motion experiment with calculations and graphs',
      startDate: DateTime(2024, 11, 1),
      dueDate: DateTime(2024, 12, 15),
      status: 'In Progress',
      progress: 60,
      members: ['You', 'Rahul Kumar', 'Priya Singh'],
    ),
    Project(
      id: 'P002',
      title: 'Chemistry Research Project',
      course: 'Chemistry',
      description:
      'Study of organic compounds and their reactions in daily life applications',
      startDate: DateTime(2024, 10, 15),
      dueDate: DateTime(2024, 12, 20),
      status: 'In Progress',
      progress: 35,
      members: ['You', 'Anita Patel'],
    ),
    Project(
      id: 'P003',
      title: 'Mathematics Problem Set',
      course: 'Mathematics',
      description: 'Solve complex calculus problems and prepare presentation',
      startDate: DateTime(2024, 11, 5),
      dueDate: DateTime(2025, 1, 10),
      status: 'Not Started',
      progress: 0,
      members: ['You'],
    ),
  ];

  static List<Assignment> assignments = [
    Assignment(
      id: 'A001',
      title: 'Odia Essay Writing',
      course: 'Odia Literature',
      instructor: 'Dr. Pratima Mishra',
      assignedDate: DateTime(2024, 11, 10),
      dueDate: DateTime(2024, 12, 1),
      status: 'Submitted',
      priority: 'Medium',
      submissionLink: 'essay_submission.pdf',
    ),
    Assignment(
      id: 'A002',
      title: 'English Grammar Exercise',
      course: 'English',
      instructor: 'Prof. Sarah Johnson',
      assignedDate: DateTime(2024, 11, 15),
      dueDate: DateTime(2024, 12, 5),
      status: 'In Progress',
      priority: 'Low',
    ),
    Assignment(
      id: 'A003',
      title: 'Physics Numerical Problems',
      course: 'Physics',
      instructor: 'Dr. Rajesh Kumar',
      assignedDate: DateTime(2024, 11, 20),
      dueDate: DateTime(2024, 12, 8),
      status: 'Pending',
      priority: 'High',
    ),
    Assignment(
      id: 'A004',
      title: 'Chemical Equations Balancing',
      course: 'Chemistry',
      instructor: 'Dr. Priya Sharma',
      assignedDate: DateTime(2024, 11, 18),
      dueDate: DateTime(2024, 12, 3),
      status: 'Pending',
      priority: 'High',
    ),
    Assignment(
      id: 'A005',
      title: 'Calculus Problem Solving',
      course: 'Mathematics',
      instructor: 'Prof. Anil Patel',
      assignedDate: DateTime(2024, 11, 25),
      dueDate: DateTime(2024, 12, 12),
      status: 'In Progress',
      priority: 'Medium',
    ),
  ];

  static List<Assignment> getDueAssignments() {
    final now = DateTime.now();
    return assignments.where((assignment) {
      final daysUntilDue = assignment.dueDate.difference(now).inDays;
      return daysUntilDue <= 7 && assignment.status != 'Submitted';
    }).toList();
  }
}

// Project Screen
class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        title: Text(
          'Projects',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.orange[50],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Active Projects (${AssignmentData.projects.length})',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: AssignmentData.projects.length,
                itemBuilder: (context, index) {
                  final project = AssignmentData.projects[index];
                  return _buildProjectCard(context, project);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Project project) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  project.course,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(project.status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    project.status,
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
              project.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              project.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Progress: ${project.progress}%',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: project.progress / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.group, size: 16, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  'Members: ${project.members.join(', ')}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  'Due: ${_formatDate(project.dueDate)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'in progress':
        return Colors.orange;
      case 'not started':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

// Assignment Screen
class AssignmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        title: Text(
          'Assignment',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.orange[50],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Assignments (${AssignmentData.assignments.length})',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: AssignmentData.assignments.length,
                itemBuilder: (context, index) {
                  final assignment = AssignmentData.assignments[index];
                  return _buildAssignmentCard(assignment);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentCard(Assignment assignment) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          assignment.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text('Course: ${assignment.course}'),
            Text('Instructor: ${assignment.instructor}'),
            Text('Due: ${_formatDate(assignment.dueDate)}'),
            if (assignment.submissionLink != null)
              Text(
                'Submitted: ${assignment.submissionLink}',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(assignment.status),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                assignment.status,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: _getPriorityColor(assignment.priority),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                assignment.priority,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'submitted':
        return Colors.green;
      case 'in progress':
        return Colors.orange;
      case 'pending':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red.shade700;
      case 'medium':
        return Colors.orange.shade700;
      case 'low':
        return Colors.green.shade700;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

// Due Assignment Screen
class DueAssignmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dueAssignments = AssignmentData.getDueAssignments();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        title: Text(
          'Due Soon',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.orange[50],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.red),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Urgent Attention Required',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade700,
                        ),
                      ),
                      Text(
                        '${dueAssignments.length} assignments due within 7 days',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Due This Week',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: dueAssignments.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle,
                        size: 64, color: Colors.green),
                    SizedBox(height: 16),
                    Text(
                      'All caught up!',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    Text(
                      'No assignments due this week',
                      style: TextStyle(
                          fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                itemCount: dueAssignments.length,
                itemBuilder: (context, index) {
                  final assignment = dueAssignments[index];
                  return _buildDueAssignmentCard(assignment);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDueAssignmentCard(Assignment assignment) {
    final daysUntilDue = assignment.dueDate.difference(DateTime.now()).inDays;
    final isOverdue = daysUntilDue < 0;

    return Card(
      margin: EdgeInsets.only(bottom: 12),
      color: isOverdue ? Colors.red.shade50 : Colors.orange.shade50,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: isOverdue ? Colors.red : Colors.orange,
          child: Text(
            isOverdue ? '!' : '${daysUntilDue + 1}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          assignment.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text('Course: ${assignment.course}'),
            Text('Instructor: ${assignment.instructor}'),
            Text(
              isOverdue
                  ? 'OVERDUE by ${(-daysUntilDue)} day(s)'
                  : 'Due in ${daysUntilDue + 1} day(s)',
              style: TextStyle(
                color: isOverdue ? Colors.red : Colors.orange.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getPriorityColor(assignment.priority),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                assignment.priority,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              _formatDate(assignment.dueDate),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red.shade700;
      case 'medium':
        return Colors.orange.shade700;
      case 'low':
        return Colors.green.shade700;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
