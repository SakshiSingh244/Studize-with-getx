import 'package:flutter/material.dart';

class SlidingButton extends StatelessWidget {
  final bool isOn;
  final VoidCallback onToggle;

  const SlidingButton({
    required this.isOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        width: 40.0,
        height: 20.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isOn ? Colors.green : Colors.red,
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 300),
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 16.0,
            height: 16.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
