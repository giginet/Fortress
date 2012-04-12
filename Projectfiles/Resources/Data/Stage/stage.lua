--[[
  ステージ定義ファイルです。
  各ステージごとに以下の情報を書きましょう
  title : ステージ名
  fortress : 敵の砦データファイル名
  time : 制限時間（秒数）
  gravity : 重力加速度（廃止するかも？）
  width : ステージの横幅広さ（廃止するかも？）
  
  1番最初に書いた物から順にステージ1, 2, 3……と扱われます
]]


local stages = {
  {
    title = "テスト用ステージ",
    fortress = "test.lua",
    time = 90,
    gravity = -320,
    width = 960
  }
}

return stages