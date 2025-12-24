import 'package:ev_tech_user/Screens/ServiceDetails/model/booking_details_model.dart';
import 'package:ev_tech_user/Screens/ServiceDetails/model/booking_model.dart';
import 'package:ev_tech_user/Utils/app_conts.dart';
import 'package:ev_tech_user/services/api_conts.dart';
import 'package:ev_tech_user/services/network.dart';
import 'package:ev_tech_user/services/prefrence_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BookingDetailsProvider with ChangeNotifier {
  BookingDetailsModel bookingDetailsModel = BookingDetailsModel();
  BookingModel bookingModel = BookingModel();
  double rating=0.0;
  TextEditingController ratDesCon=TextEditingController();

  setRating(double rat){
    rating=rat;
    notifyListeners();
  }
  getBookingDetailsApi(BuildContext context, String id) async {
    bookingDetailsModel = BookingDetailsModel();
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
        if(bookingDetailsModel.data!=null&&bookingDetailsModel.data?.serviceRating!=null){
          rating=double.parse(bookingDetailsModel.data?.serviceRating?.rating??'0.0');
          ratDesCon.text=bookingDetailsModel.data?.serviceRating?.review??'';
        }
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
    bookingDetailsModel = BookingDetailsModel();
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

  Future<void> cancelBookingApi(BuildContext context, String id, bool inside) async {
    final networkProvider = NetworkProvider();
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }
    try {
      EasyLoading.show(status: 'Canceling...');

      final response = await networkProvider.postRequest(context, "${ApiConstant.cancelBookedService}$id", headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
            showToast("${data['message'] ?? 'Booking Cancel Successfully'}");
          } else {
            showToast("❌ ${data['message'] ?? 'Add address failed'}");
          }
        } else {
          showToast("❌ ${response.data['message'] ?? 'Something went wrong'}");
        }
      }
    } catch (e) {
      showToast("❌ Something went wrong");
    } finally {
      if (inside) {
        getBookingDetailsApi(context, id);
        getBookingApi(context);
      } else {
        getBookingApi(context);
      }
    }
  }
  Future<void> ratingBookingApi(BuildContext context, String id) async {
    final networkProvider = NetworkProvider();
    final String authToken = GlobalVariables.authToken ?? "";

    debugPrint("🔑 Token set: $authToken");

    if (authToken.isEmpty) {
      showToast("Auth token missing ❌");
      return;
    }
    try {
      EasyLoading.show(status: 'Rating...');

      var body={
        'service_booking_id': id,
        'rating': rating.toString(),
        'review': ratDesCon.text
      };

      final response = await networkProvider.postRequest(context, ApiConstant.serviceRating, body: body,headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $authToken'});

      EasyLoading.dismiss();

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data;
          if (data['status'] == true) {
            showToast("${data['message'] ?? 'Rating added'}");
          } else {
            showToast("❌ ${data['message'] ?? 'Add address failed'}");
          }
        } else {
          showToast("❌ ${response.data['message'] ?? 'Something went wrong'}");
        }
      }
    } catch (e) {
      showToast("❌ Something went wrong");
    } finally {
        getBookingDetailsApi(context, id);
    }
  }
}
