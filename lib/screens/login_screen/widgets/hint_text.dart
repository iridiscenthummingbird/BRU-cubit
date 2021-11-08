import 'package:bru/widgets/scalable_size.dart';
import 'package:flutter/material.dart';

// class HintText extends StatelessWidget {
//   HintText({Key? key, required String text})
//       : _text = text,
//         super(key: key);
//   final String _text;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       _text,
//       style: const TextStyle(
//         fontWeight: FontWeight.w500,
//         fontSize: 14,
//         color: Color(0xFF71883A),
//       ),
//     );
//   }
// }

class HintText extends Padding {
  HintText({Key? key, required BuildContext context, required String text})
      : super(
            key: key,
            padding: EdgeInsets.only(
              top: ScalableSize(context).getScalableWidth(15),
              left: ScalableSize(context).getScalableWidth(15),
              bottom: ScalableSize(context).getScalableWidth(5),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF71883A),
              ),
            ));
}
