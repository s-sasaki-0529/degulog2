<template>

<div class="measurements">
  
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
          this.measurements = data.body;
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
