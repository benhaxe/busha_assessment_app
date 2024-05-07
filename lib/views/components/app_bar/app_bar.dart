import 'package:busha_app/src/extensions/src/context_on_theme_extension.dart';
import 'package:busha_app/src/values/assets/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.leadingCallbackAction,
    this.canPop = true,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Function? leadingCallbackAction;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: canPop
          ? UnconstrainedBox(
              child: InkWell(
                child: leading ?? SvgPicture.asset(kSVGAppBarBackButton),
                onTap: () =>
                    leadingCallbackAction ?? Navigator.of(context).pop(),
              ),
            )
          : null,
      title: title != null ? Text(title!) : null,
      centerTitle: true,
      titleTextStyle: context.textTheme.titleMedium,
      titleSpacing: 0,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
