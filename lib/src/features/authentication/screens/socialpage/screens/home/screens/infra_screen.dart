class RentalData {
  final String cityName;
  final String localityName;
  final String oneBhkRentRange;
  final String twoBhkRentRange;
  final String threeBhkRentRange;

  RentalData({
    required this.cityName,
    required this.localityName,
    required this.oneBhkRentRange,
    required this.twoBhkRentRange,
    required this.threeBhkRentRange,
  });

  factory RentalData.fromCsv(List<dynamic> row) {
    return RentalData(
      cityName: row[0],
      localityName: row[1],
      oneBhkRentRange: row[2],
      twoBhkRentRange: row[3],
      threeBhkRentRange: row[4],
    );
  }
}
