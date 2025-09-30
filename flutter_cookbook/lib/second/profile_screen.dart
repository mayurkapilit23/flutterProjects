import 'package:flutter/material.dart';
import 'package:flutter_cookbook/second/helper%20widgets/star.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const beach =
      'https://images.unsplash.com/photo-1495954484750-af469f2f9be5?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  static const dog =
      'https://images.unsplash.com/photo-1536164261511-3a17e671d380?q=80&w=382&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(ProfileScreen.beach),
          Transform.translate(
            offset: Offset(0, 100),

            child: Column(
              children: [
                _buildProfileImage(context),
                _buildProfileDetails(context),
                _buildActions(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildProfileImage(BuildContext context) {
  return SizedBox(
    width: 200,
    height: 200,
    child: ClipOval(
      child: Image.network(ProfileScreen.dog, fit: BoxFit.fitWidth),
    ),
  );
}

Widget _buildProfileDetails(BuildContext context) {
  return Padding(
    padding: EdgeInsetsGeometry.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Wolfram Barkovich',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
        ),
        StarRating(value: 5),

        _buildDetailsRow('Age', '4'),
        _buildDetailsRow('Status', 'Good Boy'),
      ],
    ),
  );
}

Widget _buildDetailsRow(String heading, String value) {
  return Row(
    children: [
      Text('$heading: ', style: TextStyle(fontWeight: FontWeight.bold)),
      Text(value),
    ],
  );
}

Widget _buildActions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildIcon(Icons.restaurant, 'Feed'),
      _buildIcon(Icons.favorite, 'Pet'),
      _buildIcon(Icons.directions_walk, 'Walk'),
    ],
  );
}

Widget _buildIcon(final icon, String text) {
  return Padding(
    padding: EdgeInsetsGeometry.all(20),
    child: Column(children: [Icon(icon, size: 40), Text(text)]),
  );
}
