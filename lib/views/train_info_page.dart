import 'package:train_ticket_booking_app/system_all_packages.dart';

class TrainInfoPage extends StatefulWidget {
  const TrainInfoPage({super.key});

  @override
  State<TrainInfoPage> createState() => _TrainInfoPageState();
}

class _TrainInfoPageState extends State<TrainInfoPage> {
  List<Train> trains = [
    Train(number: 'T123', departureTime: '10:00 AM', arrivalTime: '12:10 PM'),
    Train(number: 'T456', departureTime: '12:15 PM', arrivalTime: '14:15 PM'),
    Train(number: 'T789', departureTime: '14:20 PM', arrivalTime: '16:20 PM'),
    Train(number: 'T899', departureTime: '16:25 PM', arrivalTime: '18:30 PM'),
    Train(number: 'T999', departureTime: '18:35 PM', arrivalTime: '20:35 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Train'),
      ),
      body: ListView.builder(
        itemCount: trains.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Train ${trains[index].number}'),
            subtitle: Text(
                '${trains[index].departureTime} - ${trains[index].arrivalTime}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SeatSelectionPage(selectedTrain: trains[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
