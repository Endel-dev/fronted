import 'package:flutter/material.dart';

import '../Backend/APIs.dart';
import '../Global_values.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  late Future childrenFuture;
  String? selectedChildId;

  @override
  void initState() {
    super.initState();
    childrenFuture = Fetch_children(); // Replace with your actual API call.
  }



  void navigateToNextScreen(String id) {
    // Replace with your navigation logic.
    print("Navigating to next screen with child ID: $id");
  }

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
        child: FutureBuilder(
          future: childrenFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF6B48FF),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Failed to load children'),
              );
            } else {
              return ListView(
                children: [
                  for(var ti in children)
                    _buildOptionCard(title: ti['name'], description: "Create a login for ${ti['name']} so they can access balance information and more",
                        isSelected: true, onTap: (){}),
                  _buildOptionCard(
                    title: "invite a Co-parent",
                    description: "Add trusted family members or friends so they can contribute to your kids",
                    isSelected: false,
                    onTap: () {
                      navigateToNextScreen("add_parent");
                    },
                  ),
                  _buildOptionCard(
                    title: "Connect an Account",
                    description: "Connect an account to start using Spriggy",
                    isSelected: false,
                    onTap: () {
                      navigateToNextScreen("connect_account");
                    },
                  ),
                  _buildOptionCard(
                    title: "Make your first Top Up",
                    description: "Top up your Parent Wallet so you can send money to your kids",
                    isSelected: false,
                    onTap: () {
                      navigateToNextScreen("top_up");
                    },
                  ),
                  _buildOptionCard(
                    title: "Add Guardian",
                    description: "Add Your trusted Person as your Children's Guardian",
                    isSelected: false,
                    onTap: () {
                      navigateToNextScreen("add_child_photo");
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
              onChanged: (value) {
                onTap();
              },
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
      ),
    );
  }
}
