import 'package:alpha_store/core/layout/widgets/section_title.dart';
import 'package:alpha_store/core/theme/presentation/widgets/theme_section.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SectionTitle(label: 'Configuración', icon: LucideIcons.settings),
      content: Container(
        padding: EdgeInsets.only(top: 16),
        constraints: BoxConstraints(maxWidth: 400),
        child: Column(children: [ThemeSection()]),
      ),
    );
  }
}
