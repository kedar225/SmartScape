import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/util/bill_card.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Bills & Payments',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Recent Bills',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BillCard(
              billType: 'Electricity Bill',
              amount: 2450.00,
              icon: Icons.electric_bolt,
              iconColor: Colors.blue,
              isPaid: false,
              dueDate: '23 March 2024',
              onTap: () {
                // Handle tap
              },
            ),
            BillCard(
              billType: 'Water Bill',
              amount: 850.00,
              icon: Icons.water_drop,
              iconColor: Colors.cyan,
              isPaid: true,
              dueDate: '20 March 2024',
              onTap: () {
                // Handle tap
              },
            ),
            BillCard(
              billType: 'Gas Bill',
              amount: 1250.00,
              icon: Icons.local_fire_department,
              iconColor: Colors.orange,
              isPaid: false,
              dueDate: '25 March 2024',
              onTap: () {
                // Handle tap
              },
            ),
            BillCard(
              billType: 'Internet Bill',
              amount: 999.00,
              icon: Icons.wifi,
              iconColor: Colors.purple,
              isPaid: false,
              dueDate: '28 March 2024',
              onTap: () {
                // Handle tap
              },
            ),
            BillCard(
              billType: 'Maintenance',
              amount: 3500.00,
              icon: Icons.home,
              iconColor: Colors.green,
              isPaid: true,
              dueDate: '15 March 2024',
              onTap: () {
                // Handle tap
              },
            ),
          ],
        ),
      ),
    );
  }
}