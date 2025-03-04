import 'package:chinese_font_library/chinese_font_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_power/constants/num.dart';
import 'package:once_power/core/core.dart';
import 'package:once_power/generated/l10n.dart';
import 'package:once_power/model/enum.dart';
import 'package:once_power/provider/file.dart';
import 'package:once_power/widgets/common/easy_text_btn.dart';

import 'detail_ext_area.dart';
import 'path_classify_list.dart';

class TypeDetailPanel extends ConsumerWidget {
  const TypeDetailPanel(this.type, {super.key});

  final int type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String titleLabel =
        type == 0 ? S.of(context).detailTitle : S.of(context).allFolderTitle;
    final String removeUncheckLabel = S.of(context).removeUnselected;
    final String removeCheckLabel = S.of(context).removeSelected;
    final String checkReserveLabel = S.of(context).selectReserve;
    final String selectSwitchLabel = S.of(context).selectAllSwitch;
    final String exitOperationLabel = S.of(context).exitOperation;

    Map<FileClassify, List<String>> extMap =
        ref.watch(extensionListMapProvider);

    TextStyle titleStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).primaryColor,
    ).useSystemChineseFont();

    const double gepM = AppNum.mediumG;

    void removeUncheck() {
      ref.read(fileListProvider.notifier).removeUncheck();
      if (ref.watch(fileListProvider).isEmpty) {
        Navigator.pop(context);
      }
    }

    void removeCheck() {
      ref.read(fileListProvider.notifier).removeCheck();
      if (ref.watch(fileListProvider).isEmpty) {
        Navigator.pop(context);
      }
    }

    void quit() {
      Navigator.pop(context);
    }

    return UnconstrainedBox(
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: AppNum.detailDialogW,
          height: AppNum.detailDialogH,
          padding: const EdgeInsets.all(AppNum.detailDialogP),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(titleLabel, style: titleStyle),
              const SizedBox(height: AppNum.largeG),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: type == 0
                        ? extMap.entries.map((e) {
                            return DetailExtArea(
                              label: e.key.value,
                              extList: e.value,
                            );
                          }).toList()
                        : [PathClassifyList()],
                  ),
                ),
              ),
              const SizedBox(height: gepM),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: gepM,
                children: [
                  EasyTextBtn(removeUncheckLabel, onTap: removeUncheck),
                  EasyTextBtn(removeCheckLabel, onTap: removeCheck),
                  EasyTextBtn(
                    checkReserveLabel,
                    onTap: () {
                      ref.read(fileListProvider.notifier).checkReverse();
                      updateName(ref);
                      updateExtension(ref);
                    },
                  ),
                  EasyTextBtn(selectSwitchLabel, onTap: () => selectAll(ref)),
                  EasyTextBtn(exitOperationLabel, onTap: quit),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
