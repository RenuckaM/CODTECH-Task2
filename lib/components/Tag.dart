import 'package:flutter/material.dart';

class TagComponent extends StatefulWidget {
  final String label;
  final bool active;

  const TagComponent({super.key, required this.label, required this.active});

  @override
  State<TagComponent> createState() => _TagComponentState();
}

class _TagComponentState extends State<TagComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color:
            widget.active ? Colors.black : null, // Change background to black
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: widget.active
              ? Colors.transparent
              : Colors.black, // Update border
        ),
      ),
      child: Text(
        "#${widget.label}",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: widget.active
              ? Colors.white
              : Colors.black, // Change text color to blue
        ),
      ),
    );
  }
}
