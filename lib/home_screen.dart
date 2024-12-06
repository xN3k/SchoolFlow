import 'package:flutter/material.dart';
import 'package:schoolflow/dashboard_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // List of images and labels for the grid
  final List<Map<String, String>> dashboardItems = [
    {"imgPath": "images/student.png", "name": "Students"},
    {"imgPath": "images/teacher.png", "name": "Teachers"},
    {"imgPath": "images/attendance.png", "name": "Attendance"},
    {"imgPath": "images/syllabus.png", "name": "Syllabus"},
    {"imgPath": "images/calendar.png", "name": "Time Table"},
    {"imgPath": "images/assignment.png", "name": "Assignments"},
    {"imgPath": "images/exam.png", "name": "Exams"},
    {"imgPath": "images/result.png", "name": "Results"},
    {"imgPath": "images/fees.png", "name": "Fees"},
    {"imgPath": "images/event.png", "name": "Events"},
    {"imgPath": "images/mail.png", "name": "Inbox"},
    {"imgPath": "images/doubt.png", "name": "Ask Doubt"},
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the number of columns dynamically
    final int crossAxisCount = screenWidth > 600 ? 4 : 3;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text(
              'Aadarsha Chaudhary',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Searchbox section
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Academics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Gridview
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: dashboardItems.length,
              itemBuilder: (context, index) {
                final item = dashboardItems[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(item['name']!),
                        content: const Text('You tapped this item.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: DashboardCard(
                    name: item['name']!,
                    imgPath: item['imgPath']!,
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'E-Learning',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'E-Learning Section',
                  style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
