import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_power/constants/num.dart';
import 'package:once_power/cores/list.dart';
import 'package:once_power/cores/update_name.dart';
import 'package:once_power/models/app_enum.dart';
import 'package:once_power/models/file_info.dart';
import 'package:once_power/providers/select.dart';
import 'package:once_power/views/content_bar/remove_btn.dart';
import 'package:once_power/widgets/common/easy_checkbox.dart';
import 'package:once_power/widgets/common/one_line_text.dart';
import 'package:once_power/widgets/content_bar/select_sort_card.dart';

class ContentListItem extends ConsumerWidget {
  const ContentListItem({super.key, required this.index, required this.file});

  final int index;
  final FileInfo file;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    bool isOrganize = ref.watch(currentModeProvider).isOrganize;
    String subtitle = isOrganize ? file.parent : file.newName;
    return SelectSortCard(
      index: index,
      file: file,
      onDoubleTap: () {},
      child: Container(
        height: 40,
        padding: EdgeInsets.only(left: 4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: AppNum.mediumG),
                child: EasyCheckbox(
                  checked: file.checked,
                  onChanged: (value) {
                    toggleCheck(ref, file.id);
                    updateName(ref);
                  },
                  child: OneLineText(file.name, fontSize: AppNum.tileFontSize),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  OneLineText(
                    subtitle,
                    fontSize: AppNum.tileFontSize,
                    color: isOrganize || file.name == file.newName
                        ? theme.textTheme.bodyMedium?.color
                        : theme.primaryColor,
                  ),
                  Container(
                    width: AppNum.extensionW,
                    alignment: Alignment.center,
                    child: Text(
                      file.newExtension,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        height: 1,
                        color: isOrganize || file.extension == file.newExtension
                            ? theme.textTheme.bodyMedium?.color
                            : theme.primaryColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            RemoveBtn(
              color: theme.unselectedWidgetColor,
              onTap: () => removeOne(ref, file.id),
            ),
          ],
        ),
      ),
    );
  }
}
