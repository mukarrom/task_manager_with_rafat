import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_with_rafat/ui/utils/assets_utils.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SvgPicture.asset(
            AssetsUtils.background,
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}
