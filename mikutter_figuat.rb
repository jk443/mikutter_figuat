# -*- coding: utf-8 -*-

Plugin.create(:mikutter_figuat) do
  command(
          :mikutter_figuat,
          name: 'フィギュアっと',
          condition: -> _ { true },
          visible: true,
          role: :timeline
          ) do
    formar_strs = ["ふぃぎゅあっと"]
    latter_strs = ["それ！","どりゃ！","もー！","そりゃ！",
                   "てりゃ！","えーい！","もういっちょ！",
                   "とりゃ！","うきゅぅ！","うぎゅ！",
                   "こんどこそ！","もういっちょ！",
                   "やったー！", "FU〜！", "POM！"]
    post_strs = ["あっとめいと", "ふぃぎゅ＠メイト"]
    symbols = ["！", "☆", "★"]
    status_strs = ["真顔", "迫真", "提案", "白目","棒読み",
                   "歓喜", "大嘘", "威圧", "マジレス", "困惑",
                   "懇願", "驚愕", "適当", "即答",
                   "マジキチスマイル", "小声"]
    str = post_strs.sample+symbols.sample+"("+status_strs.sample
    sn = str.split(//).size
    while sn <= 120 do
      t = formar_strs.sample +
        symbols.sample +
        "("+latter_strs.sample+")"
      ts = t.split(//).size
      str=t+str if ts + sn <= 140
      sn = str.split(//).size
    end
    Post.primary_service.update(message: str)
    end
end
