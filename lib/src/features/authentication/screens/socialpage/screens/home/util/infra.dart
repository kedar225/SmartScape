// screens/rental_search_screen.dart
// screens/rental_search_screen.dart
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/screens/infra_screen.dart';
import 'package:smartscape/src/utils/constants/colors.dart';

class RentalSearchScreen extends StatefulWidget {
  const RentalSearchScreen({super.key});

  @override
  _RentalSearchScreenState createState() => _RentalSearchScreenState();
}

class _RentalSearchScreenState extends State<RentalSearchScreen> {
  List<RentalData> _allData = [];
  List<RentalData> _filteredData = [];
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = true;

  // Define your theme colors
  final Color primaryColor =
      const Color(0xFF2196F3); // You can change this to match your app's theme
  final Color backgroundColor = const Color(0xFFF5F5F5);
  final Color cardColor = Colors.white;
  final Color textColor = const Color(0xFF333333);

  @override
  void initState() {
    super.initState();
    _loadCsvData();
  }

  Future<void> _loadCsvData() async {
    try {
      final String csvData =
          await rootBundle.loadString('assets/data/acres_price.csv');
      List<List<dynamic>> csvTable =
          const CsvToListConverter().convert(csvData);

      _allData =
          csvTable.skip(1).map((row) => RentalData.fromCsv(row)).toList();
      _filteredData = List.from(_allData);

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading CSV: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterData(String query) {
    setState(() {
      _filteredData = _allData.where((data) {
        return data.cityName.toLowerCase().contains(query.toLowerCase()) ||
            data.localityName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 0,
        title: const Text(
          'Property Search',
          style: TextStyle(color: TColors.dark, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  cursorColor: TColors.primary,
                  onChanged: _filterData,
                  decoration: InputDecoration(
                    hintText: 'Search city or locality...',
                    prefixIcon: Icon(Icons.search, color: primaryColor),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: primaryColor))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _filteredData.length,
                      itemBuilder: (context, index) {
                        final data = _filteredData[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.localityName,
                                  style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data.cityName,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    _buildRentChip(
                                        '1 BHK', data.oneBhkRentRange),
                                    _buildRentChip(
                                        '2 BHK', data.twoBhkRentRange),
                                    _buildRentChip(
                                        '3 BHK', data.threeBhkRentRange),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRentChip(String type, String range) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: primaryColor.withOpacity(0.2),
        ),
      ),
      child: Text(
        '$type: ₹$range',
        style: TextStyle(
          color: primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
