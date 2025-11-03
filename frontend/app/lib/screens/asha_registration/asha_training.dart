import 'package:flutter/material.dart';

class ASHATrainingPage extends StatefulWidget {
  @override
  _ASHATrainingPageState createState() => _ASHATrainingPageState();
}

class _ASHATrainingPageState extends State<ASHATrainingPage> {
  final _yearsController = TextEditingController();
  DateTime? _lastTrainingDate;

  // Function to show date picker
  Future<void> _pickTrainingDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _lastTrainingDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _lastTrainingDate) {
      setState(() {
        _lastTrainingDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ASHA: Training')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Years Served (numeric input)
            TextFormField(
              controller: _yearsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Years Served',
                hintText: 'Enter number of years',
                prefixIcon: Icon(Icons.calendar_today_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Last Training Date (calendar picker)
            GestureDetector(
              onTap: () => _pickTrainingDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Training Date',
                    hintText: 'Select training date',
                    prefixIcon: Icon(Icons.date_range_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  controller: TextEditingController(
                    text: _lastTrainingDate == null
                        ? ''
                        : '${_lastTrainingDate!.day}/${_lastTrainingDate!.month}/${_lastTrainingDate!.year}',
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Next Button
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.arrow_forward),
                label: Text('Next'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, '/asha/review'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
