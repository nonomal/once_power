import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:once_power/cores/update_name.dart';
import 'package:once_power/models/app_enum.dart';
import 'package:once_power/models/file_info.dart';
import 'package:once_power/providers/file.dart';
import 'package:once_power/providers/select.dart';
import 'package:video_player/video_player.dart';

import 'loading_image.dart';

class VideoView extends ConsumerStatefulWidget {
  const VideoView({super.key, required this.file});

  final FileInfo file;

  @override
  ConsumerState<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends ConsumerState<VideoView>
    with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.file.filePath))
      ..initialize().then((_) {
        final size = _controller.value.size;
        Resolution resolution =
            Resolution(size.width.toInt(), size.height.toInt());
        ref
            .read(fileListProvider.notifier)
            .updateResolution(widget.file.id, resolution);

        if (ref.watch(currentModeProvider).isAdvance) updateName(ref);
        setState(() {});
      })
      ..addListener(() {
        if (_controller.value.isCompleted) {
          _controller.pause();
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget child = _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: ColoredBox(
              color: Colors.black,
              child: Stack(
                children: [
                  VideoPlayer(_controller),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause_circle_filled_rounded
                            : Icons.play_circle_fill_rounded,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Center(child: LoadingImage(isPreview: false));
    if (!widget.file.checked) return Opacity(opacity: .5, child: child);
    return child;
  }

  @override
  bool get wantKeepAlive => true;
}
