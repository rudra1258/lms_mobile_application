import 'package:flutter/material.dart';



class notice_and_event_screen extends StatefulWidget {
  @override
  _notice_and_event_screenState createState() => _notice_and_event_screenState();
}

class _notice_and_event_screenState extends State<notice_and_event_screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  String _selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.orange
        ),
        title: Text(
          'Notices & Events',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.orange[50],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orange,
          indicatorWeight: 3,
          tabs: [
            Tab(
              icon: Icon(Icons.announcement, color: Colors.orange),
              text: 'Notices',
            ),
            Tab(
              icon: Icon(Icons.event, color: Colors.orange),
              text: 'Events',
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSearchAndFilter(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildNoticesList(),
                _buildEventsList(),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _showAddDialog(),
      //   backgroundColor: Colors.blue[700],
      //   child: Icon(Icons.add, color: Colors.white),
      // ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search notices and events...',
              prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue[700]!),
              ),
              filled: true,
              fillColor: Colors.grey[50],
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text(
                'Filter: ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      'All',
                      'Academic',
                      'Sports',
                      'Cultural',
                      'Important'
                    ].map((filter) => _buildFilterChip(filter)).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String filter) {
    bool isSelected = _selectedFilter == filter;
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(filter),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedFilter = filter;
          });
        },
        backgroundColor: Colors.grey[100],
        selectedColor: Colors.orange[100],
        checkmarkColor: Colors.orange[700],
        labelStyle: TextStyle(
          color: isSelected ? Colors.orange[700] : Colors.grey[600],
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildNoticesList() {
    List<NoticeModel> filteredNotices = _getFilteredNotices();

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredNotices.length,
      itemBuilder: (context, index) {
        return _buildNoticeCard(filteredNotices[index]);
      },
    );
  }

  Widget _buildEventsList() {
    List<EventModel> filteredEvents = _getFilteredEvents();

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredEvents.length,
      itemBuilder: (context, index) {
        return _buildEventCard(filteredEvents[index]);
      },
    );
  }

  Widget _buildNoticeCard(NoticeModel notice) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showNoticeDetails(notice),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(notice.category),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      notice.category,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    notice.date,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                notice.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8),
              Text(
                notice.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.person, size: 16, color: Colors.grey[500]),
                  SizedBox(width: 4),
                  Text(
                    notice.author,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Spacer(),
                  if (notice.isImportant)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.priority_high,
                              size: 12, color: Colors.red[700]),
                          SizedBox(width: 2),
                          Text(
                            'Important',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.red[700],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(EventModel event) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showEventDetails(event),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(event.category),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      event.category,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: event.isUpcoming
                          ? Colors.green[100]
                          : Colors.orange[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      event.isUpcoming ? 'Upcoming' : 'Ongoing',
                      style: TextStyle(
                        fontSize: 10,
                        color: event.isUpcoming
                            ? Colors.green[700]
                            : Colors.orange[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                event.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8),
              Text(
                event.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey[500]),
                  SizedBox(width: 4),
                  Text(
                    event.date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.access_time, size: 16, color: Colors.grey[500]),
                  SizedBox(width: 4),
                  Text(
                    event.time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.location_on, size: 16, color: Colors.grey[500]),
                  SizedBox(width: 4),
                  Expanded( // adjust as needed
                    child: Text(
                      event.venue,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'academic':
        return Colors.blue[600]!;
      case 'sports':
        return Colors.green[600]!;
      case 'cultural':
        return Colors.purple[600]!;
      case 'important':
        return Colors.red[600]!;
      default:
        return Colors.grey[600]!;
    }
  }

  List<NoticeModel> _getFilteredNotices() {
    List<NoticeModel> notices = _getSampleNotices();

    if (_searchQuery.isNotEmpty) {
      notices = notices
          .where((notice) =>
      notice.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          notice.description
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()))
          .toList();
    }

    if (_selectedFilter != 'All') {
      notices = notices
          .where((notice) => notice.category == _selectedFilter)
          .toList();
    }

    return notices;
  }

  List<EventModel> _getFilteredEvents() {
    List<EventModel> events = _getSampleEvents();

    if (_searchQuery.isNotEmpty) {
      events = events
          .where((event) =>
      event.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          event.description
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()))
          .toList();
    }

    if (_selectedFilter != 'All') {
      events =
          events.where((event) => event.category == _selectedFilter).toList();
    }

    return events;
  }

  void _showNoticeDetails(NoticeModel notice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(notice.category),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        notice.category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  notice.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  notice.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.person, size: 18, color: Colors.grey[600]),
                    SizedBox(width: 8),
                    Text(
                      'Posted by: ${notice.author}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today,
                        size: 18, color: Colors.grey[600]),
                    SizedBox(width: 8),
                    Text(
                      'Date: ${notice.date}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEventDetails(EventModel event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(event.category),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        event.category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  event.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  event.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 12),
                _buildEventDetailRow(Icons.calendar_today, 'Date', event.date),
                _buildEventDetailRow(Icons.access_time, 'Time', event.time),
                _buildEventDetailRow(Icons.location_on, 'Venue', event.venue),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Registered for ${event.title}')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Register for Event',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEventDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          SizedBox(width: 8),
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New'),
          content: Text('Would you like to add a Notice or Event?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Add Notice feature would open here')),
                );
              },
              child: Text('Notice'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Add Event feature would open here')),
                );
              },
              child: Text('Event'),
            ),
          ],
        );
      },
    );
  }

  List<NoticeModel> _getSampleNotices() {
    return [
      NoticeModel(
        title: 'Mid-Semester Examination Schedule',
        description:
        'The mid-semester examinations will commence from March 15th, 2024. All students are required to check their individual exam schedules on the college portal.',
        category: 'Academic',
        author: 'Dean Academic Affairs',
        date: 'Mar 1, 2024',
        isImportant: true,
      ),
      NoticeModel(
        title: 'Annual Sports Day Registration',
        description:
        'Registration for Annual Sports Day is now open. Students can register for various sports events through the sports department.',
        category: 'Sports',
        author: 'Sports Department',
        date: 'Feb 28, 2024',
        isImportant: false,
      ),
      NoticeModel(
        title: 'Library Holiday Notice',
        description:
        'The college library will remain closed on March 8th due to International Women\'s Day celebration.',
        category: 'Important',
        author: 'Library Staff',
        date: 'Mar 5, 2024',
        isImportant: true,
      ),
      NoticeModel(
        title: 'Cultural Fest Auditions',
        description:
        'Auditions for the upcoming cultural fest will be held in the auditorium. All interested students should register.',
        category: 'Cultural',
        author: 'Cultural Committee',
        date: 'Feb 25, 2024',
        isImportant: false,
      ),
    ];
  }

  List<EventModel> _getSampleEvents() {
    return [
      EventModel(
        title: 'Tech Symposium 2024',
        description:
        'Join us for an exciting tech symposium featuring industry experts, workshops, and networking opportunities.',
        category: 'Academic',
        date: 'Mar 20, 2024',
        time: '9:00 AM - 5:00 PM',
        venue: 'Main Auditorium',
        isUpcoming: true,
      ),
      EventModel(
        title: 'Inter-College Football Championship',
        description:
        'Annual football championship featuring teams from various colleges across the state.',
        category: 'Sports',
        date: 'Mar 15, 2024',
        time: '10:00 AM - 4:00 PM',
        venue: 'Sports Ground',
        isUpcoming: true,
      ),
      EventModel(
        title: 'Cultural Night - Spring Festival',
        description:
        'An evening of music, dance, and cultural performances by talented students.',
        category: 'Cultural',
        date: 'Mar 12, 2024',
        time: '6:00 PM - 9:00 PM',
        venue: 'College Amphitheater',
        isUpcoming: false,
      ),
      EventModel(
        title: 'Career Guidance Workshop',
        description:
        'Workshop on career opportunities in emerging technologies with industry professionals.',
        category: 'Academic',
        date: 'Mar 18, 2024',
        time: '2:00 PM - 5:00 PM',
        venue: 'Conference Hall',
        isUpcoming: true,
      ),
    ];
  }
}

class NoticeModel {
  final String title;
  final String description;
  final String category;
  final String author;
  final String date;
  final bool isImportant;

  NoticeModel({
    required this.title,
    required this.description,
    required this.category,
    required this.author,
    required this.date,
    required this.isImportant,
  });
}

class EventModel {
  final String title;
  final String description;
  final String category;
  final String date;
  final String time;
  final String venue;
  final bool isUpcoming;

  EventModel({
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.time,
    required this.venue,
    required this.isUpcoming,
  });
}
