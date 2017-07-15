<template>

<table class='table table-striped'>
  <thead>
    <tr>
      <th>名前</th>
      <th>性別</th>
      <th>年齢</th>
      <th>体重</th>
      <th>お迎え日</th>
    </tr>
  </thead>
  <tbody>
    <tr v-for='degu in degus'>
      <td>{{ degu.name }}</td>
      <td>{{ degu.sex  }}</td>
      <td>{{ degu.age  }}</td>
      <td>{{ degu.weight }}g</td>
      <td>{{ degu.come_date }}</td>
    </tr>
  </tbody>
</table>

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
