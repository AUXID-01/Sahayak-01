import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/choose_role_screen.dart';
import 'screens/asha_registration/asha_personal_info.dart';
import 'screens/asha_registration/asha_work_details.dart';
import 'screens/asha_registration/asha_training.dart';
import 'screens/asha_registration/asha_review.dart';
import 'screens/asha_registration/asha_dashboard.dart';
import 'screens/asha_registration/asha_profile.dart';
import 'screens/asha_registration/asha_alert.dart';
import 'screens/asha_registration/asha_tasks.dart';
import 'screens/asha_registration/asha_reports.dart';
import 'screens/asha_registration/asha_immunzation_tracker.dart';
import 'screens/asha_registration/asha_schedule.dart';
import 'screens/phc_registration/phc_personal_info.dart';
import 'screens/phc_registration/phc_assignment.dart';
import 'screens/phc_registration/phc_assign_workers.dart';
import 'screens/phc_registration/phc_professional_info.dart';
import 'screens/phc_registration/phc_review.dart';
import 'screens/phc_registration/phc_dashboard.dart';
import 'screens/phc_registration/phc_asha_workers.dart';
import 'screens/phc_registration/phc_inventory_alerts.dart';
import 'screens/phc_registration/phc_reports.dart';
import 'screens/phc_registration/phc_campaign.dart';
import 'screens/phc_registration/phc_patient_registry.dart';
import 'screens/phc_registration/phc_profile.dart';
import 'screens/phc_registration/phc_alerts.dart';
import 'screens/admin_registration/admin_personal_info.dart';
import 'screens/admin_registration/admin_department.dart';
import 'screens/admin_registration/admin_assign_staff.dart';
import 'screens/admin_registration/admin_review.dart';
import 'screens/admin_registration/admin_dashboard.dart';
import 'screens/admin_registration/admin_profile.dart';
import 'screens/admin_registration/admin_data_analytics.dart';
import 'screens/admin_registration/admin_broadcast.dart';
import 'screens/admin_registration/admin_resource_allocation.dart';
import 'screens/admin_registration/admin_summary.dart';
import 'screens/admin_registration/admin_manage_users.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahayak Registration',
      debugShowCheckedModeBanner: false,
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => SigninScreen(),
        '/signup': (context) => SignupScreen(),
        '/choose_role': (context) => ChooseRoleScreen(),
        '/asha/personal_info': (context) => ASHAPersonalInfoPage(),
        '/asha/work_details': (context) => ASHAWorkDetailsPage(),
        '/asha/training': (context) => ASHATrainingPage(),
        '/asha/review': (context) => ASHAReviewPage(),
        '/asha/dashboard': (context) => ASHADashboardPage(),
        '/asha/profile': (context)=> ASHAProfilePage(),
        '/asha/tasks': (context) => ASHATasksPage(),
        '/asha/alerts': (context) => ASHAAlertsPage(),
        '/asha/schedule': (context) => ASHASchedulePage(),
        '/asha/immunization': (context) => ASHAImmunizationTrackerPage(),
        '/asha/reports': (context) => ASHAReportsPage(),
        '/phc/personal_info': (context) => PHCPersonalInfoPage(),
        '/phc/assignment': (context) => PHCAssignmentPage(),
        '/phc/assign_workers': (context) => PHCAssignWorkersPage(),
        '/phc/professional_info': (context) => PHCProfessionalInfoPage(),


        // FIXED: Pass phcData via arguments
        '/phc/review': (context)=> PHCReviewPage(),
        '/phc/dashboard': (context) => PHCDashboard(),
        '/phc/patient_registry': (context) => PHCPatientRegistryPage(),
        '/phc/reports': (context) => PHCReportsPage(),
        '/phc/alerts': (context) => PHCAlertsPage(),
        '/phc/asha_workers': (context) => PHCAshaWorkersPage(),
        '/phc/schedules': (context) => PHCCampaignSchedulesPage(),
        '/phc/inventory': (context) => PHCInventoryAlertsPage(),
        '/phc/profile': (context) => PHCProfilePage(),

        '/admin/personal_info': (context) => AdminPersonalInfoPage(),
        '/admin/department': (context) => AdminDepartmentPage(),
        '/admin/assign_staff': (context) => AdminAssignStaffPage(),
        '/admin/review': (context) => AdminReviewPage(),
        '/admin/dashboard': (context) => AdminDashboardPage(),
        '/admin/summary': (context) => AdminSystemSummaryPage(),
        '/admin/manage_users': (context) => AdminManageUsersPage(),
        '/admin/broadcast': (context) => AdminBroadcastPage(),
        '/admin/analytics': (context) => AdminAnalyticsPage(),
        '/admin/resource_allocation': (context) =>AdminResourceAllocationPage(),
        '/admin/profile': (context) => AdminProfilePage(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const UnknownRoutePage()),
    );
  }
}

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page Not Found")),
      body: const Center(
        child: Text(
          "The page you’re trying to reach doesn’t exist.",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
