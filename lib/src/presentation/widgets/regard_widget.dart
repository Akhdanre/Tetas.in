import 'package:flutter/material.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Regards extends StatelessWidget {
  const Regards({super.key, required this.screen});

  final SizeConfig screen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: screen.vertical2,
        ),
        Text(AppLocalizations.of(context).greating,
            style: AppLocalizations.of(context).localeName == 'id'
                ? const TextStyle(fontSize: 35, fontWeight: FontWeight.w900)
                : const TextStyle(fontSize: 45, fontWeight: FontWeight.w900)),
        Text(
          AppLocalizations.of(context).account_message,
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: screen.vertical3,
        ),
      ],
    );
  }
}
