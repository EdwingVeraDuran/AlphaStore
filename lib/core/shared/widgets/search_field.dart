import 'dart:async';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class SearchField extends StatefulWidget {
  final String placeholder;
  final Function(String) onChanged;
  final Duration debounceTime;

  const SearchField({
    super.key,
    required this.placeholder,
    required this.onChanged,
    this.debounceTime = const Duration(milliseconds: 500),
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(widget.debounceTime, () {
      widget.onChanged(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextField(
        placeholder: Text(widget.placeholder),
        controller: _controller,
        features: [
          InputFeature.leading(Icon(LucideIcons.search)),
          InputFeature.trailing(
            IconButton.text(
              icon: Icon(LucideIcons.x),
              size: ButtonSize.small,
              onPressed: () {
                _controller.clear();
                _onSearchChanged(_controller.text);
              },
            ),
          ),
        ],
        onChanged: _onSearchChanged,
      ),
    );
  }
}
