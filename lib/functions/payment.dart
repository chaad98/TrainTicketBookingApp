import 'package:train_ticket_booking_app/system_all_packages.dart';

class Payment {
  static void confirmPayment(BuildContext context, VoidCallback onConfirmed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Payment Confirmed'),
        content: Text('Thank you for your payment!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onConfirmed();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  static void navigateToSummary(BuildContext context) {
    Navigator.pop(context);
  }
}
