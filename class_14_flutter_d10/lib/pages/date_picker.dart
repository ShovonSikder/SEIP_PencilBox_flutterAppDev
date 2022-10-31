import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String? _date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_date == null ? 'No Date choosen' : _date!),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(onPressed: _pickDate, child: Text('Pick Date'))
          ],
        ),
      ),
    );
  }

  void _pickDate() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1922),
        lastDate: DateTime.now());
    // Future<DateTime?> date()=>

    if (selectedDate != null) {
      setState(() {
        _date = DateFormat('dd/MM/yyyy').format(selectedDate);
      });

      print(_date);
    }
  }
}
