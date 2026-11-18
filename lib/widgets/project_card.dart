import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  final Color colorHoverText;

  ItemHomepage(this.name, this.icon, this.color, {this.colorHoverText = Colors.yellowAccent});
}

class ItemCard extends StatefulWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final Color contentColor = _isHovered ? item.colorHoverText : Colors.white;

    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Aksi ketika kartu dihover oleh pengguna.
        onHover: (hovering) => setState(() => _isHovered = hovering),
        // Aksi ketika kartu ditekan oleh pengguna.
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
          // Area responsif terhadap sentuhan
          // Navigate ke halaman yang sesuai
          if (item.name == "Tambah Proyek") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProjectFormPage(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon, 
                  color: contentColor, 
                  size: 30.0
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: contentColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

