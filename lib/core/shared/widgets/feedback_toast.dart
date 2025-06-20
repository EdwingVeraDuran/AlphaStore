import 'package:shadcn_flutter/shadcn_flutter.dart';

class FeedbackToast extends StatelessWidget {
  final String title;
  final String subtitle;
  final ToastOverlay overlay;
  const FeedbackToast({
    super.key,
    required this.title,
    required this.subtitle,
    required this.overlay,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Basic(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: PrimaryButton(
          size: ButtonSize.small,
          onPressed: () => overlay.close(),
          child: Text('Cerrar'),
        ),
        trailingAlignment: Alignment.center,
      ),
    );
  }
}


//TODO: add toast into app