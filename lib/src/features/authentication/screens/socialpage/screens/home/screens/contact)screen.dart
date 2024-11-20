import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/models/contact_model.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/widget/contact_card.dart';

class EmergencyContactsScreen extends StatelessWidget {
  EmergencyContactsScreen({Key? key}) : super(key: key);

  final List<EmergencyContact> emergencyContacts = [
    EmergencyContact(
      name: 'Police Emergency',
      number: '100',
      category: 'Emergency',
      icon: Icons.local_police,
      color: Colors.blue,
      description: 'National Emergency Police Number',
    ),
    EmergencyContact(
      name: 'Ambulance',
      number: '108',
      category: 'Emergency',
      icon: Icons.medical_services,
      color: Colors.red,
      description: 'Medical Emergency Service',
    ),
    EmergencyContact(
      name: 'Fire Emergency',
      number: '101',
      category: 'Emergency',
      icon: Icons.local_fire_department,
      color: Colors.orange,
      description: 'Fire Brigade Emergency Service',
    ),
    EmergencyContact(
      name: 'Women Helpline',
      number: '1091',
      category: 'Helpline',
      icon: Icons.female,
      color: Colors.purple,
      description: 'Women Safety Emergency Number',
    ),
    EmergencyContact(
      name: 'Child Helpline',
      number: '1098',
      category: 'Helpline',
      icon: Icons.child_care,
      color: Colors.green,
      description: 'National Child Abuse Prevention',
    ),
    EmergencyContact(
      name: 'Anti-Poison',
      number: '1066',
      category: 'Medical',
      icon: Icons.medical_services,
      color: Colors.teal,
      description: 'Poison Control Helpline',
    ),
    EmergencyContact(
      name: 'Disaster Management',
      number: '108',
      category: 'Emergency',
      icon: Icons.warning,
      color: Colors.red,
      description: 'Natural Disaster Emergency',
    ),
    EmergencyContact(
      name: 'Railway Enquiry',
      number: '139',
      category: 'Transport',
      icon: Icons.train,
      color: Colors.indigo,
      description: 'Railway Information & Complaints',
    ),
    EmergencyContact(
      name: 'Senior Citizen Helpline',
      number: '14567',
      category: 'Helpline',
      icon: Icons.elderly,
      color: Colors.brown,
      description: 'Elder Care Emergency Service',
    ),
    EmergencyContact(
      name: 'Gas Leakage',
      number: '1906',
      category: 'Emergency',
      icon: Icons.gas_meter,
      color: Colors.deepOrange,
      description: 'Emergency Gas Leak Reporting',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Emergency Contacts',
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.red.shade200,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.red[700],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Tap on any contact card to directly call the emergency number',
                    style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: emergencyContacts.length,
              itemBuilder: (context, index) {
                return ContactCard(contact: emergencyContacts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}