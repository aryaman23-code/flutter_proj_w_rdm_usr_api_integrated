import 'package:flutter/material.dart';
import 'package:api_flutter_working/model/user.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final String username;
  final List<User> users;
  final user;
  final Function() delete;
  const UserCard({
    required this.imageUrl,
    required this.username,
    required this.users,
    required this.user,
    required this.delete,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/description', arguments: {
          'users':users,
          'user':user,
          'imageUrl':imageUrl
        });
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(4, 5, 18, 5),
                child: Hero(
                  tag: UniqueKey().toString(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 20,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                      softWrap: true,
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      '${user.location.state} ${user.dob.date.toString().substring(0, 11)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                label: const Text('Delete'),
                icon: Icon(Icons.delete, size: 20, color: Colors.redAccent),
                onPressed: delete,
              )
            ],
          ),
        ),
      ),
    );
  }
}
