

import 'package:fit_lab/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
    super.key,
  });

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSize.fDefaultSize - 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Row(children: [
          Icon(
            btnIcon,
            size: 60,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, 
                style: const TextStyle(
                    fontSize: AppSize.fDefaultSize - 12,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subTitle, 
                style: const TextStyle(
                  fontSize: AppSize.fDefaultSize - 14,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
