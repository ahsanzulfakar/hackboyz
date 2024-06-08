import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Summary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmployeeSummary(),
    );
  }
}

class EmployeeSummary extends StatefulWidget {
  const EmployeeSummary({super.key});

  @override
  State<EmployeeSummary> createState() => _EmployeeSummaryState();
}

class _EmployeeSummaryState extends State<EmployeeSummary> {
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
                    'Employee Summary',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for employees...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(flex: 2, child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 3, child: Text('Role', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 2, child: Text('Date of Joining', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 3, child: Text('Projects', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 2, child: Text('Utilization', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 2, child: Text('Billed', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView(
                      children: const [
                        EmployeeCard(
                          profileImage: 'images/profile4.jpg',
                          name: 'Katie Smith',
                          role: 'Senior Designer',
                          dateOfJoining: 'Jan 1, 2020',
                          projects: 'Project A, Project B',
                          utilization: 80,
                          billed: 100,
                          employeeID: 'E001',
                          tasks: 'Design UI, Review UX',
                          projectStatus: 'Ongoing',
                        ),
                        EmployeeCard(
                          profileImage: 'images/profile2.jpg',
                          name: 'Jared Williams',
                          role: 'Product Manager',
                          dateOfJoining: 'Mar 15, 2019',
                          projects: 'Project C, Project D',
                          utilization: 90,
                          billed: 95,
                          employeeID: 'E002',
                          tasks: 'Plan Sprint, Manage Backlog',
                          projectStatus: 'Ongoing',
                        ),
                        EmployeeCard(
                          profileImage: 'images/profile55.jpg',
                          name: 'Tiffany Johnson',
                          role: 'Software Engineer',
                          dateOfJoining: 'Nov 2, 2021',
                          projects: 'Project E, Project F',
                          utilization: 70,
                          billed: 85,
                          employeeID: 'E003',
                          tasks: 'Develop Features, Fix Bugs',
                          projectStatus: 'Ongoing',
                        ),
                        EmployeeCard(
                          profileImage: 'images/picture1.jpg',
                          name: 'Chris Davis',
                          role: 'Marketing Specialist',
                          dateOfJoining: 'Jul 10, 2018',
                          projects: 'Project G, Project H',
                          utilization: 85,
                          billed: 90,
                          employeeID: 'E004',
                          tasks: 'Create Campaigns, Analyze Data',
                          projectStatus: 'Ongoing',
                        ),
                        EmployeeCard(
                          profileImage: 'images/profile2.jpg',
                          name: 'Brandon Lee',
                          role: 'Data Analyst',
                          dateOfJoining: 'Sep 5, 2017',
                          projects: 'Project I, Project J',
                          utilization: 75,
                          billed: 88,
                          employeeID: 'E005',
                          tasks: 'Data Collection, Reporting',
                          projectStatus: 'Ongoing',
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

class EmployeeCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String role;
  final String dateOfJoining;
  final String projects;
  final int utilization;
  final int billed;
  final String employeeID;
  final String tasks;
  final String projectStatus;

  const EmployeeCard({
    super.key,
    required this.profileImage,
    required this.name,
    required this.role,
    required this.dateOfJoining,
    required this.projects,
    required this.utilization,
    required this.billed,
    required this.employeeID,
    required this.tasks,
    required this.projectStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileImage),
              radius: 20,
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmployeeProfile(
                        profileImage: profileImage,
                        name: name,
                        role: role,
                        dateOfJoining: dateOfJoining,
                        projects: projects,
                        utilization: utilization,
                        billed: billed,
                        employeeID: employeeID,
                        tasks: tasks,
                        projectStatus: projectStatus,
                      ),
                    ),
                  );
                },
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                role,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                dateOfJoining,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                projects,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: CustomProgressBar(progress: utilization),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$utilization%',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: CustomProgressBar(progress: billed),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$billed%',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeProfile extends StatelessWidget {
  final String profileImage;
  final String name;
  final String role;
  final String dateOfJoining;
  final String projects;
  final int utilization;
  final int billed;
  final String employeeID;
  final String tasks;
  final String projectStatus;

  const EmployeeProfile({
    super.key,
    required this.profileImage,
    required this.name,
    required this.role,
    required this.dateOfJoining,
    required this.projects,
    required this.utilization,
    required this.billed,
    required this.employeeID,
    required this.tasks,
    required this.projectStatus,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 3),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
                child: SingleChildScrollView( 
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(profileImage),
                              radius: 40,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  role,
                                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Employee ID: $employeeID',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Date of Joining: $dateOfJoining',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Projects: $projects',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Project Status: $projectStatus',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tasks: $tasks',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Text(
                              'Utilization: ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              child: CustomProgressBar(progress: utilization),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$utilization%',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Text(
                              'Billed: ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              child: CustomProgressBar(progress: billed),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$billed%',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final int progress;
  static const double maxWidth = 100.0; 

  const CustomProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: maxWidth, 
        height: 15.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[300],
        ),
        child: Stack(
          children: [
            Container(
              height: 15.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue,
              ),
              width: (progress / 100) * maxWidth, 
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
                    "Project summary",
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
