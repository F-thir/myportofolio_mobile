import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  final Color colorHoverText;

  ItemHomepage(
    this.name,
    this.icon,
    this.color, {
    this.colorHoverText = Colors.yellowAccent,
  });
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
        onTap: () async {
          // Navigate ke halaman yang sesuai
          if (item.name == "Tambah Proyek") {
            final ok = await ensureLoggedIn(context);
            if (!ok || !context.mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectFormPage()),
            );
          } else if (item.name == "Lihat Proyek") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProjectListScreen(),
              ),
            );
          } else if (item.name == "Tambah Experience") {
            final ok = await ensureLoggedIn(context);
            if (!ok || !context.mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ExperienceFormPage(),
              ),
            );
          } else if (item.name == 'Login') {
            if (context.read<AuthState>().isLoggedIn) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('You are already logged in.')),
                );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          } else if (item.name == "Login") {
            final ok = await ensureLoggedIn(context);
            if (!ok || !context.mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ExperienceFormPage(),
              ),
            );
          } else if (item.name == "Logout") {
            final auth = context.read<AuthState>();
            final messenger = ScaffoldMessenger.of(context);
            if (!auth.isLoggedIn) {
              messenger.showSnackBar(
                const SnackBar(content: Text('You are not logged in.')),
              );
              return;
            }
            await auth.logout();
            messenger.showSnackBar(
              const SnackBar(content: Text('You have been logged out.')),
            );
          } else {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!"),
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
                Icon(item.icon, color: contentColor, size: 30.0),
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
