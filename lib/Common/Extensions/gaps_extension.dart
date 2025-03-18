import 'package:flutter/cupertino.dart';

extension GapExtensionNumber on int{
  Widget get gW => SizedBox(width: toDouble(),);
  Widget get gH => SizedBox(height: toDouble(),);
}
//