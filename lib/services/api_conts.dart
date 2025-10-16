class ApiConstant {
  static const String baseUrl = 'https://system.evtech24.com/api/';
  static const String baseUrlImage = 'https://system.evtech24.com/';
  static const String login = 'login';
  static const String getUserDetails = 'get-user-details';
  static const String logout = 'logout';
  static const String register = 'register';
  static const String updateProfile = 'update-profile';
  static const String fileUpload = 'file-upload';
  static const String changePassword = 'change-password';
  static const String getAdharKycDocuments = 'get-kyc-documents?prefix=';
  static const String storeKycDocuments = 'store-kyc-documents';
  static const String getCategories = 'get-categories';
  static const String getServices = 'get-services-by-category-id?category_id=';
  static const String getAddress = 'get-address';
  static const String getState = 'get-states?country_id=101';
  static const String getCity = 'get-cities?state_id=';
  static const String storeAddress = 'store-address?address_id=';
  static const String serviceBooking = 'service-booking';
  static const String getValidCoupon= 'get-valid-coupon?service_id=';
  static const String deleteAddress= 'delete-address?address_id=';
  static const String getBookedServices= 'get-booked-services?booked_service_id=';
  static const String getNotification = 'get-notification';
  static const String   deleteNotification = 'delete-notification';
}