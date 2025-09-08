// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class manage_leaves_screen extends StatefulWidget {
//   const manage_leaves_screen({super.key});
//
//   @override
//   State<manage_leaves_screen> createState() => _manage_leaves_screenState();
// }
//
// class _manage_leaves_screenState extends State<manage_leaves_screen> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//
//   /// Sample events map
//   Map<DateTime, List<String>> events = {
//     DateTime.utc(2023, 1, 10): ["Approved"],
//     DateTime.utc(2023, 1, 15): ["Declined"],
//     DateTime.utc(2023, 1, 20): ["Pending"],
//   };
//
//   List<String> _getEventsForDay(DateTime day) {
//     return events[DateTime.utc(day.year, day.month, day.day)] ?? [];
//   }
//
//   Color _getEventColor(String status) {
//     switch (status) {
//       case "Pending":
//         return Colors.orange;
//       case "Approved":
//         return Colors.green;
//       case "Declined":
//         return Colors.red;
//       case "Cancelled":
//         return Colors.grey;
//       default:
//         return Colors.transparent;
//     }
//   }
//
//   /// ================== APPLY LEAVE FORM ==================
//   void _openApplyLeaveForm() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => const ApplyLeaveForm(),
//     );
//   }
//
//   /// ================== LEAVE DETAILS POPUP ==================
//   void _openLeaveDetails(DateTime date, String status) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => LeaveDetailCard(date: date, status: status),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Leave"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           TableCalendar(
//             focusedDay: _focusedDay,
//             firstDay: DateTime.utc(2020, 1, 1),
//             lastDay: DateTime.utc(2030, 12, 31),
//             calendarFormat: _calendarFormat,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             onDaySelected: (selectedDay, focusedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//                 _focusedDay = focusedDay;
//               });
//
//               if (_getEventsForDay(selectedDay).isNotEmpty) {
//                 _openLeaveDetails(
//                     selectedDay, _getEventsForDay(selectedDay).first);
//               }
//             },
//             onFormatChanged: (format) {
//               setState(() {
//                 _calendarFormat = format;
//               });
//             },
//             eventLoader: _getEventsForDay,
//             calendarStyle: const CalendarStyle(
//               markerDecoration: BoxDecoration(shape: BoxShape.circle),
//             ),
//             calendarBuilders: CalendarBuilders(
//               markerBuilder: (context, date, events) {
//                 if (events.isEmpty) return null;
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: events
//                       .map((e) => Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 1),
//                     width: 8,
//                     height: 8,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: _getEventColor(e.toString()), // ✅ fixed
//                     ),
//                   ))
//                       .toList(),
//                 );
//               },
//             ),
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Align(
//               alignment: Alignment.bottomRight,
//               child: FloatingActionButton(
//                 onPressed: _openApplyLeaveForm,
//                 child: const Icon(Icons.add),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// ================== APPLY LEAVE FORM WIDGET ==================
// class ApplyLeaveForm extends StatefulWidget {
//   const ApplyLeaveForm({super.key});
//
//   @override
//   State<ApplyLeaveForm> createState() => _ApplyLeaveFormState();
// }
//
// class _ApplyLeaveFormState extends State<ApplyLeaveForm> {
//   String leaveType = "Sick Leave";
//   DateTime? startDate;
//   DateTime? endDate;
//   final TextEditingController reasonController = TextEditingController();
//   bool isHalfDay = false;
//
//   Future<void> _pickDate(BuildContext context, bool isStart) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStart) {
//           startDate = picked;
//         } else {
//           endDate = picked;
//         }
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//       EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             DropdownButtonFormField<String>(
//               value: leaveType,
//               items: const [
//                 DropdownMenuItem(value: "Sick Leave", child: Text("Sick Leave")),
//                 DropdownMenuItem(
//                     value: "Casual Leave", child: Text("Casual Leave")),
//                 DropdownMenuItem(
//                     value: "Earned Leave", child: Text("Earned Leave")),
//               ],
//               onChanged: (val) {
//                 setState(() {
//                   leaveType = val!;
//                 });
//               },
//               decoration: const InputDecoration(labelText: "Select Leave Type"),
//             ),
//             const SizedBox(height: 16),
//             ListTile(
//               title: Text(
//                   "Start Date: ${startDate != null ? startDate.toString().split(' ')[0] : "Select"}"),
//               trailing: const Icon(Icons.calendar_today),
//               onTap: () => _pickDate(context, true),
//             ),
//             ListTile(
//               title: Text(
//                   "End Date: ${endDate != null ? endDate.toString().split(' ')[0] : "Select"}"),
//               trailing: const Icon(Icons.calendar_today),
//               onTap: () => _pickDate(context, false),
//             ),
//             TextField(
//               controller: reasonController,
//               decoration: const InputDecoration(
//                 labelText: "Reason for Leave",
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 3,
//             ),
//             const SizedBox(height: 16),
//             CheckboxListTile(
//               title: const Text("Is Half Day Leave?"),
//               value: isHalfDay,
//               onChanged: (val) {
//                 setState(() {
//                   isHalfDay = val ?? false;
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text("Cancel"),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text("Apply"),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /// ================== LEAVE DETAILS CARD ==================
// class LeaveDetailCard extends StatelessWidget {
//   final DateTime date;
//   final String status;
//
//   const LeaveDetailCard({
//     super.key,
//     required this.date,
//     required this.status,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Card(
//         elevation: 3,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Sick Leave", style: Theme.of(context).textTheme.titleLarge),
//               const SizedBox(height: 8),
//               Chip(
//                 label: Text(status),
//                 backgroundColor: status == "Pending"
//                     ? Colors.orange
//                     : status == "Approved"
//                     ? Colors.green
//                     : status == "Declined"
//                     ? Colors.red
//                     : Colors.grey,
//               ),
//               const SizedBox(height: 16),
//               Text("Start Date: ${date.toString().split(' ')[0]}"),
//               Text(
//                   "End Date: ${date.add(const Duration(days: 1)).toString().split(' ')[0]}"),
//               const Text("Half Day: No"),
//               const SizedBox(height: 10),
//               const Text("Reason: I am not able to join due to bad health."),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () {},
//                       child: const Text("Cancel"),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text("Close"),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
