import 'package:flutter/Material.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions(
      {super.key, required this.actionName, required this.paddingLeft});
  final String actionName;
  final double paddingLeft;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.only(left: paddingLeft, right: 4),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white24
                    : Colors.black12,
                border: Border.all(width: 0),
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: Center(
                child: Text(actionName),
              ),
            ),
          ),
        ));
  }
}
