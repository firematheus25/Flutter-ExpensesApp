import 'package:expenses/Components/AdaptativeButton.dart';
import 'package:expenses/Components/Adaptative_DatePicker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Adaptative_Text_Field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final tittleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = tittleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: tittleController,
                onSubmitted: (_) => _submitForm(),
                label: "Título",
              ),
              AdaptativeTextField(
                controller: valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                label: "Valor (R\$)",
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDanteChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                      label: "Nova Transação", onPressed: _submitForm),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
