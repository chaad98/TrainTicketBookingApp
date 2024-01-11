import 'package:train_ticket_booking_app/system_all_packages.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfFunctions {
  static Future<void> downloadBookingSummary(Seat selectedSeat,
      Coach selectedCoach, Train selectedTrain, double totalAmount) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              children: [
                pw.Text('Booking Summary'),
                pw.Text('Selected seat: ${selectedSeat.number}'),
                pw.Text('Coach: ${selectedCoach.number}'),
                pw.Text('Train Number: ${selectedTrain.number}'),
                pw.Text('Departure Time: ${selectedTrain.departureTime}'),
                pw.Text('Arrival Time: ${selectedTrain.arrivalTime}'),
                pw.Text('Total Amount: \RM ${totalAmount.toStringAsFixed(2)}'),
              ],
            ),
          );
        },
      ),
    );

    final pdfData = await pdf.save();
    await Printing.layoutPdf(onLayout: (PdfPageFormat) async => pdfData);
  }
}
