import 'package:flutter/material.dart';

class PHCDashboard extends StatefulWidget {
  const PHCDashboard({Key? key}) : super(key: key);

  @override
  State<PHCDashboard> createState() => _PHCDashboardState();
}

class _PHCDashboardState extends State<PHCDashboard> {
  int _notificationCount = 5;

  // Sample ASHA worker data
  final List<Map<String, dynamic>> ashaWorkers = [
    {
      'id': 'ASHA001',
      'name': 'Priya Sharma',
      'village': 'Ramnagar',
      'phone': '+91 98765 43210',
      'joiningDate': '15-Jan-2023',
      'visitsThisMonth': 45,
      'activeCases': 12,
      'immunizationsDone': 23,
      'status': 'Active',
      'performance': 'Excellent',
    },
    {
      'id': 'ASHA002',
      'name': 'Anita Devi',
      'village': 'Chandpur',
      'phone': '+91 98765 43211',
      'joiningDate': '20-Mar-2023',
      'visitsThisMonth': 38,
      'activeCases': 10,
      'immunizationsDone': 19,
      'status': 'Active',
      'performance': 'Good',
    },
    {
      'id': 'ASHA003',
      'name': 'Lakshmi Patil',
      'village': 'Devipur',
      'phone': '+91 98765 43212',
      'joiningDate': '10-Jun-2022',
      'visitsThisMonth': 52,
      'activeCases': 15,
      'immunizationsDone': 28,
      'status': 'Active',
      'performance': 'Excellent',
    },
    {
      'id': 'ASHA004',
      'name': 'Sunita Kumar',
      'village': 'Rampur',
      'phone': '+91 98765 43213',
      'joiningDate': '05-Sep-2023',
      'visitsThisMonth': 31,
      'activeCases': 8,
      'immunizationsDone': 15,
      'status': 'Active',
      'performance': 'Average',
    },
    {
      'id': 'ASHA005',
      'name': 'Rekha Singh',
      'village': 'Govindpur',
      'phone': '+91 98765 43214',
      'joiningDate': '12-Feb-2023',
      'visitsThisMonth': 42,
      'activeCases': 11,
      'immunizationsDone': 21,
      'status': 'Active',
      'performance': 'Good',
    },
  ];

  void _showNotifications() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Notifications & Alerts',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildNotificationItem(
                      'Urgent: Low Stock Alert',
                      'Vaccine stock running low. Only 50 doses of BCG remaining.',
                      Icons.inventory_2_outlined,
                      Colors.red,
                      '5 min ago',
                      true,
                    ),
                    _buildNotificationItem(
                      'Immunization Campaign Due',
                      '8 children scheduled for vaccination in Ramnagar village tomorrow.',
                      Icons.vaccines_outlined,
                      Colors.blue,
                      '1 hour ago',
                      true,
                    ),
                    _buildNotificationItem(
                      'Emergency Referral',
                      'High-risk pregnancy case referred from Chandpur. Ambulance dispatched.',
                      Icons.emergency_outlined,
                      Colors.orange,
                      '2 hours ago',
                      true,
                    ),
                    _buildNotificationItem(
                      'ASHA Report Submitted',
                      'Priya Sharma submitted monthly activity report for review.',
                      Icons.assignment_outlined,
                      Colors.green,
                      '3 hours ago',
                      false,
                    ),
                    _buildNotificationItem(
                      'Missed ANC Follow-up',
                      '12 pregnant women have missed their scheduled ANC visits this week.',
                      Icons.calendar_today_outlined,
                      Colors.purple,
                      '5 hours ago',
                      true,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlertsNotificationsPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'View All Notifications',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationItem(
    String title,
    String description,
    IconData icon,
    Color color,
    String time,
    bool isUnread,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? color.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isUnread ? color.withOpacity(0.3) : Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: isUnread
                              ? FontWeight.bold
                              : FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    if (isUnread)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAshaWorkerDetails(Map<String, dynamic> worker) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.blue.shade700,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              worker['name'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              worker['id'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildDetailRow(
                  Icons.location_on_outlined,
                  'Village',
                  worker['village'],
                ),
                _buildDetailRow(Icons.phone_outlined, 'Phone', worker['phone']),
                _buildDetailRow(
                  Icons.calendar_today_outlined,
                  'Joining Date',
                  worker['joiningDate'],
                ),
                _buildDetailRow(
                  Icons.verified_outlined,
                  'Status',
                  worker['status'],
                  valueColor: Colors.green,
                ),
                const Divider(height: 32),
                const Text(
                  'Performance Metrics',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        'Visits',
                        worker['visitsThisMonth'].toString(),
                        Icons.medical_services_outlined,
                        Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildMetricCard(
                        'Cases',
                        worker['activeCases'].toString(),
                        Icons.folder_outlined,
                        Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        'Vaccines',
                        worker['immunizationsDone'].toString(),
                        Icons.vaccines_outlined,
                        Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildMetricCard(
                        'Rating',
                        worker['performance'],
                        Icons.star_outline,
                        Colors.purple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.visibility_outlined),
                    label: const Text('View Full Profile'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
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
      },
    );
  }

  Widget _buildDetailRow(
    IconData icon,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: valueColor ?? Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'PHC Staff Dashboard',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black87,
                ),
                onPressed: _showNotifications,
              ),
              if (_notificationCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      _notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildOverviewCard(
                    'Total Patients',
                    '1,247',
                    Icons.people_outline,
                    Colors.blue,
                    '+12 today',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildOverviewCard(
                    'Active ASHAs',
                    '${ashaWorkers.length}',
                    Icons.person_outline,
                    Colors.green,
                    'All active',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildOverviewCard(
                    'Pending Tasks',
                    '23',
                    Icons.assignment_outlined,
                    Colors.orange,
                    '5 urgent',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildOverviewCard(
                    'Immunizations',
                    '156',
                    Icons.vaccines_outlined,
                    Colors.purple,
                    'This month',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            const Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            _buildFeatureCard(
              'Immunization & ANC Schedules',
              'Organize and monitor vaccination drives and antenatal care',
              Icons.calendar_month_outlined,
              Colors.blue,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImmunizationANCPage(),
                  ),
                );
              },
              badge: '8 due',
            ),
            _buildFeatureCard(
              'Referral & Emergency Management',
              'Handle urgent cases and coordinate referrals',
              Icons.emergency_outlined,
              Colors.red,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReferralEmergencyPage(),
                  ),
                );
              },
              badge: '3 active',
            ),
            _buildFeatureCard(
              'Monitor ASHA Activities',
              'Track ASHA outreach and assign tasks',
              Icons.people_alt_outlined,
              Colors.green,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MonitorAshaPage(),
                  ),
                );
              },
              badge: '${ashaWorkers.length} workers',
            ),
            _buildFeatureCard(
              'View Patient Records',
              'Access detailed patient information and clinical data',
              Icons.folder_outlined,
              Colors.indigo,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatientRecordsPage(),
                  ),
                );
              },
            ),
            _buildFeatureCard(
              'Stock & Supply Management',
              'Maintain inventory and coordinate restocking',
              Icons.inventory_2_outlined,
              Colors.orange,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StockSupplyPage(),
                  ),
                );
              },
              badge: '2 low stock',
            ),
            _buildFeatureCard(
              'Health Reports',
              'Analyze trends and generate reports for authorities',
              Icons.analytics_outlined,
              Colors.teal,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HealthReportsPage(),
                  ),
                );
              },
            ),
            _buildFeatureCard(
              'Alerts & Notifications',
              'Stay updated on critical events and tasks',
              Icons.notifications_active_outlined,
              Colors.purple,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlertsNotificationsPage(),
                  ),
                );
              },
              badge: '$_notificationCount new',
            ),

            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ASHA Workers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AshaWorkersListPage(workers: ashaWorkers),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward, size: 18),
                  label: const Text('View All'),
                ),

              ],
            ),
            const SizedBox(height: 16),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ashaWorkers.length,
              itemBuilder: (context, index) {
                final worker = ashaWorkers[index];
                return _buildAshaWorkerCard(worker);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap, {
    String? badge,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          if (badge != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                badge,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAshaWorkerCard(Map<String, dynamic> worker) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () => _showAshaWorkerDetails(worker),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.blue.shade50,
                  child: Text(
                    worker['name'].substring(0, 1),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              worker['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: worker['performance'] == 'Excellent'
                                  ? Colors.green.shade50
                                  : worker['performance'] == 'Good'
                                  ? Colors.blue.shade50
                                  : Colors.orange.shade50,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              worker['performance'],
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: worker['performance'] == 'Excellent'
                                    ? Colors.green.shade700
                                    : worker['performance'] == 'Good'
                                    ? Colors.blue.shade700
                                    : Colors.orange.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            worker['village'],
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Icons.medical_services_outlined,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${worker['visitsThisMonth']} visits',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============ PLACEHOLDER PAGES ============

class ImmunizationANCPage extends StatefulWidget {
  const ImmunizationANCPage({Key? key}) : super(key: key);

  @override
  State<ImmunizationANCPage> createState() => _ImmunizationANCPageState();
}

class _ImmunizationANCPageState extends State<ImmunizationANCPage> {
  final List<Map<String, dynamic>> schedules = [
    {
      'type': 'Immunization',
      'name': 'BCG Vaccine - Infant A',
      'date': DateTime.now(),
      'status': 'Pending',
    },
    {
      'type': 'ANC Visit',
      'name': 'Asha Devi (3rd Trimester)',
      'date': DateTime.now().add(const Duration(days: 1)),
      'status': 'Scheduled',
    },
    {
      'type': 'Immunization',
      'name': 'Polio Dose 2 - Infant B',
      'date': DateTime.now().add(const Duration(days: 3)),
      'status': 'Scheduled',
    },
  ];

  void _addNewSchedule() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nameController = TextEditingController();
        String selectedType = 'Immunization';
        DateTime selectedDate = DateTime.now();

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Add New Schedule'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: selectedType,
                  decoration: const InputDecoration(labelText: 'Type'),
                  items: ['Immunization', 'ANC Visit']
                      .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                      .toList(),
                  onChanged: (value) => selectedType = value!,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Patient / Task Name'),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Date:'),
                    const SizedBox(width: 8),
                    Text(
                      '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now().subtract(const Duration(days: 1)),
                          lastDate: DateTime(2030),
                        );
                        if (picked != null) {
                          setState(() => selectedDate = picked);
                        }
                      },
                      child: const Text('Pick Date'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  schedules.add({
                    'type': selectedType,
                    'name': nameController.text,
                    'date': selectedDate,
                    'status': 'Scheduled',
                  });
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    final todaysSchedules = schedules
        .where((s) =>
            s['date'].day == today.day &&
            s['date'].month == today.month &&
            s['date'].year == today.year)
        .toList();

    final upcoming = schedules
        .where((s) => s['date'].isAfter(today))
        .toList()
      ..sort((a, b) => a['date'].compareTo(b['date']));

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Immunization & ANC Schedules',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addNewSchedule,
        label: const Text('Add Schedule'),
        icon: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Today's Schedule",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          todaysSchedules.isEmpty
              ? const Text('No appointments today.')
              : Column(
                  children: todaysSchedules.map((s) => _buildScheduleCard(s)).toList(),
                ),
          const SizedBox(height: 24),
          const Text(
            "Upcoming Appointments",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Column(children: upcoming.map((s) => _buildScheduleCard(s)).toList()),
        ]),
      ),
    );
  }

  Widget _buildScheduleCard(Map<String, dynamic> schedule) {
    final color = schedule['type'] == 'Immunization' ? Colors.blue : Colors.purple;
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
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              schedule['type'] == 'Immunization'
                  ? Icons.vaccines_outlined
                  : Icons.pregnant_woman_outlined,
              color: color,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                schedule['name'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 4),
              Text(
                '${schedule['type']} • ${schedule['status']}',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
              const SizedBox(height: 4),
              Text(
                '${schedule['date'].day}-${schedule['date'].month}-${schedule['date'].year}',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
              ),
            ]),
          ),
          IconButton(
            icon: const Icon(Icons.check_circle_outline, color: Colors.green),
            onPressed: () {
              setState(() {
                schedule['status'] = 'Completed';
              });
            },
          ),
        ],
      ),
    );
  }
}

class ReferralEmergencyPage extends StatefulWidget {
  const ReferralEmergencyPage({Key? key}) : super(key: key);

  @override
  State<ReferralEmergencyPage> createState() => _ReferralEmergencyPageState();
}

class _ReferralEmergencyPageState extends State<ReferralEmergencyPage> {
  final List<Map<String, dynamic>> emergencies = [
    {
      'type': 'Emergency',
      'patient': 'Sita Devi',
      'issue': 'High-risk pregnancy – referred to district hospital',
      'status': 'Active',
      'time': '2 hrs ago',
    },
    {
      'type': 'Referral',
      'patient': 'Ramesh Kumar',
      'issue': 'Severe dehydration – referred to CHC',
      'status': 'Completed',
      'time': 'Yesterday',
    },
    {
      'type': 'Emergency',
      'patient': 'Lata Bai',
      'issue': 'Severe anemia – awaiting ambulance',
      'status': 'Pending',
      'time': '10 mins ago',
    },
  ];

  void _addNewReferral() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController issueController = TextEditingController();
    String selectedType = 'Referral';
    String selectedStatus = 'Pending';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Add New Referral / Emergency'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedType,
                decoration: const InputDecoration(labelText: 'Type'),
                items: ['Referral', 'Emergency']
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) => selectedType = v!,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Patient Name'),
              ),
              TextField(
                controller: issueController,
                decoration: const InputDecoration(
                  labelText: 'Condition / Issue',
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                decoration: const InputDecoration(labelText: 'Status'),
                items: ['Pending', 'Active', 'Completed']
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (v) => selectedStatus = v!,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                emergencies.insert(0, {
                  'type': selectedType,
                  'patient': nameController.text,
                  'issue': issueController.text,
                  'status': selectedStatus,
                  'time': 'Just now',
                });
              });
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Active':
        return Colors.orange;
      case 'Completed':
        return Colors.green;
      case 'Pending':
      default:
        return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Referral & Emergency',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addNewReferral,
        icon: const Icon(Icons.add),
        label: const Text("Add Case"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Active Emergencies & Referrals",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...emergencies.map((e) => _buildEmergencyCard(e)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyCard(Map<String, dynamic> e) {
    final color = e['type'] == 'Emergency' ? Colors.redAccent : Colors.blue;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              e['type'] == 'Emergency'
                  ? Icons.emergency_outlined
                  : Icons.local_hospital_outlined,
              color: color,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e['patient'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  e['issue'],
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(e['status']).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        e['status'],
                        style: TextStyle(
                          color: _getStatusColor(e['status']),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      e['time'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.done_all_outlined, color: Colors.green),
            onPressed: () {
              setState(() {
                e['status'] = 'Completed';
              });
            },
          ),
        ],
      ),
    );
  }
}

class MonitorAshaPage extends StatelessWidget {
  const MonitorAshaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Monitor ASHA Activities',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Overall Performance',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildPerformanceCard(
                          'Total Visits',
                          '208',
                          Icons.home_outlined,
                          Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildPerformanceCard(
                          'Active Cases',
                          '56',
                          Icons.folder_outlined,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildPerformanceCard(
                          'Vaccinations',
                          '106',
                          Icons.vaccines_outlined,
                          Colors.green,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildPerformanceCard(
                          'ANC Visits',
                          '64',
                          Icons.pregnant_woman_outlined,
                          Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'ASHA Worker Performance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildWorkerPerformanceCard(
              'Priya Sharma',
              'Ramnagar',
              '45 visits',
              '23 vaccines',
              'Excellent',
              Colors.green,
              92,
            ),
            _buildWorkerPerformanceCard(
              'Lakshmi Patil',
              'Devipur',
              '52 visits',
              '28 vaccines',
              'Excellent',
              Colors.green,
              95,
            ),
            _buildWorkerPerformanceCard(
              'Rekha Singh',
              'Govindpur',
              '42 visits',
              '21 vaccines',
              'Good',
              Colors.blue,
              85,
            ),
            _buildWorkerPerformanceCard(
              'Anita Devi',
              'Chandpur',
              '38 visits',
              '19 vaccines',
              'Good',
              Colors.blue,
              80,
            ),
            _buildWorkerPerformanceCard(
              'Sunita Kumar',
              'Rampur',
              '31 visits',
              '15 vaccines',
              'Average',
              Colors.orange,
              68,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkerPerformanceCard(
    String name,
    String village,
    String visits,
    String vaccines,
    String rating,
    Color color,
    int percentage,
  ) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          village,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  rating,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.medical_services_outlined,
                size: 16,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 6),
              Text(
                visits,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.vaccines_outlined,
                size: 16,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 6),
              Text(
                vaccines,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: percentage / 100,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 8,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PatientRecordsPage extends StatefulWidget {
  const PatientRecordsPage({Key? key}) : super(key: key);

  @override
  State<PatientRecordsPage> createState() => _PatientRecordsPageState();
}

class _PatientRecordsPageState extends State<PatientRecordsPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> patients = [
    {
      'id': 'P001',
      'name': 'Sita Devi',
      'age': 28,
      'village': 'Ramnagar',
      'condition': 'Pregnancy (3rd Trimester)',
      'lastVisit': '2 days ago',
    },
    {
      'id': 'P002',
      'name': 'Ramesh Kumar',
      'age': 42,
      'village': 'Chandpur',
      'condition': 'Diabetes',
      'lastVisit': '1 week ago',
    },
    {
      'id': 'P003',
      'name': 'Radha Patel',
      'age': 5,
      'village': 'Devipur',
      'condition': 'Routine Immunization',
      'lastVisit': 'Today',
    },
  ];

  List<Map<String, dynamic>> filteredPatients = [];

  @override
  void initState() {
    super.initState();
    filteredPatients = List.from(patients);
    _searchController.addListener(_filterPatients);
  }

  void _filterPatients() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredPatients = patients
          .where(
            (p) =>
                p['name'].toLowerCase().contains(query) ||
                p['village'].toLowerCase().contains(query) ||
                p['condition'].toLowerCase().contains(query),
          )
          .toList();
    });
  }

  void _addPatient() {
    final TextEditingController nameCtrl = TextEditingController();
    final TextEditingController ageCtrl = TextEditingController();
    final TextEditingController villageCtrl = TextEditingController();
    final TextEditingController conditionCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Add New Patient'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              TextField(
                controller: ageCtrl,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: villageCtrl,
                decoration: const InputDecoration(labelText: 'Village'),
              ),
              TextField(
                controller: conditionCtrl,
                decoration: const InputDecoration(
                  labelText: 'Condition / Reason',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                patients.add({
                  'id': 'P${patients.length + 1}',
                  'name': nameCtrl.text,
                  'age': int.tryParse(ageCtrl.text) ?? 0,
                  'village': villageCtrl.text,
                  'condition': conditionCtrl.text,
                  'lastVisit': 'Just now',
                });
                filteredPatients = List.from(patients);
              });
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _viewPatientDetails(Map<String, dynamic> patient) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(patient['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient ID: ${patient['id']}'),
            Text('Age: ${patient['age']} years'),
            Text('Village: ${patient['village']}'),
            const SizedBox(height: 8),
            Text('Condition: ${patient['condition']}'),
            const SizedBox(height: 8),
            Text('Last Visit: ${patient['lastVisit']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Patient Records',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addPatient,
        label: const Text('Add Patient'),
        icon: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name, village, or condition',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredPatients.isEmpty
                  ? const Center(child: Text('No patients found.'))
                  : ListView.builder(
                      itemCount: filteredPatients.length,
                      itemBuilder: (context, index) {
                        final p = filteredPatients[index];
                        return _buildPatientCard(p);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCard(Map<String, dynamic> patient) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _viewPatientDetails(patient),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.blue.shade50,
              child: Text(
                patient['name'][0],
                style: TextStyle(
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${patient['age']} yrs • ${patient['village']}',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    patient['condition'],
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class StockSupplyPage extends StatefulWidget {
  const StockSupplyPage({Key? key}) : super(key: key);

  @override
  State<StockSupplyPage> createState() => _StockSupplyPageState();
}

class _StockSupplyPageState extends State<StockSupplyPage> {
  final List<Map<String, dynamic>> stockItems = [
    {
      'name': 'BCG Vaccine',
      'category': 'Vaccine',
      'quantity': 50,
      'threshold': 30,
      'unit': 'doses',
    },
    {
      'name': 'Polio Vaccine',
      'category': 'Vaccine',
      'quantity': 20,
      'threshold': 25,
      'unit': 'doses',
    },
    {
      'name': 'Paracetamol Tablets',
      'category': 'Medicine',
      'quantity': 200,
      'threshold': 100,
      'unit': 'tablets',
    },
    {
      'name': 'Gloves',
      'category': 'Supply',
      'quantity': 40,
      'threshold': 50,
      'unit': 'pairs',
    },
  ];

  void _addStockItem() {
    final TextEditingController nameCtrl = TextEditingController();
    final TextEditingController quantityCtrl = TextEditingController();
    final TextEditingController thresholdCtrl = TextEditingController();
    final TextEditingController unitCtrl = TextEditingController();
    String selectedCategory = 'Vaccine';

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Add New Stock Item'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: const InputDecoration(labelText: 'Category'),
                items: ['Vaccine', 'Medicine', 'Supply']
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => selectedCategory = v!,
              ),
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: quantityCtrl,
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: thresholdCtrl,
                decoration: const InputDecoration(
                  labelText: 'Low Stock Threshold',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: unitCtrl,
                decoration: const InputDecoration(
                  labelText: 'Unit (e.g., doses, tablets)',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                stockItems.add({
                  'name': nameCtrl.text,
                  'category': selectedCategory,
                  'quantity': int.tryParse(quantityCtrl.text) ?? 0,
                  'threshold': int.tryParse(thresholdCtrl.text) ?? 10,
                  'unit': unitCtrl.text,
                });
              });
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _updateQuantity(Map<String, dynamic> item) {
    final TextEditingController quantityCtrl = TextEditingController(
      text: item['quantity'].toString(),
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Update Quantity: ${item['name']}'),
        content: TextField(
          controller: quantityCtrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'New Quantity'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                item['quantity'] =
                    int.tryParse(quantityCtrl.text) ?? item['quantity'];
              });
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  bool _isLowStock(Map<String, dynamic> item) {
    return item['quantity'] <= item['threshold'];
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Vaccine':
        return Colors.blue;
      case 'Medicine':
        return Colors.green;
      case 'Supply':
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Stock & Supply Management',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addStockItem,
        icon: const Icon(Icons.add),
        label: const Text("Add Stock"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Inventory Overview",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: stockItems.length,
                itemBuilder: (context, index) {
                  final item = stockItems[index];
                  final low = _isLowStock(item);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: low
                            ? Colors.redAccent.withOpacity(0.5)
                            : Colors.grey.shade300,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(
                              item['category'],
                            ).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            item['category'] == 'Vaccine'
                                ? Icons.vaccines_outlined
                                : item['category'] == 'Medicine'
                                ? Icons.medical_services_outlined
                                : Icons.inventory_2_outlined,
                            color: _getCategoryColor(item['category']),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${item['quantity']} ${item['unit']} available',
                                style: TextStyle(
                                  color: low
                                      ? Colors.redAccent
                                      : Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: low
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Category: ${item['category']}',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () => _updateQuantity(item),
                        ),
                      ],
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

class HealthReportsPage extends StatefulWidget {
  const HealthReportsPage({Key? key}) : super(key: key);

  @override
  State<HealthReportsPage> createState() => _HealthReportsPageState();
}

class _HealthReportsPageState extends State<HealthReportsPage> {
  final List<Map<String, dynamic>> monthlyImmunizations = [
    {'month': 'Jan', 'count': 110},
    {'month': 'Feb', 'count': 132},
    {'month': 'Mar', 'count': 150},
    {'month': 'Apr', 'count': 165},
    {'month': 'May', 'count': 180},
    {'month': 'Jun', 'count': 175},
  ];

  final List<Map<String, dynamic>> ancVisits = [
    {'month': 'Jan', 'count': 95},
    {'month': 'Feb', 'count': 102},
    {'month': 'Mar', 'count': 121},
    {'month': 'Apr', 'count': 130},
    {'month': 'May', 'count': 125},
    {'month': 'Jun', 'count': 140},
  ];

  int totalImmunizations = 0;
  int totalANC = 0;

  @override
  void initState() {
    super.initState();
    totalImmunizations =
        monthlyImmunizations.fold(0, (sum, item) => sum + item['count'] as int);
    totalANC = ancVisits.fold(0, (sum, item) => sum + item['count'] as int);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Health Reports',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Export feature coming soon!")),
          );
        },
        icon: const Icon(Icons.download_outlined),
        label: const Text('Export Report'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Monthly Summary",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  "Total Immunizations",
                  totalImmunizations.toString(),
                  Icons.vaccines_outlined,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  "Total ANC Visits",
                  totalANC.toString(),
                  Icons.pregnant_woman_outlined,
                  Colors.purple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            "Immunization Trend (Last 6 Months)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildBarChart(monthlyImmunizations, Colors.blue),
          const SizedBox(height: 32),
          const Text(
            "ANC Visits Trend (Last 6 Months)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildBarChart(ancVisits, Colors.purple),
          const SizedBox(height: 32),
          const Text(
            "Key Observations",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildObservationCard(
            "✅ Immunizations show a steady growth — +63% since January.",
          ),
          _buildObservationCard(
            "⚕️ ANC visits increased sharply in the last 2 months.",
          ),
          _buildObservationCard(
            "🚨 Ensure adequate vaccine stock to sustain rising demand.",
          ),
        ]),
      ),
    );
  }

  Widget _buildSummaryCard(
      String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart(List<Map<String, dynamic>> data, Color color) {
    final maxCount = data.map((d) => d['count'] as int).reduce((a, b) => a + b).toDouble();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      height: 220,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: data.map((d) {
          final value = d['count'] as int;
          final barHeight = (value / maxCount) * 150;
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 24,
                height: barHeight,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                d['month'],
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildObservationCard(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }
}

class AlertsNotificationsPage extends StatefulWidget {
  const AlertsNotificationsPage({Key? key}) : super(key: key);

  @override
  State<AlertsNotificationsPage> createState() =>
      _AlertsNotificationsPageState();
}

class _AlertsNotificationsPageState extends State<AlertsNotificationsPage> {
  String _filter = 'All';

  final List<Map<String, dynamic>> _alerts = [
    {
      'title': 'Low Vaccine Stock',
      'message': 'Polio vaccine stock has fallen below 20 doses.',
      'type': 'Urgent',
      'time': '10 mins ago',
      'read': false,
    },
    {
      'title': 'Upcoming Immunization Camp',
      'message': 'Block-level immunization camp scheduled for 5th Nov.',
      'type': 'Info',
      'time': '2 hrs ago',
      'read': false,
    },
    {
      'title': 'Emergency Referral Update',
      'message': 'Ambulance dispatched for patient Sita Devi.',
      'type': 'Urgent',
      'time': '3 hrs ago',
      'read': true,
    },
    {
      'title': 'Health Worker Meeting',
      'message': 'ASHA worker meeting scheduled for tomorrow at 10 AM.',
      'type': 'Info',
      'time': 'Yesterday',
      'read': true,
    },
    {
      'title': 'New ANC Visit Logged',
      'message': 'Patient Radha Patel’s ANC visit has been recorded.',
      'type': 'General',
      'time': 'Yesterday',
      'read': false,
    },
  ];

  List<Map<String, dynamic>> get filteredAlerts {
    if (_filter == 'All') return _alerts;
    return _alerts.where((a) => a['type'] == _filter).toList();
  }

  void _markAsRead(int index) {
    setState(() {
      _alerts[index]['read'] = true;
    });
  }

  void _markAllRead() {
    setState(() {
      for (var alert in _alerts) {
        alert['read'] = true;
      }
    });
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Urgent':
        return Colors.redAccent;
      case 'Info':
        return Colors.blueAccent;
      default:
        return Colors.teal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Alerts & Notifications',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: Colors.green),
            tooltip: "Mark all as read",
            onPressed: _markAllRead,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Filter Alerts",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _buildFilterChip('All'),
                _buildFilterChip('Urgent'),
                _buildFilterChip('Info'),
                _buildFilterChip('General'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredAlerts.isEmpty
                  ? const Center(child: Text('No alerts found.'))
                  : ListView.builder(
                      itemCount: filteredAlerts.length,
                      itemBuilder: (context, index) {
                        final alert = filteredAlerts[index];
                        final color = _getTypeColor(alert['type']);
                        final isRead = alert['read'];
                        return Dismissible(
                          key: ValueKey(alert['title'] + index.toString()),
                          background: Container(
                            alignment: Alignment.centerRight,
                            color: Colors.green,
                            padding: const EdgeInsets.only(right: 20),
                            child: const Icon(Icons.done, color: Colors.white),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) => _markAsRead(index),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isRead
                                  ? Colors.white
                                  : color.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isRead
                                    ? Colors.grey.shade300
                                    : color.withOpacity(0.4),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    alert['type'] == 'Urgent'
                                        ? Icons.warning_amber_rounded
                                        : alert['type'] == 'Info'
                                        ? Icons.info_outline
                                        : Icons.notifications_none,
                                    color: color,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        alert['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: isRead
                                              ? Colors.grey.shade700
                                              : Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        alert['message'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 14,
                                            color: Colors.grey.shade600,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            alert['time'],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (!isRead)
                                  IconButton(
                                    icon: const Icon(
                                      Icons.mark_email_read_outlined,
                                      color: Colors.green,
                                    ),
                                    tooltip: "Mark as read",
                                    onPressed: () => _markAsRead(index),
                                  ),
                              ],
                            ),
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

  Widget _buildFilterChip(String label) {
    final isSelected = _filter == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => setState(() => _filter = label),
      selectedColor: Colors.teal.shade100,
      labelStyle: TextStyle(
        color: isSelected ? Colors.teal.shade900 : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

// ==================== ASHA WORKERS LIST PAGE ====================

class AshaWorkersListPage extends StatelessWidget {
  final List<Map<String, dynamic>> workers;

  const AshaWorkersListPage({Key? key, required this.workers})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'All ASHA Workers',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workers.length,
        itemBuilder: (context, index) {
          final worker = workers[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade50,
                child: Text(
                  worker['name'].substring(0, 1),
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                worker['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${worker['village']} • ${worker['performance']}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    title: Text(worker['name']),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${worker['id']}'),
                        Text('Village: ${worker['village']}'),
                        Text('Phone: ${worker['phone']}'),
                        Text('Joining Date: ${worker['joiningDate']}'),
                        Text('Performance: ${worker['performance']}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
