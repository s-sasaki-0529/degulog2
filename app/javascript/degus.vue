<style>
.degus {
  display: -webkit-flex;
  display: -moz-flex;
  display: -ms-flex;
  display: -o-flex;
  display: flex;
  flex-wrap: wrap;
}
.degu .name {
  margin-bottom: .75rem;
  font-size: 1.5em;
}
.degu .body {
  padding: 1.5em;
}
@media screen and (min-width: 512px) {
  .degu {
    width: 20%;
  }
  .degus img {
    width: 100%;
  }
}
@media screen and (max-width: 512px) {
  .degus img {
    width: 100%;
  }
}
.degu {
  border: 1px solid rgba(0,0,0,.125);
  border-radius: .25rem;
  margin-top: 10px;
}
.degus table {
  white-space: nowrap;
}
.degus .name {
  text-align: center;
}
.degus .degu.is-died {
  background-color: #fdfdfd;
}
</style>

<template>

<div class="container degus">
  <div class="rows degu" v-for="degu in degus" v-bind:class="{'is-died': !degu.is_alive}">
    <div class="image"><img src="https://pbs.twimg.com/media-preview/886201147979030528/IRzuha-N.jpg"></div>
    <div class="body">
      <h4 class="name">{{ degu.name }}</h4>
      <table class="table">
        <tbody>
          <tr>
            <th>性別</th>
            <td>{{ degu.sex }}</td>
          </tr>
          <tr>
            <th>{{ degu.is_alive ? '年齢' : '享年' }}</th>
            <td>{{ degu.age }}</td>
          </tr>
          <tr>
            <th>誕生日</th>
            <td>{{ degu.birthday }}</td>
          </tr>
          <tr>
            <th>体重</th>
            <td>{{ degu.weight }}g</td>
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
