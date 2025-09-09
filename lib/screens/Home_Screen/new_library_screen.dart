import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Library Management',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: LibraryHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class new_library_screen extends StatefulWidget {
  @override
  _new_library_screenState createState() => _new_library_screenState();
}

class _new_library_screenState extends State<new_library_screen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    SearchBooksPage(),
    IssuedBooksPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.deepOrange,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Books',
          ),
        ],
      ),
    );
  }
}

class Book {
  final String id;
  final String title;
  final String author;
  final String category;
  final bool isAvailable;
  final String? issuedTo;
  final DateTime? issueDate;
  final DateTime? returnDate;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    this.isAvailable = true,
    this.issuedTo,
    this.issueDate,
    this.returnDate,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? category,
    bool? isAvailable,
    String? issuedTo,
    DateTime? issueDate,
    DateTime? returnDate,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      category: category ?? this.category,
      isAvailable: isAvailable ?? this.isAvailable,
      issuedTo: issuedTo ?? this.issuedTo,
      issueDate: issueDate ?? this.issueDate,
      returnDate: returnDate ?? this.returnDate,
    );
  }
}

class LibraryData {
  static List<Book> books = [
    Book(
        id: 'B001',
        title: 'Physics Fundamentals',
        author: 'Dr. Smith',
        category: 'Science'),
    Book(
        id: 'B002',
        title: 'Advanced Mathematics',
        author: 'Prof. Johnson',
        category: 'Mathematics'),
    Book(
        id: 'B003',
        title: 'Odia Literature',
        author: 'Kalindi Charan',
        category: 'Literature'),
    Book(
        id: 'B004',
        title: 'English Grammar',
        author: 'Wren & Martin',
        category: 'Language'),
    Book(
        id: 'B005',
        title: 'Chemistry Basics',
        author: 'Dr. Brown',
        category: 'Science'),
    Book(
        id: 'B006',
        title: 'Biology Today',
        author: 'Prof. Wilson',
        category: 'Science'),
    Book(
        id: 'B007',
        title: 'Indian History',
        author: 'R.S. Sharma',
        category: 'History'),
    Book(
        id: 'B008',
        title: 'Computer Programming',
        author: 'John Doe',
        category: 'Technology'),
  ];

  static List<Book> getAvailableBooks() {
    return books.where((book) => book.isAvailable).toList();
  }

  static List<Book> getIssuedBooks() {
    return books.where((book) => !book.isAvailable).toList();
  }

  static void issueBook(String bookId, String studentName) {
    final index = books.indexWhere((book) => book.id == bookId);
    if (index != -1) {
      books[index] = books[index].copyWith(
        isAvailable: false,
        issuedTo: studentName,
        issueDate: DateTime.now(),
        returnDate: DateTime.now().add(Duration(days: 14)),
      );
    }
  }

  static void returnBook(String bookId) {
    final index = books.indexWhere((book) => book.id == bookId);
    if (index != -1) {
      books[index] = books[index].copyWith(
        isAvailable: true,
        issuedTo: null,
        issueDate: null,
        returnDate: null,
      );
    }
  }
}

class SearchBooksPage extends StatefulWidget {
  @override
  _SearchBooksPageState createState() => _SearchBooksPageState();
}

class _SearchBooksPageState extends State<SearchBooksPage> {
  String searchQuery = '';
  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = LibraryData.getAvailableBooks();
  }

  void _filterBooks(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredBooks = LibraryData.getAvailableBooks();
      } else {
        filteredBooks = LibraryData.getAvailableBooks()
            .where((book) =>
        book.title.toLowerCase().contains(query.toLowerCase()) ||
            book.author.toLowerCase().contains(query.toLowerCase()) ||
            book.category.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _issueBook(Book book) {
    showDialog(
      context: context,
      builder: (context) {
        String studentName = '';
        return AlertDialog(
          title: Text('Issue Book'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Book: ${book.title}'),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  studentName = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (studentName.isNotEmpty) {
                  LibraryData.issueBook(book.id, studentName);
                  Navigator.pop(context);
                  _filterBooks(searchQuery);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Book issued successfully!')),
                  );
                }
              },
              child: Text('Issue'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        title: Text(
          'Library',
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
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search books by title, author, or category...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: _filterBooks,
            ),
            SizedBox(height: 16),
            Text(
              'Available Books (${filteredBooks.length})',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(
                        book.title,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Author: ${book.author}'),
                          Text('Category: ${book.category}'),
                          Text('ID: ${book.id}'),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () => _issueBook(book),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Issue'),
                      ),
                      isThreeLine: true,
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
}

class IssuedBooksPage extends StatefulWidget {
  @override
  _IssuedBooksPageState createState() => _IssuedBooksPageState();
}

class _IssuedBooksPageState extends State<IssuedBooksPage> {
  List<Book> issuedBooks = [];

  @override
  void initState() {
    super.initState();
    _loadIssuedBooks();
  }

  void _loadIssuedBooks() {
    setState(() {
      issuedBooks = LibraryData.getIssuedBooks();
    });
  }

  void _returnBook(Book book) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Return Book'),
          content: Text('Are you sure you want to return "${book.title}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                LibraryData.returnBook(book.id);
                Navigator.pop(context);
                _loadIssuedBooks();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Book returned successfully!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('Return'),
            ),
          ],
        );
      },
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }

  bool _isOverdue(DateTime? returnDate) {
    if (returnDate == null) return false;
    return DateTime.now().isAfter(returnDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.orange
        ),
        title: Text(
          'My Books',
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
          children: [
            Text(
              'Issued Books (${issuedBooks.length})',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: issuedBooks.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book_outlined,
                        size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No books issued',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                itemCount: issuedBooks.length,
                itemBuilder: (context, index) {
                  final book = issuedBooks[index];
                  final isOverdue = _isOverdue(book.returnDate);

                  return Card(
                    margin: EdgeInsets.only(bottom: 8),
                    color: isOverdue ? Colors.red.shade50 : null,
                    child: ListTile(
                      title: Text(
                        book.title,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Author: ${book.author}'),
                          Text('Issued to: ${book.issuedTo}'),
                          Text(
                              'Issue Date: ${_formatDate(book.issueDate)}'),
                          Text(
                            'Return Date: ${_formatDate(book.returnDate)}',
                            style: TextStyle(
                              color: isOverdue ? Colors.red : null,
                              fontWeight:
                              isOverdue ? FontWeight.bold : null,
                            ),
                          ),
                          if (isOverdue)
                            Text(
                              'OVERDUE',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () => _returnBook(book),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Return'),
                      ),
                      isThreeLine: true,
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
}
