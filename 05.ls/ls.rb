# frozen_string_literal: true

# 表示列の最大数をココで変更
ROW = 3

# scale変数を求める
def calc_scale(num)
  (num % 3).zero? ? num / 3 : (num / 3) + 1
end

# ファイル一覧をlsのルールに従い表示
def display(files, scale)
  scale.times do |y|
    ROW.times { |x| printf(files[x * scale + y].to_s.ljust(files.map(&:size).max + 3)) }
    printf "\n"
  end
end

files = Dir.glob('*')
files.sort!
display(files, calc_scale(files.size))
