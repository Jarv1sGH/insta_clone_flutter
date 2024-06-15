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
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
              ),
              child: Center(
                child: Text(actionName),
              ),
            ),
          ),
        ));
  }
}
