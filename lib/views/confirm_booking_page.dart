import 'package:train_ticket_booking_app/system_all_packages.dart';

class ConfirmBookingPage extends StatelessWidget {
  final Seat selectedSeat;
  final Coach selectedCoach;
  final Train selectedTrain;

  const ConfirmBookingPage({
    required this.selectedSeat,
    required this.selectedCoach,
    required this.selectedTrain,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Booking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected seat: ${selectedSeat.number}'),
            Text('Coach: ${selectedCoach.number}'),
            Text('Train Number: ${selectedTrain.number}'),
            Text('Departure Time: ${selectedTrain.departureTime}'),
            Text('Arrival Time: ${selectedTrain.arrivalTime}'),
            ElevatedButton(
              onPressed: () {
                SeatManager.clearLockedSeats();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingSummaryPage(
                      selectedSeat: selectedSeat,
                      selectedCoach: selectedCoach,
                      selectedTrain: selectedTrain,
                      totalAmount: 0.0,
                    ),
                  ),
                );
              },
              child: Text('Confirm Booking'),
            )
          ],
        ),
      ),
    );
  }
}
