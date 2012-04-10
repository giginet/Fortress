--[[
Assetの設定ファイルです。
このように書くと良い感じにAssetを生成します。
]]

local assets = {
  {
    className = "Block",
    name = "レンガのカベ",
    description = "レンガ製のカベ。安くて量産しやすいが、耐久力はそこそこ",
    hp = 10,
    cost = 1,
    density = 0.3,
    graphic = "brick.png"
  }
}

return assets