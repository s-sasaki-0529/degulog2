# デグーの初期データを作成
Degu.create(name: 'パズー', is_male: true,  birthday: '2015-12-01', come_date: '2016-03-20')
Degu.create(name: 'メイ',   is_male: false, birthday: '2016-02-01', come_date: '2016-05-07')
Degu.create(name: 'ジジ',   is_male: true,  birthday: '2016-09-01', come_date: '2017-05-03')
Degu.create(name: 'キキ',   is_male: false, birthday: '2016-02-01', come_date: '2017-05-03', died_date: '2017-06-13')
Degu.create(name: 'ハク',   is_male: true,  birthday: '2017-06-01', come_date: '2017-07-09')
Degu.create(name: 'セン',   is_male: false, birthday: '2017-06-01', come_date: '2017-07-09')
Degu.create(name: 'チヒロ', is_male: false, birthday: '2017-06-01', come_date: '2017-07-09')

# 体重の初期データを作成
Degu.find_by(name: 'パズー').weights.create([
  { date: "2017/02/04", value: 218 },
  { date: "2017/01/27", value: 190 },
  { date: "2017/01/21", value: 213 },
  { date: "2017/01/13", value: 208 },
  { date: "2017/01/06", value: 214 },
  { date: "2016/12/22", value: 208 },
  { date: "2016/12/10", value: 207 },
  { date: "2016/12/04", value: 210 },
  { date: "2016/11/19", value: 209 },
  { date: "2016/10/14", value: 216 },
  { date: "2016/10/08", value: 224 },
  { date: "2016/09/28", value: 216 },
  { date: "2016/09/23", value: 217 },
  { date: "2017/02/11", value: 189 },
  { date: "2017/02/18", value: 203 },
  { date: "2017/02/25", value: 205 },
  { date: "2017/03/04", value: 209 },
  { date: "2017/03/12", value: 180 },
  { date: "2017/03/17", value: 204 },
  { date: "2017/03/25", value: 196 },
  { date: "2017/04/02", value: 201 },
  { date: "2017/04/09", value: 189 },
  { date: "2017/04/23", value: 190 },
  { date: "2017/04/30", value: 196 },
  { date: "2017/05/05", value: 202 },
  { date: "2017/05/15", value: 201 },
  { date: "2017/05/20", value: 202 },
  { date: "2017/05/27", value: 202 },
  { date: "2017/06/03", value: 204 },
  { date: "2017/06/18", value: 230 },
  { date: "2017/06/25", value: 236 },
  { date: "2017/07/02", value: 230 },
  { date: "2017/07/09", value: 229 },
])
Degu.find_by(name: 'メイ').weights.create([
  { date: "2017/02/04", value: 227 },
  { date: "2017/01/27", value: 193 },
  { date: "2017/01/21", value: 219 },
  { date: "2017/01/13", value: 206 },
  { date: "2017/01/06", value: 220 },
  { date: "2016/12/22", value: 228 },
  { date: "2016/12/10", value: 219 },
  { date: "2016/12/04", value: 220 },
  { date: "2016/11/19", value: 222 },
  { date: "2016/10/14", value: 204 },
  { date: "2016/10/08", value: 198 },
  { date: "2016/09/28", value: 201 },
  { date: "2016/09/23", value: 207 },
  { date: "2017/02/11", value: 190 },
  { date: "2017/02/18", value: 208 },
  { date: "2017/02/25", value: 212 },
  { date: "2017/03/04", value: 216 },
  { date: "2017/03/12", value: 188 },
  { date: "2017/03/17", value: 217 },
  { date: "2017/03/25", value: 206 },
  { date: "2017/04/02", value: 213 },
  { date: "2017/04/09", value: 208 },
  { date: "2017/04/23", value: 200 },
  { date: "2017/04/30", value: 208 },
  { date: "2017/05/05", value: 207 },
  { date: "2017/05/15", value: 213 },
  { date: "2017/05/20", value: 203 },
  { date: "2017/05/27", value: 201 },
  { date: "2017/06/03", value: 211 },
  { date: "2017/06/18", value: 242 },
  { date: "2017/06/25", value: 245 },
  { date: "2017/07/02", value: 255 },
  { date: "2017/07/09", value: 264 },
])
Degu.find_by(name: 'ジジ').weights.create([
  { date: "2017/05/05", value: 154 },
  { date: "2017/05/15", value: 156 },
  { date: "2017/05/20", value: 150 },
  { date: "2017/05/27", value: 144 },
  { date: "2017/06/03", value: 148 },
  { date: "2017/06/18", value: 218 },
  { date: "2017/06/25", value: 195 },
  { date: "2017/07/02", value: 193 },
  { date: "2017/07/09", value: 200 },
])
Degu.find_by(name: 'キキ').weights.create([
  { date: "2017/05/05", value: 197 },
  { date: "2017/05/15", value: 190 },
  { date: "2017/05/20", value: 183 },
  { date: "2017/05/27", value: 180 },
  { date: "2017/06/03", value: 180 },
])
Degu.find_by(name: 'ハク').weights.create([
  { date: "2017/07/09", value: 85 },
])
Degu.find_by(name: 'セン').weights.create([
  { date: "2017/07/09", value: 99 },
])
Degu.find_by(name: 'チヒロ').weights.create([
  { date: "2017/07/09", value: 109 },
])
