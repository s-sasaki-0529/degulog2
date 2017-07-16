<template>

<div class="weights">
  <table class="table">
    <thead>
      <tr>
        <th>名前</th>
        <th>測定日</th>
        <th>体重</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="weight in weights">
        <td>{{ weight.degu_name }}</td>
        <td>{{ weight.date }}</td>
        <td>{{ weight.value }}</td>
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
        weights: [],
      };
    },
    methods: {
      getWeights() {
        http.getWeights((err, data) => {
          this.weights = data.body;
        });
      },
    },
    created: function() {
      this.getWeights();
    },
  }
</script>
