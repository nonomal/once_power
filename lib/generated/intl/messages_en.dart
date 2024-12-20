// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(file) => "【${file}】 has been deleted";

  static String m1(name) => " The file renamed to ${name} already exists";

  static String m2(name) => " renaming failed, Because ${name}";

  static String m3(count, total) =>
      "${count} out of ${total} selected renames failed";

  static String m4(count, total) => "Selected ${count}/${total}";

  static String m5(version) => "New version ${version} can be updated";

  static String m6(name) => "No longer exists in ${name}";

  static String m7(total) => "Successfully moved the selected ${total} files";

  static String m8(count) => "Removed ${count} non image or video files";

  static String m9(total) =>
      "All ${total} selected items have been successfully renamed";

  static String m10(count, total) =>
      "${count} out of ${total} selected undo renames failed";

  static String m11(total) =>
      "The selected ${total} operations have all been revoked";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addFile": MessageLookupByLibrary.simpleMessage("Add file"),
        "addFolder": MessageLookupByLibrary.simpleMessage("Add folder"),
        "addSubfolder": MessageLookupByLibrary.simpleMessage(
            "Gets the subfolder of the folder"),
        "after": MessageLookupByLibrary.simpleMessage("After"),
        "allExtension": MessageLookupByLibrary.simpleMessage("All Extension"),
        "appendMode": MessageLookupByLibrary.simpleMessage("Append"),
        "applyChange": MessageLookupByLibrary.simpleMessage("Apply"),
        "audio": MessageLookupByLibrary.simpleMessage("Audio"),
        "before": MessageLookupByLibrary.simpleMessage("Before"),
        "between": MessageLookupByLibrary.simpleMessage("Between"),
        "caseClassify": MessageLookupByLibrary.simpleMessage("Case classify"),
        "caseDesc": MessageLookupByLibrary.simpleMessage("Case sensitive"),
        "caseExtension": MessageLookupByLibrary.simpleMessage("Case extension"),
        "checkCompleted":
            MessageLookupByLibrary.simpleMessage("Check completed"),
        "checkFailed": MessageLookupByLibrary.simpleMessage("Check failed"),
        "checkUpdate": MessageLookupByLibrary.simpleMessage("Check Version"),
        "checking": MessageLookupByLibrary.simpleMessage("Checking"),
        "circularPrefixDesc":
            MessageLookupByLibrary.simpleMessage("Circular prefix content"),
        "circularSuffixDesc":
            MessageLookupByLibrary.simpleMessage("Circular suffix content"),
        "classifiedFile":
            MessageLookupByLibrary.simpleMessage("Classified file"),
        "classifiedFileDesc": MessageLookupByLibrary.simpleMessage(
            "Create parent folders for files based on different types or modification times"),
        "createdDate": MessageLookupByLibrary.simpleMessage("Created"),
        "createdTime": MessageLookupByLibrary.simpleMessage("Created date"),
        "currentTask": MessageLookupByLibrary.simpleMessage("CurrentTask"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "dateDesc": MessageLookupByLibrary.simpleMessage("Named by date"),
        "decodeCSVError":
            MessageLookupByLibrary.simpleMessage("File parsing error occurred"),
        "deleteChecked": MessageLookupByLibrary.simpleMessage("Delete checked"),
        "deleteEmptyFolder":
            MessageLookupByLibrary.simpleMessage("Delete empty"),
        "deleteEmptyFolderDesc": MessageLookupByLibrary.simpleMessage(
            "Delete all empty folders under the selected folder"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("Delete failed"),
        "deleteInfo": m0,
        "deleteLog": MessageLookupByLibrary.simpleMessage("delete logs"),
        "deleteSuccessful":
            MessageLookupByLibrary.simpleMessage("Delete successful"),
        "detailTitle":
            MessageLookupByLibrary.simpleMessage("All File Extensions"),
        "digits": MessageLookupByLibrary.simpleMessage("digits"),
        "document": MessageLookupByLibrary.simpleMessage("Document"),
        "download": MessageLookupByLibrary.simpleMessage("Download"),
        "earliestDate": MessageLookupByLibrary.simpleMessage("Earliest"),
        "errorImage": MessageLookupByLibrary.simpleMessage("Load Fail "),
        "exifDate": MessageLookupByLibrary.simpleMessage("ExifDate"),
        "existsError": m1,
        "exit": MessageLookupByLibrary.simpleMessage("Exit"),
        "exitOperation": MessageLookupByLibrary.simpleMessage("Exit Operation"),
        "extension": MessageLookupByLibrary.simpleMessage("Type"),
        "extensionDesc":
            MessageLookupByLibrary.simpleMessage("Modify file extensions"),
        "failed": MessageLookupByLibrary.simpleMessage("Renaming failed"),
        "failedError": m2,
        "failedNum": m3,
        "failureDeleteInfo": MessageLookupByLibrary.simpleMessage(
            "Failed to delete selected files"),
        "failureEmptyInfo": MessageLookupByLibrary.simpleMessage(
            "Failed to delete empty folder"),
        "fileCount": m4,
        "fileExtension": MessageLookupByLibrary.simpleMessage("FileExtension"),
        "fileExtensionDesc":
            MessageLookupByLibrary.simpleMessage("New file extension"),
        "fileName": MessageLookupByLibrary.simpleMessage("File name"),
        "folder": MessageLookupByLibrary.simpleMessage("Folder"),
        "image": MessageLookupByLibrary.simpleMessage("Image"),
        "inputDisable": MessageLookupByLibrary.simpleMessage("Input disabled"),
        "latestDate": MessageLookupByLibrary.simpleMessage("Latest"),
        "lengthDesc": MessageLookupByLibrary.simpleMessage(
            "Input length truncation (adding a space between two numbers to truncate the middle part)"),
        "loadingImage": MessageLookupByLibrary.simpleMessage("Loading..."),
        "log": MessageLookupByLibrary.simpleMessage("Log"),
        "logDesc": MessageLookupByLibrary.simpleMessage(
            "The target folder is not empty and is saved in the target folder, otherwise it is saved in the logs folder of the software directory"),
        "match": MessageLookupByLibrary.simpleMessage("Matching"),
        "matchHint": MessageLookupByLibrary.simpleMessage("Matching content"),
        "matchLength":
            MessageLookupByLibrary.simpleMessage("Number or length string"),
        "matchName": MessageLookupByLibrary.simpleMessage("Match name"),
        "modifiedDate": MessageLookupByLibrary.simpleMessage("Modified"),
        "modifiedTime": MessageLookupByLibrary.simpleMessage("Modified date"),
        "modifyName": MessageLookupByLibrary.simpleMessage("Modify name"),
        "modifyTo": MessageLookupByLibrary.simpleMessage("Modify to"),
        "moveError": MessageLookupByLibrary.simpleMessage("Moving error"),
        "moveFailed": MessageLookupByLibrary.simpleMessage("Move failed"),
        "moveToCenter": MessageLookupByLibrary.simpleMessage("To the center"),
        "moveToFirst": MessageLookupByLibrary.simpleMessage("To the first"),
        "moveToLast": MessageLookupByLibrary.simpleMessage("To the last"),
        "newName": MessageLookupByLibrary.simpleMessage("New name"),
        "newVersionInfo": m5,
        "noNewVersionInfo": MessageLookupByLibrary.simpleMessage(
            "Currently in the latest version"),
        "notExist": MessageLookupByLibrary.simpleMessage("not exist"),
        "notExistsError": m6,
        "openFolder": MessageLookupByLibrary.simpleMessage("Open Folder"),
        "openFolderDesc": MessageLookupByLibrary.simpleMessage(
            "Left mouse click on the file list to quickly open the folder where the file is located"),
        "organize": MessageLookupByLibrary.simpleMessage("Organize"),
        "organizeBtn": MessageLookupByLibrary.simpleMessage("Organize"),
        "organizeFolderDesc": MessageLookupByLibrary.simpleMessage(
            "Move all added files or all sub-files under a folder into the destination folder. If the destination folder is empty and you choose to use the top-level parent folder, all files will be moved to the top-level parent folder of the selected files in addition to the disk root folder"),
        "organizeLogs": MessageLookupByLibrary.simpleMessage("organize logs"),
        "organizeMenu": MessageLookupByLibrary.simpleMessage("OrganizeMenu"),
        "organizedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Organized successfully"),
        "organizedSuccessfullyInfo": m7,
        "organizingFailed":
            MessageLookupByLibrary.simpleMessage("Organizing failed"),
        "organizingFailedInfo":
            MessageLookupByLibrary.simpleMessage("The following moves failed"),
        "originalName": MessageLookupByLibrary.simpleMessage("Original name"),
        "other": MessageLookupByLibrary.simpleMessage("Other"),
        "prefix": MessageLookupByLibrary.simpleMessage("Prefix"),
        "prefixContent":
            MessageLookupByLibrary.simpleMessage("Add prefix content"),
        "regeditTip": MessageLookupByLibrary.simpleMessage(
            "Open right-click shortcut menu (When the software is not running, the Windows system only allows one file path to be passed in at a time, so when the software is not running, only one folder path is allowed to be passed in. You can place all files in one folder. If multiple files are passed in at once, please place the shortcut of the software in the \"Send To\" folder (open File Explorer, enter \"shell: sendto\" in the address bar and press enter), and use \"Send to\" to pass in)"),
        "remove": MessageLookupByLibrary.simpleMessage("Remove"),
        "removeNonImage": m8,
        "removeSelected":
            MessageLookupByLibrary.simpleMessage("Remove Selected"),
        "removeUnselected":
            MessageLookupByLibrary.simpleMessage("Remove Unselected"),
        "renameLogs": MessageLookupByLibrary.simpleMessage("rename logs"),
        "renameName": MessageLookupByLibrary.simpleMessage("Rename name"),
        "replace": MessageLookupByLibrary.simpleMessage("Replace"),
        "reserve": MessageLookupByLibrary.simpleMessage("Reserve"),
        "restartTip":
            MessageLookupByLibrary.simpleMessage("Restart takes effect"),
        "saveConfig":
            MessageLookupByLibrary.simpleMessage("Saved Configurations"),
        "saveLog": MessageLookupByLibrary.simpleMessage(
            "Save log (The default is in the logs folder under the software folder)"),
        "select": MessageLookupByLibrary.simpleMessage("Select"),
        "selectAllSwitch":
            MessageLookupByLibrary.simpleMessage("Select All Switch"),
        "selectFolder": MessageLookupByLibrary.simpleMessage("Select folder"),
        "selectReserve":
            MessageLookupByLibrary.simpleMessage("Reverse Selection"),
        "selectTargetFolder":
            MessageLookupByLibrary.simpleMessage("Target folder"),
        "serial": MessageLookupByLibrary.simpleMessage("Serial"),
        "shortcutTip1":
            MessageLookupByLibrary.simpleMessage("Add all subfiles to"),
        "shortcutTip2": MessageLookupByLibrary.simpleMessage("Add to"),
        "start": MessageLookupByLibrary.simpleMessage("start"),
        "successDeleteInfo": MessageLookupByLibrary.simpleMessage(
            "Successfully deleted all selected files"),
        "successEmptyInfo": MessageLookupByLibrary.simpleMessage(
            "Successfully deleted all empty folders"),
        "successful":
            MessageLookupByLibrary.simpleMessage("Renaming successful"),
        "successfulNum": m9,
        "suffix": MessageLookupByLibrary.simpleMessage("Suffix"),
        "suffixContent":
            MessageLookupByLibrary.simpleMessage("Add suffix content"),
        "swapPrefixDesc": MessageLookupByLibrary.simpleMessage(
            "Swap prefixes and incremental number positions"),
        "swapSuffixDesc": MessageLookupByLibrary.simpleMessage(
            "Swap suffixes and incremental number positions"),
        "tableInfo": MessageLookupByLibrary.simpleMessage(
            "Selected original name column: "),
        "takeTime": MessageLookupByLibrary.simpleMessage("Time"),
        "targetFolder": MessageLookupByLibrary.simpleMessage("Target folder"),
        "text": MessageLookupByLibrary.simpleMessage("Text"),
        "tip":
            MessageLookupByLibrary.simpleMessage("Drag the File/Folder here"),
        "tipButton1":
            MessageLookupByLibrary.simpleMessage("I know. No more reminders"),
        "tipButton2": MessageLookupByLibrary.simpleMessage("I know"),
        "tipImage": MessageLookupByLibrary.simpleMessage(
            "Drag the Picture File/Folder here"),
        "tipMessage": MessageLookupByLibrary.simpleMessage(
            "This operation will delete the file from the system and cannot be restored. To cancel please click on the area above the popup window."),
        "tipTitle": MessageLookupByLibrary.simpleMessage("Tip"),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "topParentFolder":
            MessageLookupByLibrary.simpleMessage("Top parent folder"),
        "tvSeriesInfo":
            MessageLookupByLibrary.simpleMessage("Get episode info"),
        "undo": MessageLookupByLibrary.simpleMessage("Undo"),
        "undoFailed":
            MessageLookupByLibrary.simpleMessage("Undo rename failed"),
        "undoFailedNum": m10,
        "undoSuccessful":
            MessageLookupByLibrary.simpleMessage("Undo Successful"),
        "undoSuccessfulNum": m11,
        "unselect": MessageLookupByLibrary.simpleMessage("Unselect"),
        "uploadCSV": MessageLookupByLibrary.simpleMessage(
            "Upload CSV and TXT files with \",\" separating old and new names, or OPLOG file generated by OncePower"),
        "uploadDesc": MessageLookupByLibrary.simpleMessage("Upload .txt file"),
        "useDesc": MessageLookupByLibrary.simpleMessage("Instructions for use"),
        "useTimeClassification": MessageLookupByLibrary.simpleMessage(
            "Classify using file modification time"),
        "video": MessageLookupByLibrary.simpleMessage("Video"),
        "viewMode": MessageLookupByLibrary.simpleMessage("View mode"),
        "zip": MessageLookupByLibrary.simpleMessage("Zip")
      };
}
