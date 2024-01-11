import 'package:train_ticket_booking_app/system_all_packages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Train Ticket Booking'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrainInfoPage()),
            );
          },
          child: Text('Start Booking'),
        ),
      ),
    );
  }
}
