# デグーの初期データを作成
Degu.create(name: 'パズー', gender: 'male',    birthday: '2015/12/01', come_date: '2016/03/20', picture_url: 'https://pbs.twimg.com/media/Ct0F1uZUsAEvqAm.jpg')
Degu.create(name: 'メイ',   gender: 'female',  birthday: '2016/02/01', come_date: '2016/05/07', picture_url: 'https://pbs.twimg.com/media/CuzjROnUMAAVrBn.jpg')

Degu.create(name: 'ジジ',   gender: 'male',    birthday: '2016/09/01', come_date: '2017/05/03', picture_url: 'https://pbs.twimg.com/media/DFFzOumU0AAi-Ew.jpg')
Degu.create(name: 'キキ',   gender: 'female',  birthday: '2016/02/01', come_date: '2017/05/03', picture_url: 'https://pbs.twimg.com/media/DA_cJOMUIAEtE8L.jpg', died_date: '2017/06/13')

Degu.create(name: 'ハク',   gender: 'male',    birthday: '2017/06/01', come_date: '2017/07/09', picture_url: 'https://pbs.twimg.com/media/DGDQbJ6UIAEEIX5.jpg')
Degu.create(name: 'セン',   gender: 'female',  birthday: '2017/06/01', come_date: '2017/07/09', picture_url: 'https://pbs.twimg.com/media/DEXSFe1UIAQ03Xa.jpg')
Degu.create(name: 'チヒロ', gender: 'female',  birthday: '2017/06/01', come_date: '2017/07/09', picture_url: 'https://pbs.twimg.com/media/DBtqxweV0AAAjHN.jpg')

Degu.create(name: 'ハル',   gender: 'female',  birthday: '2017/08/07', come_date: '2017/08/07', picture_url: 'https://pbs.twimg.com/media/DIPTfWqUQAA1VmT.jpg')
Degu.create(name: 'バロン', gender: 'male',    birthday: '2017/08/07', come_date: '2017/08/07', picture_url: 'https://pbs.twimg.com/media/DIPSaNcVAAoeaZX.jpg:large')
Degu.create(name: 'ムタ',   gender: 'male',    birthday: '2017/08/07', come_date: '2017/08/07', picture_url: 'https://pbs.twimg.com/media/DIPj6DsUQAAQYYc.jpg')
Degu.create(name: 'ルーン', gender: 'female',  birthday: '2017/08/07', come_date: '2017/08/07', picture_url: 'https://pbs.twimg.com/media/DIPR0IQUwAQp5lC.jpg')
Degu.create(name: 'ユキ',   gender: 'female',  birthday: '2017/08/07', come_date: '2017/08/07', picture_url: 'https://pbs.twimg.com/media/DIPSum0V4AE7x95.jpg')
Degu.create(name: 'トト',   gender: 'female',  birthday: '2017/08/07', come_date: '2017/08/07', picture_url: 'https://pbs.twimg.com/media/DIPUaMXVAAALhht.jpg')
Degu.create(name: 'ナトル', gender: 'male',    birthday: '2017/08/07', come_date: '2017/08/07', picture_url: 'https://pbs.twimg.com/media/DIPVQGHVoAAI1e-.jpg')

Degu.create(name: 'ソフィー', gender: 'female', birthday: '2017/11/16', come_date: '2017/11/16', picture_url: 'https://pbs.twimg.com/media/DR01bgwU8AAfaCa.jpg')
Degu.create(name: 'レティー', gender: 'female', birthday: '2017/11/16', come_date: '2017/11/16', picture_url: 'https://pbs.twimg.com/media/DR01bgvUIAAU5f3.jpg')
Degu.create(name: 'ハウル', gender: 'male', birthday: '2017/11/16', come_date: '2017/11/16', picture_url: 'https://pbs.twimg.com/media/DR01bgxUEAACaY6.jpg')
Degu.create(name: 'カルシファー', gender: 'male', birthday: '2017/11/16', come_date: '2017/11/16', picture_url: 'https://pbs.twimg.com/media/DR01bg3UQAUhS-U.jpg')
Degu.create(name: 'マルグル', gender: 'male', birthday: '2017/11/16', come_date: '2017/11/16', picture_url: 'https://pbs.twimg.com/media/DR02-ggV4AAK9Or.jpg')
Degu.create(name: 'マーサ', gender: 'female', birthday: '2017/11/16', come_date: '2017/11/16', picture_url: 'https://pbs.twimg.com/media/DR02-gbVoAAi3ap.jpg')
Degu.create(name: 'サリマン', gender: 'female', birthday: '2017/11/16', come_date: '2017/11/16', picture_url: 'https://pbs.twimg.com/media/DR02-hLUIAAeX_M.jpg')

Degu.create(name: 'セイジ', gender: 'male', birthday: '2017/12/15', come_date: '2017/12/15')
Degu.create(name: 'シズク', gender: 'female', birthday: '2017/12/15', come_date: '2017/12/15')
Degu.create(name: 'シロウ', gender: 'male', birthday: '2017/12/15', come_date: '2017/12/15')
Degu.create(name: 'シホ', gender: 'female', birthday: '2017/12/15', come_date: '2017/12/15')
Degu.create(name: 'コウイチ', gender: 'male', birthday: '2017/12/15', come_date: '2017/12/15')
Degu.create(name: 'コウジ', gender: 'male', birthday: '2017/12/15', come_date: '2017/12/15')

# 購入履歴をAPIから持ってくる
Bought.synchronize

# 体重の初期データを作成
pazoo  = Degu.find_by(name: 'パズー')
may    = Degu.find_by(name: 'メイ')
kiki   = Degu.find_by(name: 'キキ')
jiji   = Degu.find_by(name: 'ジジ')
haku   = Degu.find_by(name: 'ハク')
sen    = Degu.find_by(name: 'セン')
tihiro = Degu.find_by(name: 'チヒロ')
haru   = Degu.find_by(name: 'ハル')
baron  = Degu.find_by(name: 'バロン')
muta   = Degu.find_by(name: 'ムタ')
loon   = Degu.find_by(name: 'ルーン')
yuki   = Degu.find_by(name: 'ユキ')
toto   = Degu.find_by(name: 'トト')
natoru = Degu.find_by(name: 'ナトル')

Measurement.create(date: '2016/09/23').weights.create([
  {degu: pazoo, value: 217},
  {degu: may,   value: 207},
])
Measurement.create(date: '2016/09/28').weights.create([
  {degu: pazoo, value: 216},
  {degu: may,   value: 201},
])
Measurement.create(date: '2016/10/08').weights.create([
  {degu: pazoo, value: 224},
  {degu: may,   value: 198},
])
Measurement.create(date: '2016/10/14').weights.create([
  {degu: pazoo, value: 216},
  {degu: may,   value: 204},
])
Measurement.create(date: '2016/11/19').weights.create([
  {degu: pazoo, value: 209},
  {degu: may,   value: 222},
])
Measurement.create(date: '2016/12/04').weights.create([
  {degu: pazoo, value: 210},
  {degu: may,   value: 220},
])
Measurement.create(date: '2016/12/10').weights.create([
  {degu: pazoo, value: 207},
  {degu: may,   value: 219},
])
Measurement.create(date: '2016/12/22').weights.create([
  {degu: pazoo, value: 208},
  {degu: may,   value: 228},
])
Measurement.create(date: '2017/01/06').weights.create([
  {degu: pazoo, value: 214},
  {degu: may,   value: 220},
])
Measurement.create(date: '2017/01/13').weights.create([
  {degu: pazoo, value: 208},
  {degu: may,   value: 206},
])
Measurement.create(date: '2017/01/21').weights.create([
  {degu: pazoo, value: 213},
  {degu: may,   value: 219},
])
Measurement.create(date: '2017/01/27').weights.create([
  {degu: pazoo, value: 190},
  {degu: may,   value: 193},
])
Measurement.create(date: '2017/02/04').weights.create([
  {degu: pazoo, value: 218},
  {degu: may,   value: 227},
])
Measurement.create(date: '2017/02/11').weights.create([
  {degu: pazoo, value: 189},
  {degu: may,   value: 190},
])
Measurement.create(date: '2017/02/18').weights.create([
  {degu: pazoo, value: 203},
  {degu: may,   value: 208},
])
Measurement.create(date: '2017/02/25').weights.create([
  {degu: pazoo, value: 205},
  {degu: may,   value: 212},
])
Measurement.create(date: '2017/03/04').weights.create([
  {degu: pazoo, value: 209},
  {degu: may,   value: 216},
])
Measurement.create(date: '2017/03/12').weights.create([
  {degu: pazoo, value: 180},
  {degu: may,   value: 188},
])
Measurement.create(date: '2017/03/17').weights.create([
  {degu: pazoo, value: 217},
  {degu: may,   value: 204},
])
Measurement.create(date: '2017/03/25').weights.create([
  {degu: pazoo, value: 196},
  {degu: may,   value: 206},
])
Measurement.create(date: '2017/04/02').weights.create([
  {degu: pazoo, value: 201},
  {degu: may,   value: 213},
])
Measurement.create(date: '2017/04/09').weights.create([
  {degu: pazoo, value: 189},
  {degu: may,   value: 208},
])
Measurement.create(date: '2017/04/23').weights.create([
  {degu: pazoo, value: 190},
  {degu: may,   value: 200},
])
Measurement.create(date: '2017/04/30').weights.create([
  {degu: pazoo, value: 196},
  {degu: may,   value: 208},
])
Measurement.create(date: '2017/05/05').weights.create([
  {degu: pazoo, value: 202},
  {degu: may,   value: 207},
  {degu: kiki,  value: 197},
  {degu: jiji,  value: 154},
])
Measurement.create(date: '2017/05/15').weights.create([
  {degu: pazoo, value: 201},
  {degu: may,   value: 213},
  {degu: kiki,  value: 190},
  {degu: jiji,  value: 156},
])
Measurement.create(date: '2017/05/20').weights.create([
  {degu: pazoo, value: 202},
  {degu: may,   value: 203},
  {degu: kiki,  value: 183},
  {degu: jiji,  value: 150},
])
Measurement.create(date: '2017/05/27').weights.create([
  {degu: pazoo, value: 202},
  {degu: may,   value: 201},
  {degu: kiki,  value: 180},
  {degu: jiji,  value: 144},
])
Measurement.create(date: '2017/06/03').weights.create([
  {degu: pazoo, value: 204},
  {degu: may,   value: 211},
  {degu: kiki,  value: 180},
  {degu: jiji,  value: 148},
])
Measurement.create(date: '2017/06/25').weights.create([
  {degu: pazoo, value: 236},
  {degu: may,   value: 245},
  {degu: jiji,  value: 195},
])
Measurement.create(date: '2017/07/02').weights.create([
  {degu: pazoo, value: 230},
  {degu: may,   value: 255},
  {degu: jiji,  value: 193},
])
Measurement.create(date: '2017/07/09').weights.create([
  {degu: pazoo, value: 229},
  {degu: may,   value: 264},
  {degu: jiji,  value: 200},
  {degu: tihiro, value: 109},
  {degu: sen,    value: 99},
  {degu: haku,   value: 85}
])
Measurement.create(date: '2017/07/17').weights.create([
  {degu: pazoo, value: 231},
  {degu: may,   value: 267},
  {degu: jiji,  value: 197},
  {degu: tihiro, value: 129},
  {degu: sen,    value: 109},
  {degu: haku,   value: 110}
])
Measurement.create(date: '2017/07/21').weights.create([
  {degu: pazoo, value: 232},
  {degu: may,   value: 285},
  {degu: jiji,  value: 200},
  {degu: tihiro, value: 133},
  {degu: sen,    value: 114},
  {degu: haku,   value: 116}
])
Measurement.create(date: '2017/07/29').weights.create([
  {degu: pazoo, value: 224},
  {degu: may,   value: 314},
  {degu: jiji,  value: 196},
  {degu: tihiro, value: 146},
  {degu: sen,    value: 119},
  {degu: haku,   value: 124}
])
Measurement.create(date: '2017/08/07').weights.create([
  {degu: pazoo,  value: 220},
  {degu: may,    value: 236},
  {degu: jiji,   value: 193},
  {degu: tihiro, value: 153},
  {degu: sen,    value: 120},
  {degu: haku,   value: 125},
  {degu: haru,   value: 11},
  {degu: baron,  value: 11},
  {degu: toto,   value: 11},
  {degu: loon,   value: 11},
  {degu: yuki,   value: 11},
  {degu: muta,   value: 11},
  {degu: natoru, value: 11},
])
Measurement.create(date: '2017/08/12').weights.create([
  {degu: pazoo,  value: 225},
  {degu: may,    value: 256},
  {degu: jiji,   value: 199},
  {degu: tihiro, value: 158},
  {degu: sen,    value: 125},
  {degu: haku,   value: 133},
  {degu: haru,   value: 14},
  {degu: baron,  value: 14},
  {degu: toto,   value: 14},
  {degu: loon,   value: 14},
  {degu: yuki,   value: 14},
  {degu: muta,   value: 14},
  {degu: natoru, value: 14},
])
Measurement.create(date: '2017/08/18').weights.create([
  {degu: pazoo,  value: 228},
  {degu: may,    value: 230},
  {degu: jiji,   value: 191},
  {degu: tihiro, value: 174},
  {degu: sen,    value: 134},
  {degu: haku,   value: 149},
  {degu: haru,   value: 20},
  {degu: baron,  value: 20},
  {degu: toto,   value: 20},
  {degu: loon,   value: 20},
  {degu: yuki,   value: 20},
  {degu: muta,   value: 20},
  {degu: natoru, value: 20},
])
Measurement.create(date: '2017/08/27').weights.create([
  {degu: pazoo,  value: 226},
  {degu: may,    value: 229},
  {degu: jiji,   value: 191},
  {degu: tihiro, value: 174},
  {degu: sen,    value: 129},
  {degu: haku,   value: 154},
  {degu: haru,   value: 27},
  {degu: baron,  value: 30},
  {degu: toto,   value: 26},
  {degu: loon,   value: 21},
  {degu: yuki,   value: 28},
  {degu: muta,   value: 28},
  {degu: natoru, value: 25},
])
