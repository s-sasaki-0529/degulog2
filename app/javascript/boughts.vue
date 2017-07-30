<template>
  <div class="container boughts">
    <h1>デグー関連購入履歴</h1>
    <div class="right">
      <button class="btn btn-primary" v-bind:disabled="synchronizing" v-on:click="getLatestBoughts">
        {{ this.synchronizing ? '同期中' : '同期' }}
      </button>
      <p>累計: {{ totalAmount }}円</p>
    </div>
    <table class="table table-bordered">
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
</template>

<script>
  import http from './common/http';
  export default {
    data: function () {
      return {
        boughts: [],
        synchronizing: false,
      }
    },
    methods: {
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
    },
    created: function() {
      this.getBoughts();
    },
  }
</script>
