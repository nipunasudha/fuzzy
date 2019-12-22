import 'data/bitap_index.dart';

List<MatchIndex> matchedIndices(List<int> matchmask, int minMatchCharLength) {
  matchmask ??= [];
  minMatchCharLength ??= 1;

  final matchedIndices = <MatchIndex>[];
  var start = -1;
  var end = -1;
  var i = 0;

  for (var len = matchmask.length; i < len; i += 1) {
    var match = matchmask[i];
    if (match != 0 && start == -1) {
      start = i;
    } else if (match == 0 && start != -1) {
      end = i - 1;
      if ((end - start) + 1 >= minMatchCharLength) {
        matchedIndices.add(MatchIndex(start, end));
      }
      start = -1;
    }
  }

  // (i-1 - start) + 1 => i - start
  if (matchmask[i - 1] != 0 && (i - start) >= minMatchCharLength) {
    matchedIndices.add(MatchIndex(start, i - 1));
  }

  return matchedIndices;
}