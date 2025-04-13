import 'package:flutter/material.dart';
import 'package:practica2/data/phone_repository.dart';
import 'package:practica2/domain/phone.dart';

class PhonesScreen extends StatelessWidget {
  PhonesScreen({super.key});

  final List<Phone> phones = phoneRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phones'),
      ),
      body: _PhonesListView(phones:phones),



    );
 
 
  }
}

class _PhonesListView extends StatelessWidget {
  const _PhonesListView({
    //super.key,
    required this.phones,
  });

  final List<Phone>phones;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: phones.length,itemBuilder: (context, index){
      return _PhoneItemView(phone: phones[index]); 
    }



    );
  }
}

class _PhoneItemView extends StatelessWidget {
  const _PhoneItemView({
    //super.key,
    required this.phone,
  });

  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: phone.posterUrl != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              phone.posterUrl!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          )
        : const SizedBox(
            width: 50,
            height: 50,
            child: Icon(Icons.phone_android),
          ),
      title: Text(phone.title),
      subtitle:Text(phone.brand),),
    );

  }
}