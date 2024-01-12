class SeatManager {
  static Set<int> lockedSeats = Set<int>();

  static void lockSeat(int seatNumber) {
    lockedSeats.add(seatNumber);
  }

  static bool isSeatLocked(int seatNumber) {
    return lockedSeats.contains(seatNumber);
  }

  static void clearLockedSeats() {
    lockedSeats.clear();
  }
}
