import 'package:dnd_app/domain/entities/dnd/specifics/class.dart';
import 'package:dnd_app/presentation/providers/class_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClassScreen extends ConsumerStatefulWidget {
  final String classId;
  const ClassScreen({super.key, required this.classId});

  @override
  ClassScreenState createState() => ClassScreenState();
}

class ClassScreenState extends ConsumerState<ClassScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(classInfoProvider.notifier).loadClass(widget.classId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Class? classes = ref.watch(classInfoProvider)[widget.classId];

    if (classes == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Text(classes.name ?? ''),
      ),
    );
  }
}
