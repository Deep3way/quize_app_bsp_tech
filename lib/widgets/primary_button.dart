import 'package:flutter/material.dart';
import 'package:quize_app_bsp_tech/common/theme/app_css.dart';
import 'package:quize_app_bsp_tech/common/theme/colors.dart';


class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  // final EdgeInsetsGeometry? padding;
  final Color? Colors;
  final bool? isColors;
  final bool? isGreenText;

  const PrimaryButton(
      {super.key,
      required this.buttonText,
      required this.onClick,
      // this.padding,
      this.Colors,
      this.isColors,
      this.isGreenText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: isColors == true ? Colors : ColorName.gray,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(buttonText,
              textAlign: TextAlign.center,
              style: isColors == true
                  ? AppCss.montserrat14SemiBoldWhite
                  : AppCss.montserrat14SemiBoldWhite),
        )),
      ),
    );
  }
}
