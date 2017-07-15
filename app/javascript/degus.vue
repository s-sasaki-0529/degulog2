<style>
.degus tr.is-died {
  background-color: #eee;
}
</style>

<template>

<div class='degus'>
  <table class='table'>
    <thead>
      <tr>
        <th>名前</th>
        <th>性別</th>
        <th>年齢</th>
        <th>体重</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for='degu in degus' v-bind:class='{"is-died": !degu.is_alive}'>
        <td>{{ degu.name }}</td>
        <td>{{ degu.sex  }}</td>
        <td>{{ degu.age  }}</td>
        <td>{{ degu.weight }}g</td>
      </tr>
    </tbody>
  </table>
</div>

</template>

<script>
  import http from './common/http';
  export default {
    data: () => {
      return {
        degus: [
        ],
      }
    },
    methods: {
      getDegs() {
        http.getDegs((err, data) => {
          this.degus = data.body;
        })
      },
    },
    created: function() {
      this.getDegs();
    },
  }
</script>
