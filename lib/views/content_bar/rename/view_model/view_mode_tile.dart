import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_power/constants/num.dart';
import 'package:once_power/core/core.dart';
import 'package:once_power/model/enum.dart';
import 'package:once_power/model/file_info.dart';
import 'package:once_power/provider/file.dart';
import 'package:once_power/utils/utils.dart';

import 'image_view.dart';
import 'preview_view.dart';
import 'video_view.dart';

class ViewModeTile extends ConsumerWidget {
  const ViewModeTile(this.files, this.file, {super.key});

  final List<FileInfo> files;
  final FileInfo file;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void previewView() {
      showDialog(
        context: context,
        builder: (context) => PreviewImageView(files, file),
      );
    }

    List<FileInfo> sortSelectList = ref.watch(sortSelectListProvider);
    BorderRadius borderRadius = BorderRadius.circular(4);
    Color selectedColor = Theme.of(context).primaryColor.withValues(alpha: .1);
    Color bgColor =
        sortSelectList.contains(file) ? selectedColor : Colors.transparent;
    String? indexLabel =
        sortSelectList.contains(file) && sortSelectList.length > 1
            ? '${sortSelectList.indexOf(file) + 1}'
            : null;

    void onPointerDown(PointerDownEvent event) {
      if (event.buttons == kPrimaryButton &&
          event.localPosition != Offset.zero) {
        Set keysPressed = HardwareKeyboard.instance.logicalKeysPressed;
        final isCtrlPressed =
            keysPressed.contains(LogicalKeyboardKey.controlLeft) ||
                keysPressed.contains(LogicalKeyboardKey.controlRight);
        final isShiftPressed =
            keysPressed.contains(LogicalKeyboardKey.shiftLeft) ||
                keysPressed.contains(LogicalKeyboardKey.shiftRight);
        if (isCtrlPressed) {
          // debugPrint('检测到Ctrl + 左键点击！');
          if (sortSelectList.contains(file)) {
            ref.read(sortSelectListProvider.notifier).remove(file);
          } else {
            ref.read(sortSelectListProvider.notifier).add(file);
          }
        } else if (isShiftPressed) {
          List<FileInfo> sortList = ref.read(sortListProvider);
          int beginIndex = 0;
          int endIndex = files.indexOf(file);
          if (sortSelectList.isNotEmpty) {
            beginIndex = sortList.indexOf(sortSelectList.first);
          }
          List<FileInfo> newSelectList = [];
          if (beginIndex < endIndex) {
            newSelectList.addAll(sortList.sublist(beginIndex, endIndex + 1));
          } else {
            newSelectList
                .addAll(sortList.sublist(endIndex, beginIndex + 1).reversed);
          }
          ref.read(sortSelectListProvider.notifier).clear();
          ref.read(sortSelectListProvider.notifier).addAll(newSelectList);
        } else {
          ref.read(sortSelectListProvider.notifier).one(file);
        }
      }
    }

    void onHover(bool hover) {
      if (hover) {
        bgColor = selectedColor;
        ref.read(sortHoverFileProvider.notifier).update(file);
      } else {
        if (!sortSelectList.contains(file)) {
          bgColor = Colors.transparent;
          ref.read(sortHoverFileProvider.notifier).update(null);
        }
      }
    }

    Future<void> onSecondaryTapDown(TapDownDetails details) async {
      bgColor = selectedColor;
      if (!sortSelectList.contains(file)) {
        ref.read(sortHoverFileProvider.notifier).update(file);
      }
      FileInfo? hoverFile = ref.watch(sortHoverFileProvider);
      if (hoverFile != null && !sortSelectList.contains(hoverFile)) {
        ref.read(sortSelectListProvider.notifier).one(hoverFile);
      }
      await showRightMenu(context, ref, details, file);
    }

    return Listener(
      onPointerDown: onPointerDown,
      child: Material(
        borderRadius: borderRadius,
        color: bgColor,
        child: Stack(
          children: [
            InkWell(
              borderRadius: borderRadius,
              onDoubleTap: previewView,
              onHover: onHover,
              onSecondaryTapDown: onSecondaryTapDown,
              hoverColor: selectedColor,
              focusColor: selectedColor,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 4, right: 4, top: 0, bottom: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: file.type == FileClassify.image
                            ? ImageView(file: file, key: ValueKey(file.id))
                            : VideoView(file: file, key: ValueKey(file.id)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        getFileName(file.newName, file.newExtension),
                        style: TextStyle(
                          fontSize: AppNum.tileFontSize,
                          color: file.checked ? Colors.black : Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (indexLabel != null)
              Badge(
                alignment: Alignment.topRight,
                isLabelVisible: file.checked,
                backgroundColor: Theme.of(context).primaryColor,
                label: Text(indexLabel),
              ),
          ],
        ),
      ),
    );
  }
}
