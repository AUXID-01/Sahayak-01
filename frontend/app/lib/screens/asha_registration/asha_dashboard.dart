import 'package:flutter/material.dart';

// ✅ MAIN ENTRY POINT
void main() {
  runApp(const MyApp());
}

// ✅ ROOT APP WIDGET
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASHA Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[50],
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
      home: const ASHADashboardPage(),
    );
  }
}

// ✅ FULLY FUNCTIONAL DASHBOARD WITH DUMMY DATA
class ASHADashboardPage extends StatefulWidget {
  const ASHADashboardPage({super.key});

  @override
  State<ASHADashboardPage> createState() => _ASHADashboardPageState();
}

class _ASHADashboardPageState extends State<ASHADashboardPage> {
  bool isOnline = true;
  DateTime lastSync = DateTime.now();

  // Complete dummy data for alerts
  List<Map<String, dynamic>> allAlerts = [
    {
      'type': 'critical',
      'message': 'Ravi Kumar - Measles vaccine overdue by 7 days',
      'patient': 'Ravi Kumar',
      'time': '2 hours ago',
    },
    {
      'type': 'warning',
      'message': 'Priya Devi - ANC checkup due today',
      'patient': 'Priya Devi',
      'time': '4 hours ago',
    },
    {
      'type': 'info',
      'message': 'Polio campaign starts tomorrow in Block A',
      'patient': 'Community',
      'time': '5 hours ago',
    },
    {
      'type': 'critical',
      'message': 'Baby Arjun - BCG vaccine pending',
      'patient': 'Baby Arjun',
      'time': '1 day ago',
    },
    {
      'type': 'warning',
      'message': 'Sunita Kumari - Follow-up visit required',
      'patient': 'Sunita Kumari',
      'time': '1 day ago',
    },
  ];

  // Complete task list
  List<Map<String, dynamic>> allTasks = [
    {
      'task': 'Home visit - Anjali Sharma (PNC Day 7)',
      'address': 'House 45, Ward 3',
      'time': '10:00 AM',
      'urgency': 'high',
      'completed': false,
    },
    {
      'task': 'BCG Vaccination - Baby Arjun',
      'address': 'House 12, Ward 1',
      'time': '11:30 AM',
      'urgency': 'high',
      'completed': false,
    },
    {
      'task': 'ANC Checkup - Meera Singh',
      'address': 'House 78, Ward 2',
      'time': '2:00 PM',
      'urgency': 'medium',
      'completed': false,
    },
    {
      'task': 'Health education session - Anganwadi',
      'address': 'Ward 4 Center',
      'time': '3:30 PM',
      'urgency': 'low',
      'completed': false,
    },
    {
      'task': 'Follow-up visit - Rahul Das',
      'address': 'House 23, Ward 5',
      'time': '4:30 PM',
      'urgency': 'medium',
      'completed': false,
    },
  ];

  // Schedule data
  List<Map<String, dynamic>> scheduleItems = [
    {
      'date': '2025-11-03',
      'event': 'Village health camp - Block A',
      'time': '10:00 AM',
      'type': 'camp',
    },
    {
      'date': '2025-11-04',
      'event': 'PHC monthly meeting',
      'time': '2:00 PM',
      'type': 'meeting',
    },
    {
      'date': '2025-11-05',
      'event': 'Immunization drive - Ward 3',
      'time': '9:00 AM',
      'type': 'immunization',
    },
    {
      'date': '2025-11-06',
      'event': 'ANC group counseling session',
      'time': '11:00 AM',
      'type': 'counseling',
    },
    {
      'date': '2025-11-07',
      'event': 'Home visits - Ward 7',
      'time': '10:00 AM',
      'type': 'visit',
    },
  ];

  // Immunization records
  List<Map<String, dynamic>> immunizationRecords = [
    {
      'name': 'Ravi Kumar',
      'vaccine': 'Measles',
      'status': 'Overdue',
      'dueDate': '2025-10-25',
      'age': '9 months',
    },
    {
      'name': 'Baby Arjun',
      'vaccine': 'BCG',
      'status': 'Pending',
      'dueDate': '2025-11-03',
      'age': '2 weeks',
    },
    {
      'name': 'Priya Sharma',
      'vaccine': 'DPT-1',
      'status': 'Due',
      'dueDate': '2025-11-05',
      'age': '6 weeks',
    },
    {
      'name': 'Anita Das',
      'vaccine': 'MMR',
      'status': 'Done',
      'dueDate': '2025-10-15',
      'age': '12 months',
    },
    {
      'name': 'Pooja Rani',
      'vaccine': 'OPV-3',
      'status': 'Upcoming',
      'dueDate': '2025-11-10',
      'age': '14 weeks',
    },
  ];

  // Reports data
  List<Map<String, dynamic>> reports = [
    {
      'title': 'Weekly Activity Report',
      'period': 'Oct 27 - Nov 2, 2025',
      'type': 'Activity',
      'status': 'Draft',
    },
    {
      'title': 'Monthly Immunization Summary',
      'period': 'October 2025',
      'type': 'Immunization',
      'status': 'Submitted',
    },
    {
      'title': 'ANC/PNC Coverage Report',
      'period': 'October 2025',
      'type': 'Maternal Health',
      'status': 'Submitted',
    },
    {
      'title': 'Household Visit Analysis',
      'period': 'Q3 2025',
      'type': 'Analytics',
      'status': 'Draft',
    },
  ];

  // Patients/Households data
  List<Map<String, dynamic>> households = [
    {
      'headName': 'Sita Devi',
      'householdNumber': 'HH001',
      'address': 'House 45, Ward 3',
      'members': 4,
      'hasPregnant': true,
      'hasUnder5': true,
    },
    {
      'headName': 'Ramesh Patel',
      'householdNumber': 'HH002',
      'address': 'House 12, Ward 1',
      'members': 5,
      'hasPregnant': false,
      'hasUnder5': true,
    },
    {
      'headName': 'Sunita Kumari',
      'householdNumber': 'HH003',
      'address': 'House 78, Ward 2',
      'members': 3,
      'hasPregnant': true,
      'hasUnder5': false,
    },
  ];

  // Monthly stats
  Map<String, int> monthlyStats = {
    'householdsVisited': 87,
    'vaccinesDelivered': 23,
    'ancCompleted': 15,
    'pncCompleted': 8,
  };

  void _navigateTo(BuildContext context, String feature) {
    Widget page;

    switch (feature) {
      case 'Tasks':
        page = TasksPage(
          tasks: allTasks,
          onTaskUpdate: (tasks) {
            setState(() => allTasks = tasks);
          },
        );
        break;
      case 'Alerts':
        page = AlertsPage(alerts: allAlerts);
        break;
      case 'Schedule':
        page = SchedulePage(schedule: scheduleItems);
        break;
      case 'Immunization':
        page = ImmunizationTrackerPage(records: immunizationRecords);
        break;
      case 'Reports':
        page = ReportsPage(reports: reports);
        break;
      case 'Profile':
        page = const ProfilePage();
        break;
      case 'Add Patient':
        page = AddPatientPage(
          onPatientAdded: (household) {
            setState(() => households.add(household));
          },
        );
        break;
      case 'Patients':
        page = PatientsPage(households: households);
        break;
      default:
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$feature coming soon!')));
        return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => page));
  }

  void _syncData() {
    setState(() {
      lastSync = DateTime.now();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data synced successfully!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Visit logs data
  List<Map<String, dynamic>> visitLogs = [
    {
      'patientName': 'Anjali Sharma',
      'householdNumber': 'HH001',
      'visitType': 'PNC Checkup',
      'notes': 'Post-natal day 7 checkup completed. Mother and baby healthy.',
      'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
      'address': 'House 45, Ward 3',
    },
    {
      'patientName': 'Meera Singh',
      'householdNumber': 'HH003',
      'visitType': 'ANC Checkup',
      'notes':
          'ANC-2 completed. Blood pressure normal. Prescribed iron tablets.',
      'timestamp': DateTime.now().subtract(const Duration(hours: 5)),
      'address': 'House 78, Ward 2',
    },
    {
      'patientName': 'Baby Arjun',
      'householdNumber': 'HH002',
      'visitType': 'Vaccination',
      'notes': 'BCG vaccine administered successfully.',
      'timestamp': DateTime.now().subtract(const Duration(days: 1, hours: 3)),
      'address': 'House 12, Ward 1',
    },
    {
      'patientName': 'Sunita Kumari',
      'householdNumber': 'HH005',
      'visitType': 'Follow-up Visit',
      'notes': 'Follow-up for previous illness. Recovery progressing well.',
      'timestamp': DateTime.now().subtract(const Duration(days: 1, hours: 8)),
      'address': 'House 89, Ward 5',
    },
    {
      'patientName': 'Ravi Kumar',
      'householdNumber': 'HH007',
      'visitType': 'Health Education',
      'notes': 'Nutrition counseling session conducted with family.',
      'timestamp': DateTime.now().subtract(const Duration(days: 3)),
      'address': 'House 23, Ward 4',
    },
    {
      'patientName': 'Priya Devi',
      'householdNumber': 'HH004',
      'visitType': 'ANC Checkup',
      'notes':
          'First ANC visit. Pregnancy confirmation and initial screening done.',
      'timestamp': DateTime.now().subtract(const Duration(days: 5)),
      'address': 'House 56, Ward 2',
    },
  ];

  void _logVisit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => LogVisitPage(
          onVisitLogged: (visit) {
            setState(() {
              visitLogs.insert(0, visit);
              monthlyStats['householdsVisited'] =
                  (monthlyStats['householdsVisited'] ?? 0) + 1;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> urgentAlerts = allAlerts.take(2).toList();
    List<Map<String, dynamic>> priorityTasks = allTasks.take(3).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, Lakshmi', style: TextStyle(fontSize: 20)),
            Text(
              'Rampur Village',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() => isOnline = !isOnline);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isOnline
                        ? Colors.green.shade400
                        : Colors.red.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isOnline ? Icons.wifi : Icons.wifi_off,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isOnline ? 'Online' : 'Offline',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: _syncData,
            tooltip: 'Sync Data',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _syncData();
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              // Header Stats Section
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildHeaderStat(
                          '${monthlyStats['householdsVisited']}',
                          'Households Visited',
                          Icons.home_outlined,
                        ),
                      ),
                      Container(height: 50, width: 1, color: Colors.white24),
                      Expanded(
                        child: _buildHeaderStat(
                          '${monthlyStats['vaccinesDelivered']}',
                          'Vaccines Given',
                          Icons.vaccines_outlined,
                        ),
                      ),
                      Container(height: 50, width: 1, color: Colors.white24),
                      Expanded(
                        child: _buildHeaderStat(
                          '${allAlerts.length}',
                          'Total Alerts',
                          Icons.notifications_active_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quick Actions
                    Row(
                      children: [
                        Expanded(
                          child: _buildQuickActionButton(
                            'Add Patient',
                            Icons.person_add_outlined,
                            Colors.teal,
                            () => _navigateTo(context, 'Add Patient'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildQuickActionButton(
                            'Log Visit',
                            Icons.add_circle_outline,
                            Colors.blue,
                            _logVisit,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Urgent Alerts
                    if (urgentAlerts.isNotEmpty) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Urgent Alerts',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          TextButton(
                            onPressed: () => _navigateTo(context, 'Alerts'),
                            child: Text('View All (${allAlerts.length})'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...urgentAlerts.map((alert) => _buildAlertCard(alert)),
                      const SizedBox(height: 28),
                    ],

                    // Today's Tasks
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Today\'s Tasks',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        TextButton(
                          onPressed: () => _navigateTo(context, 'Tasks'),
                          child: Text('View All (${allTasks.length})'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...priorityTasks.map((task) => _buildTaskCard(task)),

                    const SizedBox(height: 28),

                    // Features Grid
                    const Text(
                      'Quick Access',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1,
                      children: [
                        _buildFeatureCard(
                          'Schedule',
                          Icons.calendar_today_outlined,
                          Colors.orange,
                          () => _navigateTo(context, 'Schedule'),
                        ),
                        _buildFeatureCard(
                          'Immunization',
                          Icons.vaccines_outlined,
                          Colors.green,
                          () => _navigateTo(context, 'Immunization'),
                        ),
                        _buildFeatureCard(
                          'Reports',
                          Icons.insert_chart_outlined,
                          Colors.purple,
                          () => _navigateTo(context, 'Reports'),
                        ),
                        _buildFeatureCard(
                          'Patients',
                          Icons.groups_outlined,
                          Colors.indigo,
                          () => _navigateTo(context, 'Patients'),
                        ),
                        _buildFeatureCard(
                          'Visit Logs',
                          Icons.history_outlined,
                          Colors.brown,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => VisitLogsPage(logs: visitLogs),
                            ),
                          ),
                        ),
                        _buildFeatureCard(
                          'Alerts',
                          Icons.notifications_outlined,
                          Colors.red,
                          () => _navigateTo(context, 'Alerts'),
                        ),
                        _buildFeatureCard(
                          'Profile',
                          Icons.person_outline,
                          Colors.teal,
                          () => _navigateTo(context, 'Profile'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderStat(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildQuickActionButton(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 28),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertCard(Map<String, dynamic> alert) {
    Color getColor() {
      switch (alert['type']) {
        case 'critical':
          return Colors.red;
        case 'warning':
          return Colors.orange;
        default:
          return Colors.blue;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: getColor().withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: getColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.warning_amber_rounded,
              color: getColor(),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert['patient'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  alert['message'],
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  alert['time'],
                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
        ],
      ),
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> task) {
    Color getUrgencyColor() {
      switch (task['urgency']) {
        case 'high':
          return Colors.red;
        case 'medium':
          return Colors.orange;
        default:
          return Colors.blue;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Checkbox(
            value: task['completed'],
            onChanged: (val) {
              setState(() {
                task['completed'] = val ?? false;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: getUrgencyColor().withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        task['urgency'].toString().toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: getUrgencyColor(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      task['time'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  task['task'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    decoration: task['completed']
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text(
                      task['address'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 28, color: color),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ ADD PATIENT PAGE
class AddPatientPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onPatientAdded;

  const AddPatientPage({super.key, required this.onPatientAdded});

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _householdController = TextEditingController();
  String? _sex;
  String? _category;

  void _savePatient() {
    if (_nameController.text.trim().isEmpty ||
        _householdController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter required fields')),
      );
      return;
    }

    final newHousehold = {
      'headName': _nameController.text.trim(),
      'householdNumber': _householdController.text.trim(),
      'address': _addressController.text.trim(),
      'members': 1,
      'hasPregnant': _category == 'Pregnant Woman',
      'hasUnder5': _category == 'Child (<5 years)',
    };

    widget.onPatientAdded(newHousehold);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Patient added successfully!')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Add New Patient'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Patient Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'Full Name *',
              _nameController,
              Icons.person_outline,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Household Number *',
              _householdController,
              Icons.home_outlined,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Age',
              _ageController,
              Icons.cake_outlined,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              'Sex',
              _sex,
              ['Male', 'Female', 'Other'],
              Icons.wc_outlined,
              (v) => setState(() => _sex = v),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Address',
              _addressController,
              Icons.location_on_outlined,
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              'Category',
              _category,
              ['Pregnant Woman', 'Child (<5 years)', 'General', 'Elderly'],
              Icons.category_outlined,
              (v) => setState(() => _category = v),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _savePatient,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save Patient',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon, {
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.teal),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String? value,
    List<String> items,
    IconData icon,
    Function(String?) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 16),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                hint: Text(label),
                isExpanded: true,
                items: items
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ TASKS PAGE - FULLY FUNCTIONAL
class TasksPage extends StatefulWidget {
  final List<Map<String, dynamic>> tasks;
  final Function(List<Map<String, dynamic>>) onTaskUpdate;

  const TasksPage({super.key, required this.tasks, required this.onTaskUpdate});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late List<Map<String, dynamic>> tasks;
  String filter = 'All';

  @override
  void initState() {
    super.initState();
    tasks = List.from(widget.tasks);
  }

  List<Map<String, dynamic>> get filteredTasks {
    if (filter == 'All') return tasks;
    if (filter == 'Completed') {
      return tasks.where((t) => t['completed'] == true).toList();
    }
    return tasks.where((t) => t['completed'] == false).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('All Tasks'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              children: [
                _buildFilterChip('All', tasks.length),
                const SizedBox(width: 8),
                _buildFilterChip(
                  'Pending',
                  tasks.where((t) => !t['completed']).length,
                ),
                const SizedBox(width: 8),
                _buildFilterChip(
                  'Completed',
                  tasks.where((t) => t['completed']).length,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                final task = filteredTasks[index];
                return _buildTaskCard(task);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, int count) {
    final isSelected = filter == label;
    return GestureDetector(
      onTap: () => setState(() => filter = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '$label ($count)',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> task) {
    Color getUrgencyColor() {
      switch (task['urgency']) {
        case 'high':
          return Colors.red;
        case 'medium':
          return Colors.orange;
        default:
          return Colors.blue;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Checkbox(
            value: task['completed'],
            onChanged: (val) {
              setState(() {
                task['completed'] = val ?? false;
              });
              widget.onTaskUpdate(tasks);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: getUrgencyColor().withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        task['urgency'].toString().toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: getUrgencyColor(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      task['time'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  task['task'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    decoration: task['completed']
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text(
                      task['address'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ ALERTS PAGE - FULLY FUNCTIONAL
class AlertsPage extends StatelessWidget {
  final List<Map<String, dynamic>> alerts;

  const AlertsPage({super.key, required this.alerts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('All Alerts'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          final alert = alerts[index];
          return _buildAlertCard(alert);
        },
      ),
    );
  }

  Widget _buildAlertCard(Map<String, dynamic> alert) {
    Color getColor() {
      switch (alert['type']) {
        case 'critical':
          return Colors.red;
        case 'warning':
          return Colors.orange;
        default:
          return Colors.blue;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: getColor().withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: getColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.warning_amber_rounded,
              color: getColor(),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: getColor().withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    alert['type'].toString().toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: getColor(),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  alert['patient'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  alert['message'],
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  alert['time'],
                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ SCHEDULE PAGE - FULLY FUNCTIONAL
class SchedulePage extends StatelessWidget {
  final List<Map<String, dynamic>> schedule;

  const SchedulePage({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Schedule'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          final item = schedule[index];
          return _buildScheduleCard(item);
        },
      ),
    );
  }

  Widget _buildScheduleCard(Map<String, dynamic> item) {
    Color getTypeColor() {
      switch (item['type']) {
        case 'camp':
          return Colors.green;
        case 'meeting':
          return Colors.blue;
        case 'immunization':
          return Colors.purple;
        case 'counseling':
          return Colors.orange;
        default:
          return Colors.teal;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: getTypeColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.event, color: getTypeColor(), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['event'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item['date'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text(
                      item['time'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ IMMUNIZATION TRACKER PAGE - FULLY FUNCTIONAL
class ImmunizationTrackerPage extends StatelessWidget {
  final List<Map<String, dynamic>> records;

  const ImmunizationTrackerPage({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    final overdue = records.where((r) => r['status'] == 'Overdue').length;
    final pending = records.where((r) => r['status'] == 'Pending').length;
    final due = records.where((r) => r['status'] == 'Due').length;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Immunization Tracker'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('$overdue', 'Overdue', Colors.red),
                _buildStatColumn('$pending', 'Pending', Colors.orange),
                _buildStatColumn('$due', 'Due Soon', Colors.blue),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];
                return _buildRecordCard(record);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildRecordCard(Map<String, dynamic> record) {
    Color getStatusColor() {
      switch (record['status']) {
        case 'Overdue':
          return Colors.red;
        case 'Pending':
          return Colors.orange;
        case 'Due':
          return Colors.blue;
        case 'Done':
          return Colors.green;
        default:
          return Colors.grey;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: getStatusColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.vaccines, color: getStatusColor(), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${record['vaccine']} • Age: ${record['age']}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 2),
                Text(
                  'Due: ${record['dueDate']}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: getStatusColor().withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              record['status'],
              style: TextStyle(
                color: getStatusColor(),
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ REPORTS PAGE - FULLY FUNCTIONAL
class ReportsPage extends StatelessWidget {
  final List<Map<String, dynamic>> reports;

  const ReportsPage({super.key, required this.reports});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Reports'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return _buildReportCard(context, report);
        },
      ),
    );
  }

  Widget _buildReportCard(BuildContext context, Map<String, dynamic> report) {
    Color getStatusColor() {
      return report['status'] == 'Submitted' ? Colors.green : Colors.orange;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Opening ${report['title']}')));
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.insert_drive_file,
                color: Colors.teal,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    report['period'],
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        report['type'],
                        style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: getStatusColor().withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          report['status'],
                          style: TextStyle(
                            fontSize: 10,
                            color: getStatusColor(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}

// ✅ LOG VISIT PAGE - DETAILED INPUT
class LogVisitPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onVisitLogged;

  const LogVisitPage({super.key, required this.onVisitLogged});

  @override
  State<LogVisitPage> createState() => _LogVisitPageState();
}

class _LogVisitPageState extends State<LogVisitPage> {
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _householdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String? _visitType;

  final List<String> visitTypes = [
    'ANC Checkup',
    'PNC Checkup',
    'Vaccination',
    'Health Education',
    'Follow-up Visit',
    'General Checkup',
    'Emergency Visit',
  ];

  void _saveVisit() {
    if (_patientNameController.text.trim().isEmpty ||
        _householdController.text.trim().isEmpty ||
        _visitType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    final visit = {
      'patientName': _patientNameController.text.trim(),
      'householdNumber': _householdController.text.trim(),
      'visitType': _visitType!,
      'notes': _notesController.text.trim(),
      'timestamp': DateTime.now(),
      'address': _addressController.text.trim(),
    };

    widget.onVisitLogged(visit);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Visit logged successfully!')));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Log Visit'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Visit Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'Patient Name *',
              _patientNameController,
              Icons.person_outline,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Household Number *',
              _householdController,
              Icons.home_outlined,
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              'Visit Type *',
              _visitType,
              visitTypes,
              Icons.medical_services_outlined,
              (v) => setState(() => _visitType = v),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Address',
              _addressController,
              Icons.location_on_outlined,
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                controller: _notesController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Visit Notes',
                  hintText: 'Enter details about the visit...',
                  prefixIcon: Icon(Icons.notes, color: Colors.teal),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _saveVisit,
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Log Visit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.teal),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String? value,
    List<String> items,
    IconData icon,
    Function(String?) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 16),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                hint: Text(label),
                isExpanded: true,
                items: items
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ VISIT LOGS PAGE - ORGANIZED BY DATE
class VisitLogsPage extends StatelessWidget {
  final List<Map<String, dynamic>> logs;

  const VisitLogsPage({super.key, required this.logs});

  String _getTimeCategory(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final visitDate = DateTime(timestamp.year, timestamp.month, timestamp.day);

    if (visitDate == today) {
      return 'Today';
    } else if (visitDate == yesterday) {
      return 'Yesterday';
    } else {
      return 'Earlier';
    }
  }

  Map<String, List<Map<String, dynamic>>> _groupLogsByDate() {
    final grouped = <String, List<Map<String, dynamic>>>{
      'Today': [],
      'Yesterday': [],
      'Earlier': [],
    };

    for (var log in logs) {
      final category = _getTimeCategory(log['timestamp']);
      grouped[category]!.add(log);
    }

    return grouped;
  }

  String _formatTime(DateTime timestamp) {
    final hour = timestamp.hour;
    final minute = timestamp.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }

  String _formatDate(DateTime timestamp) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[timestamp.month - 1]} ${timestamp.day}, ${timestamp.year}';
  }

  @override
  Widget build(BuildContext context) {
    final groupedLogs = _groupLogsByDate();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Visit History'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Summary Stats
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat('${logs.length}', 'Total Visits', Icons.list_alt),
                  _buildStat(
                    '${groupedLogs['Today']!.length}',
                    'Today',
                    Icons.today,
                  ),
                  _buildStat(
                    '${groupedLogs['Yesterday']!.length}',
                    'Yesterday',
                    Icons.calendar_today,
                  ),
                ],
              ),
            ),

            // Grouped Visit Logs
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (groupedLogs['Today']!.isNotEmpty) ...[
                    _buildSectionHeader('Today'),
                    ...groupedLogs['Today']!.map((log) => _buildLogCard(log)),
                    const SizedBox(height: 20),
                  ],
                  if (groupedLogs['Yesterday']!.isNotEmpty) ...[
                    _buildSectionHeader('Yesterday'),
                    ...groupedLogs['Yesterday']!.map(
                      (log) => _buildLogCard(log),
                    ),
                    const SizedBox(height: 20),
                  ],
                  if (groupedLogs['Earlier']!.isNotEmpty) ...[
                    _buildSectionHeader('Earlier'),
                    ...groupedLogs['Earlier']!.map((log) => _buildLogCard(log)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildLogCard(Map<String, dynamic> log) {
    Color getTypeColor() {
      switch (log['visitType']) {
        case 'ANC Checkup':
          return Colors.purple;
        case 'PNC Checkup':
          return Colors.pink;
        case 'Vaccination':
          return Colors.green;
        case 'Health Education':
          return Colors.blue;
        case 'Emergency Visit':
          return Colors.red;
        default:
          return Colors.teal;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with patient name and time
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: getTypeColor().withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: getTypeColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.person, color: getTypeColor(), size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        log['patientName'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'HH: ${log['householdNumber']}',
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _formatTime(log['timestamp']),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      _formatDate(log['timestamp']),
                      style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Visit details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Visit type badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: getTypeColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.medical_services,
                        size: 14,
                        color: getTypeColor(),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        log['visitType'],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: getTypeColor(),
                        ),
                      ),
                    ],
                  ),
                ),

                if (log['address'].isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          log['address'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],

                if (log['notes'].isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.notes, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            log['notes'],
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ PATIENTS PAGE - FULLY FUNCTIONAL
class PatientsPage extends StatelessWidget {
  final List<Map<String, dynamic>> households;

  const PatientsPage({super.key, required this.households});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Registered Patients'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: households.length,
        itemBuilder: (context, index) {
          final household = households[index];
          return _buildHouseholdCard(household);
        },
      ),
    );
  }

  Widget _buildHouseholdCard(Map<String, dynamic> household) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.home, color: Colors.teal, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      household['headName'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'HH: ${household['householdNumber']}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Text(
                '${household['members']} members',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.location_on, size: 14, color: Colors.grey[500]),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  household['address'],
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ),
            ],
          ),
          if (household['hasPregnant'] || household['hasUnder5']) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              children: [
                if (household['hasPregnant'])
                  Chip(
                    label: const Text(
                      'Pregnant Woman',
                      style: TextStyle(fontSize: 10),
                    ),
                    backgroundColor: Colors.purple.shade50,
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                if (household['hasUnder5'])
                  Chip(
                    label: const Text(
                      'Child <5',
                      style: TextStyle(fontSize: 10),
                    ),
                    backgroundColor: Colors.blue.shade50,
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ✅ PROFILE PAGE
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const CircleAvatar(
                      radius: 56,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.person, size: 60, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Lakshmi Devi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'ASHA Worker',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildInfoCard(
                    'Village',
                    'Rampur Village',
                    Icons.location_on,
                  ),
                  _buildInfoCard('ASHA ID', 'ASHA-2025-1234', Icons.badge),
                  _buildInfoCard('Contact', '+91 98765 43210', Icons.phone),
                  _buildInfoCard(
                    'Coverage Area',
                    'Block A, Ward 1-5',
                    Icons.map,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit Profile'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                      label: const Text('Logout'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
