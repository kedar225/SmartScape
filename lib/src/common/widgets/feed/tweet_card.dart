import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TPostTile extends StatelessWidget {
  const TPostTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
                //Profile Picture
                Icon(Iconsax.profile),

                //Username
                Text("DummyUser123", style: Theme.of(context).textTheme.labelSmall,),
                ],
          ),
        ],
      ),
    );
  }
}
