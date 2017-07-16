<template>

<div class="container measurements">
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

</template>

<script>
  import http from './common/http';
  export default {
    data: function () {
      return {
        degus:        [],
        measurements: [],
      };
    },
    methods: {
      getDegus() {
        http.getDegs((err, data) => {
          this.degus = data.body;
        });
      },
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
  }
</script>
