import 'package:alpha_store/core/layout/widgets/section_title.dart';
import 'package:alpha_store/core/shared/widgets/operation_toast.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_state.dart';
import 'package:alpha_store/features/categories/presentation/widgets/categories_table.dart';
import 'package:alpha_store/features/categories/presentation/widgets/category_popover.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesBloc>().add(LoadCategories());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitle(label: 'Categorías', icon: LucideIcons.tag),
            CategoryPopover(),
          ],
        ),
        Gap(24),
        BlocConsumer<CategoriesBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CategoryError) {
              return Center(child: Text(state.message));
            }

            if (state is CategoryEmpty) {
              return Center(child: Text('No hay categorías'));
            }

            if (state is CategoryLoaded) {
              return CategoriesTable(state.categories);
            }

            return Center(
              child: IconButton.outline(
                icon: Icon(LucideIcons.refreshCcw),
                onPressed:
                    () => context.read<CategoriesBloc>().add(LoadCategories()),
              ),
            );
          },
          listener: (context, state) {
            if (state is CategoryFeedbackState) {
              showToast(
                context: context,
                builder:
                    (context, overlay) =>
                        OperationToast(overlay: overlay, status: state.status),
              );
            }
          },
        ),
      ],
    );
  }
}
