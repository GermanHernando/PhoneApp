import 'package:flutter/material.dart';
import 'package:practica2/data/phone_repository.dart';
import 'package:practica2/domain/phone.dart';

class PhonesDetailScreen extends StatelessWidget {
  PhonesDetailScreen({super.key, required this.phoneId});

String phoneId;
List<Phone> phones = phoneRepository;

  var phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Details'),
      ),
      body: _PhoneDetailView(phone: phones.firstWhere((phone) => phone.id == phoneId)));
      
        }
}

class _PhoneDetailView extends StatelessWidget {
  const _PhoneDetailView({
    //super.key, 
    required  this.phone,
  });
final Phone phone;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [
        if (phone.posterUrl != null)
          Image.network(phone.posterUrl!,
            height: 400,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
        Text(phone.title, style: textStyle.titleLarge),
        Text(phone.brand, style: textStyle.bodyLarge),
        Text(phone.year.toString()),
        
      ],
    );
  }
}