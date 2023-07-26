import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';



class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String tittle;
  final Function press;
  const CategoryCard({
  super.key,
  this.svgSrc='',
  this.tittle='',
  required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child : Container(
          //padding : EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,

            boxShadow: [BoxShadow(offset: Offset(0,17),
              blurRadius: 17,
              spreadRadius: -23,
              color: FAppColors.kShadowColor,
            ),],
          ),
          child:Material(
            color: Colors.transparent,
            child:InkWell(
              onTap: press(),
              child:Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[

                    const Spacer(),
                    SvgPicture.asset(svgSrc),
                    const Spacer(),
                    Text(
                      tittle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                      !.copyWith(fontSize: 15),
                    ),

                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
