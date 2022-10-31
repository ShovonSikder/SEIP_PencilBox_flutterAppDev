import 'package:class_21_flutter_d12/models/contact_model.dart';
import 'package:class_21_flutter_d12/pages/details_page.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function(int id) toggleFavorite;
  const ContactItem(
      {Key? key, required this.contact, required this.toggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: ListTile(
        onTap: () => Navigator.pushNamed(
          context,
          Details.routeName,
          arguments: contact,
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage(contact.img!),
          backgroundColor: Colors.white,
        ),
        title: Text(contact.name),
        trailing: IconButton(
          onPressed: () {
            toggleFavorite(contact.id);
          },
          icon: Icon(
            contact.favorite ? Icons.favorite : Icons.favorite_border,
            color: contact.favorite ? Colors.red : null,
          ),
        ),
      ),
    );
  }
}
