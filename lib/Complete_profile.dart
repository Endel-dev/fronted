import 'package:flutter/material.dart';

class GettingStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getting Started'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildOptionCard(
              title: "Jhil's login",
              description: "Create a login for Jhil so they can access balance information and more",
              isSelected: true,
            ),
            _buildOptionCard(
              title: "Laher's login",
              description: "Create a login for Laher so they can access balance information and more",
              isSelected: false,
            ),
            _buildOptionCard(
              title: "Add a parent",
              description: "Add trusted family members or friends so they can contribute to your kids",
              isSelected: false,
            ),
            _buildOptionCard(
              title: "Connect an Account",
              description: "Connect an account to start using Spriggy",
              isSelected: false,
            ),
            _buildOptionCard(
              title: "Make your first Top Up",
              description: "Top up your Parent Wallet so you can send money to your kids",
              isSelected: false,
            ),
            _buildOptionCard(
              title: "Add child photo",
              description: "Add a photo of your child to their profile",
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String description,
    required bool isSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color(0xFF6B48FF) : Colors.grey[300]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Radio(
            value: isSelected,
            groupValue: true,
            onChanged: (value) {},
            activeColor: Color(0xFF6B48FF),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}


