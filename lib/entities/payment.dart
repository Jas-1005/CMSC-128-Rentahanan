class Payment {
  String id;
  DateTime date;
  String status;
  double amount;
  String imageProof;
  String? note;

  Payment({required this.id, required this.date, required this.status, required this.amount, required this.imageProof, this.note});
}