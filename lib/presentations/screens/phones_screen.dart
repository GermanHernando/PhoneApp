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
    super.key,
    required this.phones,
  });

  final List<Phone>phones;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: phones.length,itemBuilder: (context, index){
      return Text('Item $phones.length'); //Minuto 27:16
    }



    );
  }
}