import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Constants.dart';
import '../../../../Core/AppColors.dart';
import '../../../../Core/AppFonts.dart';

class UserContainer extends StatelessWidget {
  const UserContainer(
      {super.key, this.name, this.login, required this.avatarUrl});

  final String? name;
  final String? login;
  final String? avatarUrl;
  final String emptyImageUrl =
      "https://www.google.com/search?sxsrf=APwXEdc6Ab-CcGYURLydD2FjvG2xru3OvQ:1686397133924&q=empty+image&tbm=isch&sa=X&ved=2ahUKEwj4qPjwzrj_AhXbVaQEHQc4DkgQ0pQJegQIDBAB&biw=1366&bih=653&dpr=1#imgrc=Om5MqfyAxBtPXM";

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        padding: kPaddingAll15,
        decoration: BoxDecoration(
          borderRadius: kbRadius15,
          color: AppColors.mainColor,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: kbRadiusHalf,
              child: CachedNetworkImage(
                width: 75,
                height: 75,
                progressIndicatorBuilder:
                    (context, String str, DownloadProgress progress) {
                  return Center(
                    child:
                        CircularProgressIndicator(color: AppColors.greyColor),
                  );
                },
                errorWidget: (context, String str, dynamic) {
                  return SvgPicture.asset(avatar);
                },
                imageUrl: avatarUrl ?? emptyImageUrl,
              ),
            ),
            const SizedBox(height: 20),
            Text(name ?? "Not Available"),
            const SizedBox(height: 10),
            Text(
              login ?? "Not Available",
              style: AppFonts.font12Grey,
            ),
          ],
        ),
      ),
    );
  }
}
