import 'package:ecommerce/core/constants/app_colors.dart';
import 'package:ecommerce/screens/profile/setting/widgets/cool_theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSettingThemeCard extends StatelessWidget {
  final String title;
  final String? description;
  final String iconPath;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? iconColor;

  const AccountSettingThemeCard({
    super.key,
    required this.title,
    this.description,
    required this.iconPath,
    required this.value,
    required this.onChanged,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFF0F1F5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        // Theme wrapper removes the dark splash/highlight completely
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: ListTile(
            onTap: () => onChanged(!value),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            leading: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F6FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(
                iconPath,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  iconColor ?? AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            subtitle: description != null && description!.isNotEmpty
                ? Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                description!,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF8C919E),
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
                : null,
            trailing: CoolThemeSwitch(
              isDarkMode: value,
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }
}