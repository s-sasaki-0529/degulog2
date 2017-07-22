<template>
  <div class="container boughts">
    <h1>デグー関連購入履歴</h1>
    <div class="total">
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
      }
    },
    methods: {
      getBoughts() {
        http.getBoughts((err, data) => {
          this.boughts = data.body;
        });
      },
    },
    computed: {
      totalAmount: function() {
        let total_amount = 0;
        this.boughts.forEach((b) => total_amount += b.amount);
        return total_amount;
      }
    },
    created: function() {
      this.getBoughts();
    },
  }
</script>
