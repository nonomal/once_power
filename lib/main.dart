import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/config.dart';
import 'constants/constants.dart';
import 'providers/toggle.dart';
import 'views/home.dart';

// TODO: 添加获取图片尺寸添加到名称的功能
// TODO: 视频播放完毕播放按钮没变
// TODO: 视频播放时间没变
// TODO: 修复了图片预览模糊的问题
// TODO: 视频进度条拖动不准确
// TODO: 大小写切换时在单词之间添加符号
// TODO: 指令可以禁用而不需删除

void main(List<String> args) async {
  await AppConfig.init(args);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderRadiusFrames(
      child: MaterialApp(
        title: AppText.name,
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.light,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        localizationsDelegates: LanguageConfig.localizationsDelegates,
        supportedLocales: LanguageConfig.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          return LanguageConfig.localeResolutionCallback(
            context,
            locale!,
            supportedLocales,
          );
        },
        home: const HomeView(),
      ),
    );
  }
}

class BorderRadiusFrames extends ConsumerWidget {
  const BorderRadiusFrames({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isMax = ref.watch(isMaxProvider);

    BoxDecoration decoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      boxShadow: [BoxShadow(color: Color(0x33000000), blurRadius: 8)],
    );

    return Container(
      margin: isMax ? EdgeInsets.zero : const EdgeInsets.all(8),
      clipBehavior: isMax ? Clip.none : Clip.antiAliasWithSaveLayer,
      decoration: isMax ? null : decoration,
      child: child,
    );
  }
}
