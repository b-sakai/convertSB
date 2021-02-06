# cell shape conversion programs inter standard brains

ショウジョウバエ細胞形態標準脳間変換プログラム群

R上に公開されているライブラリなどを用いて標準脳間で細胞形態を変換する

## starndard brain name

- fbtbf : flycircuit, adult femaleの標準脳座標系
- FCWB : の標準脳座標系
- FAFB : PNなどについて調べた（論文名）における標準脳座標系
- JRC2018Unisex : virtualFlyBrain内の主要な標準脳座標系の１つ、電子顕微鏡で調べたflyEMの神経などがこの座標系に登録されている

## Dpendency
- R
- R library (http://flybrain.mrc-lmb.cam.ac.uk/si/bridging/www/, http://natverse.org/elmr/articles/xform_brain.html)

## Usage

### fbtbf to FCWB

fbtbf座標系からFCWB座標系に細胞形態ファイル(*.swc)を変換するプログラム
（Rライブラリ不要、アフィン変換）

→　convertFBTBFtoFCWB


### FCWB to fbtbf

FCWB座標系からFBTBF座標系に細胞形態ファイル(*.swc)を変換するプログラム
（Rライブラリ不要、アフィン変換）

→　convertCWBtoFBTBF

### FAFB to FCWB

FAFB座標系からFCWB座標系に細胞形態ファイル(*.swc)を変換するプログラム
（要Rライブラリ）

→　convertCWBtoFBTBF

### FAFB to fbtbf

「FAFB to FCWB」と「FCWB to fbtbf」を組み合わせて実行

### JRC2018Unisex to FCWB

https://github.com/saalfeldlab/template-building/wiki/Usage-examples 参照

（誤ってプログラムを消去したので現存しない）

### JRC2018Unisex to fbtbf

「JRC2018Unisex to FCWB」と「FCWB to fbtbf」を組み合わせて実行

### visualize

細胞形態ファイルを可視化するプログラム（FCWB座標系のものであれば脳領域と重ねて表示が可能）

→  visualizeFCWB
