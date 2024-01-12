import 'package:train_ticket_booking_app/system_all_packages.dart';

class PaymentConfirmationPage extends StatelessWidget {
  final Seat selectedSeat;
  final Coach selectedCoach;
  final Train selectedTrain;
  final double totalAmount;
  final VoidCallback onPaymentConfirmed;

  const PaymentConfirmationPage({
    required this.selectedSeat,
    required this.selectedCoach,
    required this.selectedTrain,
    required this.totalAmount,
    required this.onPaymentConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Amount: \RM ${totalAmount.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: () {
                SeatManager.lockSeat(selectedSeat.number);
                Payment.confirmPayment(
                  context,
                  () {
                    onPaymentConfirmed();
                    Payment.navigateToSummary(context);
                  },
                );
              },
              child: Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
