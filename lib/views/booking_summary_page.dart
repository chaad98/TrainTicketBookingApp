import 'package:train_ticket_booking_app/system_all_packages.dart';

class BookingSummaryPage extends StatefulWidget {
  final Seat selectedSeat;
  final Coach selectedCoach;
  final Train selectedTrain;
  final double totalAmount;

  const BookingSummaryPage({
    required this.selectedSeat,
    required this.selectedCoach,
    required this.selectedTrain,
    required this.totalAmount,
  });

  @override
  State<BookingSummaryPage> createState() => _BookingSummaryPageState();
}

class _BookingSummaryPageState extends State<BookingSummaryPage> {
  bool paymentConfirmed = false;
  late double totalAmount;

  @override
  void initState() {
    super.initState();
    totalAmount = (Random().nextDouble() * 100 + 1).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Summary'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Selected seat: ${widget.selectedSeat.number}'),
          Text('Coach: ${widget.selectedCoach.number}'),
          Text('Train Number: ${widget.selectedTrain.number}'),
          Text('Departure Time: ${widget.selectedTrain.arrivalTime}'),
          Text('Arrival Time: ${widget.selectedTrain.arrivalTime}'),
          Text('Total Amount: \RM ${totalAmount.toStringAsFixed(2)}'),
          if (!paymentConfirmed)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentConfirmationPage(
                      selectedSeat: widget.selectedSeat,
                      selectedCoach: widget.selectedCoach,
                      selectedTrain: widget.selectedTrain,
                      totalAmount: totalAmount,
                      onPaymentConfirmed: () {
                        setState(() {
                          paymentConfirmed = true;
                          widget.selectedSeat.isLocked = true;
                        });
                      },
                    ),
                  ),
                );
              },
              child: Text('Confirm Payment'),
            ),
          if (paymentConfirmed)
            ElevatedButton(
              onPressed: () {
                PdfFunctions.downloadBookingSummary(widget.selectedSeat,
                    widget.selectedCoach, widget.selectedTrain, totalAmount);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false,
                );
              },
              child: Text('Download Summary'),
            ),
        ],
      ),
    );
  }
}
