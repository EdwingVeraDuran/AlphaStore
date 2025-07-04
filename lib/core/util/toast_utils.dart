import 'package:shadcn_flutter/shadcn_flutter.dart';

void safeShowToast(
  BuildContext context, {
  required Widget Function(BuildContext, ToastOverlay) builder,
}) {
  final overlay = Overlay.of(context);
  final overlayContext = overlay.context;
  showToast(context: overlayContext, builder: (ctx, ov) => builder(ctx, ov));
}
