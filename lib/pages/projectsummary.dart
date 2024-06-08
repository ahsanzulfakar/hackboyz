import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackboys_app/pages/project_detailed.dart';

class ProjectSummary extends StatefulWidget {
  const ProjectSummary({super.key});

  @override
  State<ProjectSummary> createState() => _ProjectSummaryState();
}

class _ProjectSummaryState extends State<ProjectSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const NavBarWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Project Summary',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for projects',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(flex: 2, child: Text('Title', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 3, child: Text('Members', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 3, child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 2, child: Text('Target Date', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView(
                      children: const [
                        ProjectCard(
                          title: 'Tech Innovators',
                          members: ['images/picture1.jpg', 'images/profile2.jpg'],
                          status: 'In progress',
                          progress: 70,
                          targetDate: 'Jan 15',
                        ),
                        ProjectCard(
                          title: 'Green Energy Initiative',
                          members: ['images/profile3.jpg'],
                          status: 'In progress',
                          progress: 40,
                          targetDate: 'Feb 02',
                        ),
                        ProjectCard(
                          title: 'Health & Wellness Apssssp',
                          members: ['images/picture1.jpg', 'images/profile55.jpg'],
                          status: 'Backlog',
                          progress: 20,
                          targetDate: 'Mar 10',
                        ),
                        ProjectCard(
                          title: 'Community Outreach',
                          members: ['images/profile3.jpg', 'images/picture1.jpg', 'images/profile4.jpg', 'images/profile55.jpg'],
                          status: 'In progress',
                          progress: 85,
                          targetDate: 'Apr 05',
                        ),
                        ProjectCard(
                          title: 'Educational Platform',
                          members: ['images/profile2.jpg'],
                          status: 'Backlog',
                          progress: 10,
                          targetDate: 'May 20',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final List<String> members;
  final String status;
  final int progress;
  final String targetDate;

  const ProjectCard({
    super.key,
    required this.title,
    required this.members,
    required this.status,
    required this.progress,
    required this.targetDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProjectDetailed(),
                    ),
                  );
                },
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: members
                    .map((member) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(member),
                            radius: 16,
                          ),
                        ))
                    .toList(),
              ),
            ),
            Expanded(
              flex: 3, // Use the same flex value for consistent alignment
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(status),
                  const SizedBox(height: 4),
                  CustomProgressBar(progress: progress),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                targetDate,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final int progress;
  static const double maxWidth = 200.0; // Set a fixed width for the progress bar

  const CustomProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    Color getProgressColor(int progress) {
      if (progress < 30) {
        return Colors.red;
      } else if (progress < 70) {
        return Colors.yellow;
      } else {
        return Colors.green;
      }
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: maxWidth, // Use the fixed width for the progress bar container
        height: 15.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.grey[300],
        ),
        child: Stack(
          children: [
            Container(
              height: 15.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: getProgressColor(progress),
              ),
              width: (progress / 100) * maxWidth, // Adjust the width based on progress and maxWidth
            ),
            Center(
              child: Text(
                '$progress%',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "Hack Boys",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Row(
              children: <Widget>[
                TextButton(
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/homepage');
                  },
                ),
                SizedBox(width: 30.w),
                TextButton(
                  child: Text(
                    "Project Summary",
                    style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/projectsummary');
                  },
                ),
                SizedBox(width: 30.w),
                TextButton(
                  child: Text(
                    "Employee summary",
                    style: TextStyle(fontSize: 20.sp, color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/employeesummary');
                  },
                ),
                SizedBox(width: 30.w),
                const Icon(
                  Icons.account_circle_outlined,
                  size: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
