import 'package:ev_tech_user/Screens/ServiceDetails/model/booking_details_model.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/model/booking_model.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:ev_tech_user/services/network.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BookingDetailsProvider with ChangeNotifier{
  BookingDetailsModel bookingDetailsModel=BookingDetailsModel();
  BookingModel bookingModel=BookingModel();

  getBookingDetailsApi(BuildContext context,String id) async {
    bookingDetailsModel=BookingDetailsModel();
      final String authToken = GlobalVariables.authToken ?? "";

      debugPrint("🔑 Token set: $authToken");

      if (authToken.isEmpty) {
        showToast("Auth token missing ❌");
        return;
      }

      try {
        EasyLoading.show(status: 'Please wait...');

        final response = await NetworkProvider().getRequest(context, "${ApiConstant.getBookedServices}$id", headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

        if (response?.data == null) {
          showToast("No response from server ❌");
          return;
        }

        final res = response!.data;

        if (res['status'] == true) {

          bookingDetailsModel = BookingDetailsModel.fromJson(res);
      } else {
          showToast(res['message'] ?? 'Data not loaded');
        }
      } catch (e, stack) {
        debugPrint("getProfileApi error: $e");
        debugPrint(stack.toString());
        showToast('Something went wrong ❌');
      } finally {
        EasyLoading.dismiss();
        notifyListeners();
      }

  }
  getBookingApi(BuildContext context) async {
    bookingDetailsModel=BookingDetailsModel();
      final String authToken = GlobalVariables.authToken ?? "";

      debugPrint("🔑 Token set: $authToken");

      if (authToken.isEmpty) {
        showToast("Auth token missing ❌");
        return;
      }

      try {
        EasyLoading.show(status: 'Please wait...');

        final response = await NetworkProvider().getRequest(context, ApiConstant.getBookedServices, headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

        if (response?.data == null) {
          showToast("No response from server ❌");
          return;
        }

        final res = response!.data;

        if (res['status'] == true) {

          bookingModel = BookingModel.fromJson(res);

      } else {
          showToast(res['message'] ?? 'Data not loaded');
        }
      } catch (e, stack) {
        debugPrint("getProfileApi error: $e");
        debugPrint(stack.toString());
        showToast('Something went wrong ❌');
      } finally {
        EasyLoading.dismiss();
        notifyListeners();
      }

  }
}