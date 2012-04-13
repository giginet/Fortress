--[[
Assetの設定ファイルです。
このように書くと良い感じにAssetを生成します。
]]

local assets = {
  brick = {
    className = "Block",
    name = "レンガのカベ",
    description = "レンガ製のカベ。安くて量産しやすいが、耐久力はそこそこ",
    hp = 10,
    cost = 1,
    density = 0.3,
    image = "brick.png"
  },
  shooter = {
    className = "Shooter",
    name = "シューター",
    description = "テスト用の弾を撃つ兵士。適当に弾を撃ちます",
    hp = 10,
    cost = 1,
    density = 10.0,
    image = "brick.png",
    acceletor = 960,
    interval = 1.0,
    bulletClass = "Bullet",
    bulletImage = "bullet.png"
  },
  core = {
    className = "Core",
    name = "ふつうのコア",
    description = "ふつうのコア。壊されたら負けます",
    density = 0.3,
    image = "brick.png",
    cost = 0,
    hp = 100
  }
}

return assets