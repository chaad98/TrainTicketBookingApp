class Train {
  final String number;
  final String departureTime;
  final String arrivalTime;

  Train(
      {required this.number,
      required this.departureTime,
      required this.arrivalTime});
}

class Coach {
  final int number;
  final List<Seat> seats;

  Coach({required this.number, required this.seats});
}

class Seat {
  final int number;
  bool isLocked = false;

  Seat({required this.number});
}

class Booking {
  final Train train;
  final Coach coach;
  final Seat seat;

  Booking({required this.train, required this.coach, required this.seat});
}
