class AppStrings {
  static const String appName = 'Sahayak';
  static const String appTagline = 'Integrated Rural Healthcare Management Ecosystem';

  // Network & API Defaults
  // 10.0.2.2 is Android Emulator localhost, localhost is for Web/Desktop/iOS
  static const String defaultBaseUrl = 'http://10.0.2.2:8000';
  static const String localHostUrl = 'http://localhost:8000';

  // Role Constants
  static const String roleAsha = 'asha_worker';
  static const String rolePhc = 'phc_staff';
  static const String roleAdmin = 'admin';

  // Role Display Labels
  static const String labelAsha = 'ASHA Worker';
  static const String labelPhc = 'PHC Staff';
  static const String labelAdmin = 'Administrator';

  // General Messages
  static const String networkError = 'Unable to connect to server. Please check your network.';
  static const String sessionExpired = 'Session expired. Please log in again.';
}
