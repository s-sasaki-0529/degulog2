<template>

<div class="container degus">
  <div class="rows degu" v-for="degu in degus" v-bind:class="{'is-died': !degu.is_valid}">

    <v-degu-card
      :name="degu.name"
      :isMale="degu.gender === 'オス'"
      :birthday="degu.birthday"
      :weight="degu.current_weight"
      :image="degu.picture_url"
    />

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
    components: {
      VDeguCard: require('./components/VDeguCard.vue')
    },
  }
</script>
