import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chatbot.dart'; // Ensure the import path is correct

class ProjectDetailed extends StatelessWidget {
  const ProjectDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Controlling Dashboard'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderSection(),
                  const SizedBox(height: 16),
                  _buildSummarySection(colorScheme),
                  const SizedBox(height: 16),
                  _buildTaskStatusSection(colorScheme),
                  const SizedBox(height: 16),
                  _buildTimeSheetSection(colorScheme),
                  const SizedBox(height: 16),
                  _buildPlannedVsActualSection(colorScheme),
                ],
              ),
            ),
          ),
          // Add the ChatBot widget
          const ChatBot(),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Client: McMary Jones Corp.', style: TextStyle(fontSize: 18.sp)),
        Text('Project Status: Open', style: TextStyle(fontSize: 18.sp)),
        Text('Time Period: This Month', style: TextStyle(fontSize: 18.sp)),
      ],
    );
  }

  Widget _buildSummarySection(ColorScheme colorScheme) {
    return Row(
      children: [
        _buildSummaryCard('Total Revenue', '\$150,000', 'Plan: \$200,000', 0.75, colorScheme.primary),
        _buildSummaryCard('Total Cost', '\$137,000', 'Plan: \$170,000', 0.81, colorScheme.secondary),
        _buildSummaryCard('Total Margin', '\$13,000', 'Plan: \$30,000', 0.43, colorScheme.error),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String actual, String plan, double progress, Color color) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Actual: $actual', style: TextStyle(fontSize: 14.sp)),
              Text(plan, style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
              const SizedBox(height: 8),
              LinearProgressIndicator(value: progress, color: color, backgroundColor: color.withOpacity(0.2)),
              const SizedBox(height: 4),
              Text('${(progress * 100).toInt()}%', style: TextStyle(fontSize: 14.sp)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskStatusSection(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tasks by Status', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(color: colorScheme.primary, value: 25, title: '25', radius: 50),
                          PieChartSectionData(color: colorScheme.secondary, value: 15, title: '15', radius: 50),
                          PieChartSectionData(color: colorScheme.error, value: 3, title: '3', radius: 50),
                          PieChartSectionData(color: colorScheme.onError, value: 1, title: '1', radius: 50),
                          PieChartSectionData(color: colorScheme.surface, value: 2, title: '2', radius: 50),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Main Tasks Next up', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Project')),
                        DataColumn(label: Text('Risk')),
                        DataColumn(label: Text('Planned End Date')),
                        DataColumn(label: Text('Time Record')),
                        DataColumn(label: Text('Project Responsible')),
                        DataColumn(label: Text('Completion')),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('Sun Training 10')),
                          DataCell(Text('At Risk', style: TextStyle(color: Colors.red))),
                          DataCell(Text('2020-09-20')),
                          DataCell(Text('4:00:00')),
                          DataCell(Text('James')),
                          DataCell(Text('60%')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Design Coffeecup Go 4.2')),
                          DataCell(Text('On Track', style: TextStyle(color: Colors.blue))),
                          DataCell(Text('2020-09-21')),
                          DataCell(Text('5:54:00')),
                          DataCell(Text('Mark')),
                          DataCell(Text('85%')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Design Coffeecup Go 4.2')),
                          DataCell(Text('On Track', style: TextStyle(color: Colors.blue))),
                          DataCell(Text('2020-09-22')),
                          DataCell(Text('8:13:00')),
                          DataCell(Text('James')),
                          DataCell(Text('95%')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Clock Culture')),
                          DataCell(Text('Planned', style: TextStyle(color: Colors.yellow))),
                          DataCell(Text('2020-09-23')),
                          DataCell(Text('0:18:00')),
                          DataCell(Text('Tom')),
                          DataCell(Text('62%')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Agile App 1.2.')),
                          DataCell(Text('On Track', style: TextStyle(color: Colors.blue))),
                          DataCell(Text('2020-09-25')),
                          DataCell(Text('3:15:00')),
                          DataCell(Text('Mark')),
                          DataCell(Text('98%')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Agile App 1.2.')),
                          DataCell(Text('Delayed', style: TextStyle(color: Colors.orange))),
                          DataCell(Text('2020-09-25')),
                          DataCell(Text('6:32:00')),
                          DataCell(Text('James')),
                          DataCell(Text('92%')),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSheetSection(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Time Sheet Summary', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(color: colorScheme.primary, value: 125, title: '125h', radius: 50),
                          PieChartSectionData(color: colorScheme.secondary, value: 17, title: '17h', radius: 50),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Total: 142h', style: TextStyle(fontSize: 14.sp)),
                  Text('Billable: 125h', style: TextStyle(fontSize: 14.sp)),
                  Text('Non Billable: 17h', style: TextStyle(fontSize: 14.sp)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Planned vs Actual by Project', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    child: _buildBarChart(colorScheme),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlannedVsActualSection(ColorScheme colorScheme) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Planned vs Actual - All Project Status', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(show: true),
                  titlesData: const FlTitlesData(show: true),
                  gridData: const FlGridData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 100),
                        FlSpot(1, 120),
                        FlSpot(2, 140),
                        FlSpot(3, 130),
                        FlSpot(4, 150),
                        FlSpot(5, 160),
                        FlSpot(6, 170),
                        FlSpot(7, 180),
                        FlSpot(8, 170),
                      ],
                      isCurved: true,
                      color: colorScheme.primary,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(ColorScheme colorScheme) {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(x: 0, barRods: [
            BarChartRodData(toY: 101, color: colorScheme.primary),
            BarChartRodData(toY: 96, color: colorScheme.secondary),
          ]),
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(toY: 118, color: colorScheme.primary),
            BarChartRodData(toY: 92, color: colorScheme.secondary),
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(toY: 80, color: colorScheme.primary),
            BarChartRodData(toY: 84, color: colorScheme.secondary),
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(toY: 63, color: colorScheme.primary),
            BarChartRodData(toY: 78, color: colorScheme.secondary),
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(toY: 77, color: colorScheme.primary),
            BarChartRodData(toY: 85, color: colorScheme.secondary),
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(toY: 89, color: colorScheme.primary),
            BarChartRodData(toY: 96, color: colorScheme.secondary),
          ]),
        ],
      ),
    );
  }
}
