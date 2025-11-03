import 'package:flutter/material.dart';

class PHCProfessionalInfoPage extends StatefulWidget {
  const PHCProfessionalInfoPage({Key? key}) : super(key: key);

  @override
  _PHCProfessionalInfoPageState createState() =>
      _PHCProfessionalInfoPageState();
}

class _PHCProfessionalInfoPageState extends State<PHCProfessionalInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _qualificationController = TextEditingController();
  final _experienceController = TextEditingController();
  DateTime? _joinDate;

  Future<void> _pickJoinDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _joinDate ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _joinDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _qualificationController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Professional Info')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _qualificationController,
                decoration: InputDecoration(
                  labelText: 'Qualification',
                  prefixIcon: Icon(Icons.school_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter qualification'
                    : null,
              ),
              const SizedBox(height: 16),

              GestureDetector(
                onTap: () => _pickJoinDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Join Date',
                      hintText: 'Select join date',
                      prefixIcon: Icon(Icons.calendar_today_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    controller: TextEditingController(
                      text: _joinDate == null
                          ? ''
                          : '${_joinDate!.day}/${_joinDate!.month}/${_joinDate!.year}',
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Select join date'
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _experienceController,
                decoration: InputDecoration(
                  labelText: 'Experience (years)',
                  prefixIcon: Icon(Icons.timelapse_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter experience';
                  if (int.tryParse(value) == null)
                    return 'Enter a valid number';
                  return null;
                },
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.arrow_forward_rounded),
                  label: Text('Next', style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Validation passed! (Demo only)'),
                        ),
                      );
                      Navigator.pushNamed(context, '/phc/review');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
