// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:api_flutter_working/model/user.dart';
import 'package:api_flutter_working/services/user_apis.dart';
import 'package:api_flutter_working/user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    fetchusers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Rest Api',
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final image_url = user.pic.thumbnail;
            return UserCard(
                imageUrl: image_url,
                username: user.getFUllName(),
                users: users,
                user: user,
                delete: () {
                  setState(() {
                    users.remove(user);
                  });
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchusers,
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.refresh),
      ),
    );
  }
  Future<void> fetchusers() async {
    final response = await UserApi.fetchusers();
    setState(() {
      users = response;
    });
  }
}
