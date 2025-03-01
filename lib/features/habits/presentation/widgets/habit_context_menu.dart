import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';
import '../../domain/models/habit.dart';
import '../cubit/habit_list_cubit.dart';

class HabitContextMenu extends StatelessWidget {
  final Habit habit;
  final VoidCallback onDismiss;
  final Offset position;
  final Size size;

  const HabitContextMenu({
    super.key,
    required this.habit,
    required this.onDismiss,
    required this.position,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blur background
        Positioned.fill(
          child: GestureDetector(
            onTap: onDismiss,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
        ),
        // Menu items
        Positioned(
          top: position.dy,
          left: position.dx,
          width: size.width,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _MenuItem(
                    icon: Icons.edit,
                    title: 'Edit'.tr(),
                    onTap: () {
                      onDismiss();
                      Navigator.pushNamed(
                        context,
                        '/edit-habit',
                        arguments: habit,
                      );
                    },
                  ),
                  const Divider(height: 1),
                  _MenuItem(
                    icon: habit.isArchived ? Icons.unarchive : Icons.archive,
                    title: habit.isArchived ? 'Unarchive'.tr() : 'Archive'.tr(),
                    onTap: () async {
                      final updatedHabit = habit.copyWith(
                        isArchived: !habit.isArchived,
                      );
                      await context
                          .read<HabitListCubit>()
                          .updateHabit(updatedHabit);
                      onDismiss();
                    },
                  ),
                  const Divider(height: 1),
                  _MenuItem(
                    icon: Icons.delete,
                    title: 'Delete'.tr(),
                    color: Theme.of(context).colorScheme.error,
                    onTap: () {
                      onDismiss();
                      _showDeleteConfirmation(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showDeleteConfirmation(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Habit'.tr()),
        content: Text('Are you sure you want to delete this habit?'.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'.tr()),
          ),
          TextButton(
            onPressed: () {
              context.read<HabitListCubit>().deleteHabit(habit.id);
              Navigator.pop(context);
            },
            child: Text(
              'Delete'.tr(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? color;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.onSurface;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: effectiveColor),
            const SizedBox(width: 12),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: effectiveColor),
            ),
          ],
        ),
      ),
    );
  }
}

void showHabitContextMenu({
  required BuildContext context,
  required Habit habit,
  required Offset position,
  required VoidCallback onDeleted,
}) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  showMenu(
    context: context,
    position: RelativeRect.fromRect(
      Rect.fromPoints(position, position),
      Offset.zero & overlay.size,
    ),
    items: [
      PopupMenuItem(
        onTap: () => context.push('/habit/${habit.id}'),
        child: Row(
          children: [
            const Icon(Icons.edit),
            const SizedBox(width: 8),
            Text('Edit'.tr()),
          ],
        ),
      ),
      PopupMenuItem(
        onTap: onDeleted,
        child: Row(
          children: [
            const Icon(Icons.delete, color: Colors.red),
            const SizedBox(width: 8),
            Text('Delete'.tr()),
          ],
        ),
      ),
    ],
  );
}
