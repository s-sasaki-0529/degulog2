<template>

<div class="container degus">
  <div class="rows degu" v-for="degu in degus" v-bind:class="{'is-died': !degu.is_alive}">
    <div class="image"><img class="picture" v-bind:src="degu.picture_url"></div>
    <div class="body">
      <h4 class="name">{{ degu.name }}</h4>
      <table class="table nowrap">
        <tbody>
          <tr>
            <th>性別</th>
            <td>{{ degu.gender }}</td>
          </tr>
          <tr>
            <th>{{ degu.is_alive ? '年齢' : 'お別れ' }}</th>
            <td>{{ degu.is_alive ? degu.age : degu.died_date }}</td>
          </tr>
          <tr>
            <th>誕生日</th>
            <td>{{ degu.birthday }}</td>
          </tr>
          <tr>
            <th>体重</th>
            <td>{{ degu.current_weight }}g</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
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
