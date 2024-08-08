import 'package:flutter/material.dart';

const int _kDuration = 300;
const double _kWidth = 70;
const double _kheight = 40;

class DayNightSwitch extends StatefulWidget {
  const DayNightSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;

  final ValueChanged<bool>? onChanged;

  @override
  State<DayNightSwitch> createState() => _DayNightSwitchState();
}

class _DayNightSwitchState extends State<DayNightSwitch> {
  @override
  Widget build(BuildContext context) {
    bool toggleState = widget.value;
    const dayColor = Colors.orangeAccent;
    const nightColor = Colors.blueAccent;

    return InkWell(
      onTap: () => setState(() {
        toggleState = !toggleState;
        widget.onChanged?.call(toggleState);
      }),
      customBorder: const StadiumBorder(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: _kDuration),
        width: _kWidth,
        height: _kheight,
        decoration: ShapeDecoration(
          color: toggleState ? dayColor : nightColor,
          shape: const StadiumBorder(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //day icon
              AnimatedOpacity(
                opacity: toggleState ? 1 : 0,
                duration: const Duration(milliseconds: _kDuration),
                child: AnimatedAlign(
                  alignment: toggleState
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  duration: const Duration(milliseconds: _kDuration),
                  child: const Icon(
                    Icons.circle,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),

              //night Icon
              AnimatedAlign(
                alignment:
                    toggleState ? Alignment.centerLeft : Alignment.centerRight,
                duration: const Duration(milliseconds: _kDuration),
                child: AnimatedRotation(
                  turns: toggleState ? 0.0 : 0.5,
                  duration: const Duration(milliseconds: _kDuration),
                  child: const Icon(
                    Icons.nightlight,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
