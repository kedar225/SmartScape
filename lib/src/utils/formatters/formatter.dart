import "package:intl/intl.dart";

class TFormatter {

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date); // Customize the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount); // Customize the currency locale
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone number format: (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    }

    // Add more custom phone number formatting logic for different formats if needed.
    return phoneNumber;
  }

  // Not fully tested
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digits only
    String countryCode = digitsOnly.substring(0, 2); // Assuming country code is the first two digits
    digitsOnly = digitsOnly.substring(2);

    // Format phone number as +<countryCode> <formatted number>
    return '+$countryCode ${digitsOnly.substring(0, 3)}-${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6)}';
  }
}
