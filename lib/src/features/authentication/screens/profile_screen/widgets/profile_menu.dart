import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../../constants/colors.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    this.endIcon = true,
    required this.onPress,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? FAppColors.fPrimaryColor : FAppColors.fblueAccent;
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(110),
          color: iconColor.withOpacity(0.3),
        ),
        child: Icon(icon, color: iconColor, 
        ),
      ),
      title: Text(
        title,
        style:
            const TextStyle(fontSize: 20).apply(color: textColor), //textcolor
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.3),
              ),
              child:  const Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
                color: Colors.grey,
                
              ),
              
              
            )
          : null, // if endIcon not passed it will be null
    );
  }
}
