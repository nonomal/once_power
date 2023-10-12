import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_power/constants/constants.dart';
import 'package:once_power/provider/provider.dart';
import 'package:once_power/utils/utils.dart';
import 'package:once_power/widgets/input/input.dart';

class PrefixNumInput extends ConsumerWidget {
  const PrefixNumInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String prefixSwapTip = '交换前缀和递增数字位置';
    const String increaseLabel = '增数';

    // 位数
    const int defaultPrefixNumLength = 0;
    const String prefixNumLengthLabel = '位';
    // 开始数
    const int defaultPrefixNumStart = 0;
    const String prefixNumStartLabel = '开始';

    TextEditingController lengthController =
        ref.watch(prefixLengthControllerProvider);
    TextEditingController startController =
        ref.watch(prefixStartControllerProvider);

    void getLengthNum() async {
      updateName(ref);
      int num = int.parse(lengthController.text.replaceAll(prefixNumLengthLabel, ''));
      await StorageUtil.setInt(AppKeys.prefixLength, num);
    }

    void lengthNumInput(v) async{
      updateName(ref);
      await StorageUtil.setInt(AppKeys.prefixLength, int.parse(v));
    }

    void getStartNum() async {
      updateName(ref);
      int num = int.parse(startController.text.replaceAll(prefixNumStartLabel, ''));
      await StorageUtil.setInt(AppKeys.prefixStart, num);
    }

    void startNumInput(v) async{
      updateName(ref);
      await StorageUtil.setInt(AppKeys.prefixStart, int.parse(v));
    }

    void toggleSwap() {
      ref.read(swapPrefixProvider.notifier).update();
      updateName(ref);
    }

    return CommonInputMenu(
      label: increaseLabel,
      slot: Row(
        children: [
          Expanded(
            child: DigitInput(
              controller: lengthController,
              value: defaultPrefixNumLength,
              label: prefixNumLengthLabel,
              callback: getLengthNum,
              onChanged: lengthNumInput,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: DigitInput(
              controller: startController,
              value: defaultPrefixNumStart,
              label: prefixNumStartLabel,
              callback: getStartNum,
              onChanged: startNumInput,
            ),
          ),
        ],
      ),
      onChanged: (v) => updateName(ref),
      message: prefixSwapTip,
      icon: AppIcons.swap,
      selected: ref.watch(swapPrefixProvider),
      onTap: toggleSwap,
    );
  }
}