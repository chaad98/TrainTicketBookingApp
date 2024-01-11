import 'package:train_ticket_booking_app/system_all_packages.dart';

class SeatSelectionPage extends StatefulWidget {
  final Train selectedTrain;

  const SeatSelectionPage({required this.selectedTrain});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  List<Coach> coaches = [
    Coach(
        number: 1,
        seats: List.generate(20, (index) => Seat(number: index + 1))),
    Coach(
        number: 2,
        seats: List.generate(20, (index) => Seat(number: index + 21))),
    Coach(
        number: 3,
        seats: List.generate(20, (index) => Seat(number: index + 41))),
    Coach(
        number: 4,
        seats: List.generate(20, (index) => Seat(number: index + 61))),
    Coach(
        number: 5,
        seats: List.generate(20, (index) => Seat(number: index + 81))),
    Coach(
        number: 6,
        seats: List.generate(20, (index) => Seat(number: index + 101))),
  ];

  Seat? selectedSeat;
  Coach? selectedCoach;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Seat - Coach ${selectedCoach?.number ?? 1}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: coaches.length,
              itemBuilder: (context, index) {
                Coach coach = coaches[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCoach = coach;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: selectedCoach?.number == coach.number
                        ? Colors.blue
                        : Colors.grey,
                    child: Center(
                      child: Text('Coach ${coach.number}'),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: selectedCoach?.seats.length ?? 0,
              itemBuilder: (context, index) {
                Seat seat = selectedCoach?.seats[index] ?? Seat(number: 0);
                return GestureDetector(
                  onTap: () {
                    if (!seat.isLocked && selectedSeat == null) {
                      setState(() {
                        selectedSeat = seat;
                        seat.isLocked = true;
                      });
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: seat.isLocked ? Colors.red : Colors.green,
                    child: Center(
                      child: Text('Seat ${seat.number}'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedSeat != null && selectedCoach != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmBookingPage(
                  selectedSeat: selectedSeat!,
                  selectedCoach: selectedCoach!,
                  selectedTrain: widget.selectedTrain,
                ),
              ),
            ).then((value) {
              if (mounted) {
                setState(() {
                  selectedSeat = null;
                  selectedCoach = null;
                });
              }
            });
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('No seat selected'),
                content: Text('Please select a seat before proceeding.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
