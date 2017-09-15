<template>

<div class="container measurements">

  <!-- ヘッダー -->
  <h1>体重記録</h1>

  <!-- タブメニュー -->
  <ul class="nav nav-tabs nav-justified">
    <li v-bind:class="{'active': selected_tab === 'history'}" v-on:click="changeTab('history')">
      <a>一覧</a>
    </li>
    <li v-bind:class="{'active': selected_tab === 'graf'}" v-on:click="changeTab('graf')">
      <a>グラフ</a>
    </li>
    <li v-bind:class="{'active': selected_tab === 'form'}" v-on:click="changeTab('form')">
      <a>新規登録</a>
    </li>
  </ul>

  <!-- 体重記録一覧 -->
  <div class="history" v-show="selected_tab === 'history'">
    <table class="table table-hover">
      <thead>
        <th class="measurement-date">測定日</th>
        <th v-for="degu in degus">{{ degu.name }}</th>
      </thead>
      <tbody>
        <tr v-for="measurement in measurements">
          <td class="measurement-date nowrap">{{ measurement.date }}</td>
          <td v-for="degu in degus">
            {{ measurement.weights[degu.id] }}
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- 体重遷移グラフ -->
  <div class="graf" v-show="selected_tab === 'graf'">
    <div id="graf"></div>
  </div>

  <!-- 体重記録編集フォーム -->
  <div v-show="selected_tab === 'form'">
    <div class="form-group">
      <label class="col-form-label">日付</label>
      <input type="date" name="date" class="form-control" v-model="form.date">
    </div>
    <div class="row">
      <div class="form-group col-md-3 col-xs-12" v-for="degu in degus">
        <label>{{ degu.name }}</label>
        <input v-model="form.weights[degu.id]" type="number" class="form-control" v-bind:disabled="!degu.is_alive">
      </div>
    </div>
    <div class="form-group">
      <button class="btn btn-primary btn-block" @click="createMeasurements">登録</button>
    </div>
  </div>

</div>

</template>

<script>
  import http from './common/http';
  import util from './common/util';
  import c3   from 'c3';
  export default {
    data: function () {
      return {
        selected_tab: 'history',
        degus:        [],
        measurements: [],
        form: {
          date: util.getTodayString(),
          weights: {},
        },
      };
    },
    methods: {
      // タブを切り替える
      changeTab(new_tab) {
        this.selected_tab = new_tab;
      },
      // 体重遷移グラフを描画する
      // degusのidが連番であることが前提
      makeGraf() {
        let date = ['date'], degus = [];
        this.degus.forEach((degu) => {
          degus.push([degu.name]);
        });
        this.measurements.forEach((m) => {
          date.push(m.date);
          for (let i = 0; i < this.degus.length; i++) {
            degus[i].push(m.weights[String(i + 1)] || null);
          }
        });
        c3.generate({
          bindto: '#graf',
          data: {
            x: 'date',
            xFormat: '%Y/%m/%d',
            columns: [date , ...degus]
          },
          axis: {
            x: {
              show: true,
              type: 'timeseries',
              tick: {
                format: '%y/%m/%d'
              }
            }
          },
        });
      },
      // デグー一覧をAPIで取得
      getDegus() {
        http.getDegs((err, data) => {
          this.degus = data.body;
        });
      },
      // 体重記録一覧をAPIで取得
      getMeasurements() {
        http.getMeasurements((err, data) => {
          this.measurements = data.body;
        });
      },
      // 体重記録一覧を新規登録
      createMeasurements() {
        const weights = Object.keys(this.form.weights).map((degu_id) => { return {degu_id: degu_id, value: this.form.weights[degu_id]} })
        const params = {
          date: this.form.date,
          weights: weights,
        }
        http.createMeasurements(params, (err, result) => {
          if (err) {
            alert('登録エラー');
          } else {
            this.measurements.unshift(result.body);
            this.changeTab('history');
            this.form.date = util.getTodayString();
            this.form.weights = {};
          }
        });
      }
    },
    created: function() {
      this.getDegus();
      this.getMeasurements();
    },
    updated: function() {
      this.makeGraf();
    },
  }
</script>
