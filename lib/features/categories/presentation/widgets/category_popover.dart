import 'package:alpha_store/core/shared/widgets/action_button.dart';
import 'package:alpha_store/features/categories/presentation/dialogs/create_category_popover.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CategoryPopover extends StatelessWidget {
  const CategoryPopover({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: LucideIcons.circlePlus,
      label: 'Crear categoría',
      onPressed:
          () => showPopover(
            context: context,
            alignment: Alignment.topCenter,
            offset: Offset(0, 8),
            builder: (context) => CreateCategoryPopover(),
          ),
    );
  }
}
