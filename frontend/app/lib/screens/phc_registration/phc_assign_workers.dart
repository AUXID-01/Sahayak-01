import 'package:flutter/material.dart';

class PHCAssignWorkersPage extends StatefulWidget {
  @override
  _PHCAssignWorkersPageState createState() => _PHCAssignWorkersPageState();
}

class _PHCAssignWorkersPageState extends State<PHCAssignWorkersPage> {
  final _formKey = GlobalKey<FormState>();

  List<String> _selectedAshaWorkers = [];
  bool _autoAssign = true;
  final _notesController = TextEditingController();

  final List<String> _ashaWorkers = [
    'Rekha Devi (ASHA-201)',
    'Suman Kumari (ASHA-202)',
    'Kavita Singh (ASHA-203)',
    'Neha Sharma (ASHA-204)',
    'Anita Das (ASHA-205)',
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  // ✅ FIXED — Now uses StatefulBuilder so checkboxes update inside the sheet
  void _showMultiSelectSheet() {
    List<String> tempSelected = List.from(_selectedAshaWorkers);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 40,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Select ASHA Workers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // Scrollable checkbox list
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _ashaWorkers.length,
                      itemBuilder: (context, index) {
                        final worker = _ashaWorkers[index];
                        final selected = tempSelected.contains(worker);

                        return CheckboxListTile(
                          value: selected,
                          title: Text(worker),
                          activeColor: Colors.teal,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (checked) {
                            setModalState(() {
                              if (checked == true) {
                                tempSelected.add(worker);
                              } else {
                                tempSelected.remove(worker);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Confirm button
                  ElevatedButton.icon(
                    icon: const Icon(Icons.check_circle_outline),
                    label: Text(
                      'Confirm Selection (${tempSelected.length})',
                      style: const TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedAshaWorkers = List.from(tempSelected);
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasSelection = _selectedAshaWorkers.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign / Edit ASHA Workers'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Assign ASHA Workers to this PHC',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),

              // Multi-select field (opens modal)
              GestureDetector(
                onTap: _showMultiSelectSheet,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Select ASHA Workers',
                    prefixIcon: const Icon(Icons.woman_2_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: hasSelection
                      ? Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: _selectedAshaWorkers
                              .map(
                                (worker) => Chip(
                                  label: Text(
                                    worker,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  backgroundColor: Colors.teal.shade50,
                                  deleteIcon: const Icon(Icons.close, size: 16),
                                  onDeleted: () {
                                    setState(() {
                                      _selectedAshaWorkers.remove(worker);
                                    });
                                  },
                                ),
                              )
                              .toList(),
                        )
                      : const Text(
                          'Tap to select ASHA workers',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                ),
              ),
              const SizedBox(height: 20),

              // Auto-assign switch
              SwitchListTile(
                title: const Text('Enable Auto-Assignment'),
                subtitle: const Text(
                  'Automatically match ASHA workers based on availability',
                ),
                value: _autoAssign,
                onChanged: (val) {
                  setState(() => _autoAssign = val);
                },
              ),
              const SizedBox(height: 16),

              // Notes field
              TextFormField(
                controller: _notesController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Additional Notes / Resources',
                  hintText: 'e.g., Assign kits, transport schedule',
                  prefixIcon: const Icon(Icons.notes_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text('Next', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_selectedAshaWorkers.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please select at least one ASHA worker',
                          ),
                        ),
                      );
                      return;
                    }

                    Navigator.pushNamed(context, '/phc/professional_info');
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
