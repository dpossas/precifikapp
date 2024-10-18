import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CPFMaskFormatter {
  static MaskTextInputFormatter get mask => MaskTextInputFormatter(
        mask: '###.###.###-##',
        filter: {'#': RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy,
      );
}
