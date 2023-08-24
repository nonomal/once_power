import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:once_power/model/enum.dart';
import 'package:once_power/provider/toggle.dart';

(int, int) lengthMatchNum(String match, String name) {
  int start = 0, end = 0;
  bool isDigit = int.tryParse(match.replaceAll(' ', '')) != null;
  if (isDigit) {
    bool hasSpace = match.trim().contains(' ');
    start = hasSpace ? int.parse(match.split(' ').first) - 1 : 0;
    start = start > name.length - 1 ? name.length - 1 : start;
    end = hasSpace ? int.parse(match.split(' ').last) : int.parse(match);
    end = end > name.length ? name.length : end;
  } else {
    end = match.length > name.length ? name.length : match.length;
  }
  return (start < 0 ? 0 : start, end < 0 ? 0 : end);
}

/// 替换模式
String replaceName(String match, String modify, String name, bool isLength,
    bool matchCase, String? dateText) {
  if (match.trim() == '') return name;
  modify = dateText ?? modify;
  if (isLength) {
    var (start, end) = lengthMatchNum(match, name);
    name = start == 0
        ? modify + name.substring(end)
        : name.substring(0, start) + modify + name.substring(end);
  }
  if (!isLength) {
    name = removeAndReplaceMatchedStrings(match, modify, name, matchCase);
  }
  return name;
}

String removeAndReplaceMatchedStrings(
    String pattern, String replacement, String input, bool matchCase) {
  // 创建正则表达式，设置为不区分大小写
  RegExp regex = RegExp(pattern, caseSensitive: matchCase);
  // 使用replaceAllMapped方法将匹配到的字符串替换，并执行自定义操作
  String result = input.replaceAllMapped(regex, (Match match) {
    // 替换为指定的replacement字符串，并将其转为小写形式
    return replacement.toLowerCase();
  });
  return result;
}

/// 保留模式
String reserveName(WidgetRef ref, String match, String name, bool isLength,
    bool matchCase, String? dateText) {
  List<ReserveType> typeList = ref.watch(currentReserveTypeProvider);
  if (typeList.isEmpty && dateText != null) return dateText;
  if (typeList.isNotEmpty) {
    name = reserveTypeString(typeList, name);
  } else {
    if (!isLength) name = getMatchedStrings(match, name, matchCase);
    if (isLength) {
      var (start, end) = lengthMatchNum(match, name);
      name = name.substring(start, end);
    }
  }
  return name;
}

String getMatchedStrings(String pattern, String input, bool matchCase) {
  // 创建正则表达式，设置为不区分大小写
  RegExp regex = RegExp(pattern, caseSensitive: matchCase);
  // 使用allMatches方法获取所有匹配的字符串
  Iterable<Match> matches = regex.allMatches(input);
  // 从匹配中提取字符串并返回
  List<String?> matchedStrings = matches.map((m) => m.group(0)).toList();
  return matchedStrings.isEmpty ? '' : matchedStrings.join('');
}

String reserveTypeString(List<ReserveType> typeList, String name) {
  bool lowercase = typeList.contains(ReserveType.lowercaseLetter);
  bool capital = typeList.contains(ReserveType.capitalLetter);
  bool digit = typeList.contains(ReserveType.digit);
  bool nonLetter = typeList.contains(ReserveType.nonLetter);
  bool punctuation = typeList.contains(ReserveType.punctuation);
  String pattern = "";
  if (!lowercase) pattern += "a-z";
  if (!capital) pattern += "A-Z";
  if (!digit) pattern += "0-9";
  if (!nonLetter) {
    // 中文、日文、朝鲜文、藏文
    pattern +=
        r"\u4e00-\u9fff\u3040-\u309f\u30a0-\u30ff\uac00-\ud7af\u0f00-\u0fff";
  }
  if (!punctuation) {
    pattern += r"()\~!@#\$%\^&,'\.;_\[\]`\{\}\-=+！，。？：、‘’“”（）【】{}<>《》「」";
  }
  RegExp reg = RegExp("[$pattern]");
  return name.replaceAll(reg, "");
}

/// 删除模式
String removeName(
    RemoveType type, String match, String name, bool isLength, bool matchCase) {
  int start = 0, end = 0;
  if (isLength) (start, end) = lengthMatchNum(match, name);
  if (type == RemoveType.match) {
    if (isLength) {
      name = start == 0
          ? name.substring(end)
          : name.substring(0, start) + name.substring(end);
    }
    if (!isLength) name = removeMatchedStrings(match, name, matchCase);
  }
  if (type == RemoveType.before) {
    if (isLength) name = name.substring(start);
    if (!isLength) {
      int index = matchCase
          ? name.lastIndexOf(match)
          : name.toLowerCase().lastIndexOf(match.toLowerCase());
      if (index != -1) name = name.substring(index);
    }
  }
  if (type == RemoveType.after) {
    if (isLength) name = name.substring(0, end);
    if (!isLength) {
      int index = matchCase
          ? name.indexOf(match)
          : name.toLowerCase().indexOf(match.toLowerCase());
      if (index != -1) name = name.substring(0, index + 1);
    }
  }
  if (type == RemoveType.middle) {
    if (isLength) {
      String front = name.substring(0, start);
      String back = name.substring(end);
      name = front + back;
    }
    if (!isLength) {
      int index = matchCase
          ? name.indexOf(match)
          : name.toLowerCase().indexOf(match.toLowerCase());
      int lastIndex = matchCase
          ? name.lastIndexOf(match)
          : name.toLowerCase().lastIndexOf(match.toLowerCase());
      if (index != -1 && index != lastIndex) {
        String front = name.substring(0, index + match.length);
        String back = name.substring(lastIndex);
        name = front + back;
      }
    }
  }
  return name;
}

String removeMatchedStrings(String pattern, String input, bool caseSensitive) {
  // 创建正则表达式，设置为不区分大小写
  RegExp regex = RegExp(pattern, caseSensitive: caseSensitive);
  // 使用replaceAll方法将匹配到的字符串替换为空字符串
  String result = input.replaceAll(regex, '');
  return result;
}