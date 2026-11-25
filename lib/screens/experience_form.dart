import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _experienceName = "";
  String _description = "";
  String _category = "Other"; // default
  String _timeline = "";
  String _experienceLink = "";
  final _timelineText = TextEditingController();

  final List<String> _categories = [
    'Internship',
    'Research',
    'Volunteer',
    'Part-Time',
    'Full-Time',
    'Freelance',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Experience Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      // Drawer
      drawer: const LeftDrawer(),

      // Body
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Experience Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Experience (Ex: Staff - Pengabdian Masyarakat BEM UI)",
                    labelText: "Nama Experience",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // Input
                  onChanged: (String? value) {
                    setState(() {
                      _experienceName = value!;
                    });
                  },

                  // Validator
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama experience tidak boleh kosong!";
                    }
                    if (value.trim().length > 100) {
                      return "Nama experience maksimal 100 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Experience Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Experience (Ex: Person In Charge (PIC) of Dorakula (Donor Darah Abis Kuliah)",
                    labelText: "Deskripsi Experience",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // Input
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },

                  // Validator
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi experience tidak boleh kosong!";
                    }
                    if (value.trim().length < 10) {
                      return "Deskripsi minimal 10 karakter!";
                    }
                    if (value.trim().length > 500) {
                      return "Deskripsi maksimal 500 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === Experience Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori Experience",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // Dropdown
                  initialValue: _category, // "Other"
                  items: _categories
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // === Experience Timeline ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                // ReadOnly Field
                child: TextFormField(
                  controller: _timelineText,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tanggal Experience",
                    hintText: "Pilih tanggal (Ex: 21-07-2007)",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  // OnTap
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1927),
                      lastDate: DateTime(2027),
                    );

                    if (pickedDate != null) {
                      final text =
                          "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                      setState(() {
                        _timeline = text;
                        _timelineText.text = text; // Mengubah teks
                      });
                    }
                  },

                  // Validator
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tanggal wajib dipilih!";
                    }
                    return null;
                  },
                ),
              ),

              // === Experience Link ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Experience (opsional)",
                    labelText: "Tautan Experience",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _experienceLink = value!;
                    });
                  },
                  validator: (String? value) {
                    final link = value?.trim() ?? "";

                    // Opsional (kosong boleh)
                    if (link.isEmpty) return null;

                    final uri = Uri.tryParse(link);
                    final isValid =
                        uri != null &&
                        (uri.isScheme('http') || uri.isScheme('https')) &&
                        uri.host.isNotEmpty;
                    if (!isValid) {
                      return "Format URL tidak valid (Ex: https://example.com)";
                    }
                    return null;
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                'Experience berhasil ditambahkan!',
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama Experience: $_experienceName'),
                                    Text('Deskripsi: $_description'),
                                    Text('Kategori: $_category'),
                                    Text('Waktu: $_timeline'),
                                    Text('Tautan: $_experienceLink'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
