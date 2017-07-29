# デグーの初期データを作成
Degu.create(name: 'パズー', is_male: true,  birthday: '2015/12/01', come_date: '2016/03/20')
Degu.create(name: 'メイ',   is_male: false, birthday: '2016/02/01', come_date: '2016/05/07')
Degu.create(name: 'ジジ',   is_male: true,  birthday: '2016/09/01', come_date: '2017/05/03')
Degu.create(name: 'キキ',   is_male: false, birthday: '2016/02/01', come_date: '2017/05/03', died_date: '2017/06/13')
Degu.create(name: 'ハク',   is_male: true,  birthday: '2017/06/01', come_date: '2017/07/09')
Degu.create(name: 'セン',   is_male: false, birthday: '2017/06/01', come_date: '2017/07/09')
Degu.create(name: 'チヒロ', is_male: false, birthday: '2017/06/01', come_date: '2017/07/09')

# 購入履歴をAPIから持ってくる
Bought.synchronize

# 体重の初期データを作成
pazoo = Degu.find_by(name: 'パズー')
may   = Degu.find_by(name: 'メイ')
kiki  = Degu.find_by(name: 'キキ')
jiji  = Degu.find_by(name: 'ジジ')
haku  = Degu.find_by(name: 'ハク')
sen   = Degu.find_by(name: 'セン')
tihiro= Degu.find_by(name: 'チヒロ')

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
