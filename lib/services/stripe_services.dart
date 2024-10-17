class StripService {
  StripService._();

  static final StripService instance = StripService._();

  Future<void> makePayment() async {
    try {} catch (e) {}
  }

  Future<String?> _createPaymentInten(int amoun, String currency ) async {
    try {
      final Dio dio = Dio();
      Map<String,dynamic>data ={
        "amount":,
        ""
      }

    } catch (e) {

    }
  }
}
