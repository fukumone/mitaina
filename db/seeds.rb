def create_setting(options)
  count = options[:nickname].count
  count.times do |ind|
    user = User.create(nickname: options[:nickname][ind])
    Comment.create(sentence: options[:comment][ind], user: user)
  end
end

def create_comment(comments)
  user = User.find(1)
  comments.each do |comment|
    Comment.create(sentence: comment, user: user)
  end
end

options = {
  nickname: [
    "ヘンリー一世",
    "トナカイ",
    "栃木の雷神",
    "江戸川のハゼ",
    "ダスティンホフマン",
    "ミケランジェロ"
  ],
  comment: [
    "馬鹿王",
    "そりに乗って船出します",
    "栃木とは？",
    "ハゼハゼ",
    "あれれれ！",
    "二回クビになった"
  ]
}

comments = ["戦略的撤退", "鉄をかめ", "ゴートぅバーチャン", "サボエラの奇人", "サンタさんは詐欺師です"]

create_setting(options)
create_comment(comments)
