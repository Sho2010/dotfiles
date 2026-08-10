# Windows keyboard customization

## 構成

- HHKB US
- Capsicain
- AutoHotkey v1
- PowerToys Keyboard Manager

## やってること

- karabiner-elementsのctrl 単押しでIMEのON/OFF
- win, 無変換キーをctrlに変更
- `:`, `;` swap


## 現在の責務

### Capsicain

HHKB が送る raw key を直接処理する。

- `NOCONVERT` → `LCTRL`
- `CONVERT` → `RCTRL`
- 左 Ctrl tap → `F22`
- 右 Ctrl tap → `F23`
- US配列の `;` / `:` を swap

Capsicain は PowerToys より低いレイヤーで入力を見るため、
PowerToys が有効でも `NOCONVERT` / `CONVERT` として認識される。

### AutoHotkey

IME の状態変更のみ担当。

- `F22` → `IME_SET(0)`
- `F23` → `IME_SET(1)`

### PowerToys Keyboard Manager

Capsicain に移していない特殊キーの remap を担当。

例:

- `VK 7`
- `VK 235`
- CapsLock

Capsicain と PowerToys の併用は現在問題なく動作している。

## 注意

PowerToys と Capsicain で同じキーを二重に remap しないこと。

Capsicain の Ctrl 設定:

    REWIRE NOCONVERT LCTRL F22
    REWIRE CONVERT   RCTRL F23

AHK は IME_SET() 以外のキーボード処理を追加しない。
