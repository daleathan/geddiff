#!/usr/bin/ruby -I/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib/
require 'diff/lcs'

seq1 = %w(a b c e h j l m n p)
seq2 = %w(b c d e f j k l m r s t)

lcs = Diff::LCS.LCS(seq1, seq2)
puts "lcs:#{lcs}"
diffs = Diff::LCS.diff(seq1, seq2)
puts "diffs:#{diffs}"
sdiff = Diff::LCS.sdiff(seq1, seq2)
puts "sdiff:#{sdiff}"
# seq = Diff::LCS.traverse_sequences(seq1, seq2, callback_obj)
# bal = Diff::LCS.traverse_balanced(seq1, seq2, callback_obj)
seq2 == Diff::LCS.patch!(seq1, diffs)
seq1 == Diff::LCS.unpatch!(seq2, diffs)
seq2 == Diff::LCS.patch!(seq1, sdiff)
seq1 == Diff::LCS.unpatch!(seq2, sdiff)