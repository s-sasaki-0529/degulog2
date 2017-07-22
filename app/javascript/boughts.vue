<template>
  <div class="container bought">
    <h1>デグー関連購入履歴</h1>
    <table class="table table-stripped">
      <thead>
        <tr>
          <th>日付</th>
          <th>支払額</th>
          <th>購入店舗</th>
          <th>購入内容</th>
        </tr>
      </thead>
      <tr v-for="bought in boughts">
        <td>{{ bought.date }}</td>
        <td>{{ bought.amount }}</td>
        <td>{{ bought.place }}</td>
        <td>{{ bought.comment }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
  import http from './common/http';
  export default {
    data: function () {
      return {
        boughts: [],
      }
    },
    methods: {
      getBoughts() {
        http.getBoughts((err, data) => {
          this.boughts = data.body;
        });
      },
    },
    created: function() {
      this.getBoughts();
    },
  }
</script>
