import 'package:flutter/material.dart';

import 'package:say_hi/utility/widgets/info.dart';
import 'package:say_hi/screens/chat_screen.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: info.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )),
                child: ListTile(
                  title: Text(
                    info[index]['name'].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      info[index]['message'].toString(),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 35.0,
                    backgroundImage:
                        NetworkImage(info[index]['profilePic'].toString()),
                  ),
                  trailing: Text(
                    info[index]['time'].toString(),
                    style: const TextStyle(fontSize: 13),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MobileChatScreen(),
                    ));
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
