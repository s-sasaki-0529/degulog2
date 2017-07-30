<template>
  <div class="container boughts">
    <!-- ヘッダー -->
    <h1>デグー関連購入履歴</h1>
    <div class="right">
      <button class="btn btn-primary" v-bind:disabled="synchronizing" v-on:click="getLatestBoughts">
        {{ this.synchronizing ? '同期中' : '同期' }}
      </button>
      <p>累計: {{ totalAmount }}円</p>
    </div>

    <!-- タブメニュー -->
    <ul class="nav nav-tabs nav-justified">
      <li v-bind:class="{'active': selected_tab === 'history'}" v-on:click="changeTab('history')">
        <a>一覧</a>
      </li>
      <li v-bind:class="{'active': selected_tab === 'monthly'}" v-on:click="changeTab('monthly')">
        <a>月ごと</a>
      </li>
    </ul>

    <!-- 購入履歴一覧 -->
    <div class="history" v-show="selected_tab === 'history'">
      <table class="table">
        <thead>
          <tr>
            <th>日付</th>
            <th>支払額</th>
            <th>購入店舗</th>
            <th>購入内容</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="bought in boughts">
            <td>{{ bought.date }}</td>
            <td class="amount">{{ bought.amount }}円</td>
            <td>{{ bought.place }}</td>
            <td>{{ bought.comment }}</td>
         </tr>
        </tbody>
      </table>
    </div>

    <!-- 月ごとの支出一覧 -->
    <div class="monthly" v-show="selected_tab === 'monthly'">
      月ごと
    </div>

  </div>
</template>

<script>
  import http from './common/http';
  export default {
    data: function () {
      return {
        boughts: [],
        selected_tab: 'history',
        synchronizing: false,
      }
    },
    methods: {
      // タブを切り替え
      changeTab(new_tab) {
        this.selected_tab = new_tab;
      },
      // 支出一覧を取得(キャシュ)
      getBoughts() {
        http.getBoughts((err, data) => {
          this.boughts = data.body;
        });
      },
      // 支出一覧を取得(同期)
      getLatestBoughts() {
        this.synchronizing = true;
        http.getLatestBoughts((err, data) => {
          this.boughts = data.body;
          this.synchronizing = false;
        });
      },
    },
    computed: {
      // 累計支出を取得
      totalAmount: function() {
        let total_amount = 0;
        this.boughts.forEach((b) => total_amount += b.amount);
        return total_amount;
      },
      // 月ごとの支出を取得
      monthlyAmounts: function() {
        let monthly_amounts = {};
        this.boughts.forEach((b) => {
          const month = b.date.split('-', 2).join('-');
          if (! monthly_amounts[month]) {
            monthly_amounts[month] = 0;
          }
          monthly_amounts[month] += b.amount;
        });
        return monthly_amounts;
      },
    },
    created: function() {
      this.getBoughts();
    },
  }
</script>
