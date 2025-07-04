import 'package:alpha_store/core/shared/entities/feature_action.dart';
import 'package:alpha_store/core/shared/widgets/action_button.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ActionsBar extends StatelessWidget {
  final List<FeatureAction> actions;
  const ActionsBar({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < actions.length; i++) {
      children.add(
        ActionButton(
          icon: actions[i].icon,
          onPressed: actions[i].onPressed,
          label: actions[i].label,
        ),
      );

      if (i != actions.length - 1) {
        children.add(Gap(16));
      }
    }

    return Row(children: children);
  }
}
