<template>

<div class="container measurements">

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
          <td class="measurement-date">{{ measurement.date }}</td>
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
  <div class="form" v-show="selected_tab === 'form'">
    体重記録フォーム(仮)
  </div>

</div>

</template>

<script>
  import http from './common/http';
  import c3   from 'c3';
  export default {
    data: function () {
      return {
        selected_tab: 'history',
        degus:        [],
        measurements: [],
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
