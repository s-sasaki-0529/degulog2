<template>
  <div class="v-degu-card">
    <el-card>
      <div class="image-wrappter">
        <img :src="image">
      </div>
      <div class="content">
        <h1>{{ name }}</h1>
        <dl>
          <dt>性別</dt>
          <dd>{{ isMale }}</dd>
          <dt>年齢</dt>
          <dd>{{ birthday }}</dd>
          <dt>誕生日</dt>
          <dd>{{ birthday }}</dd>
          <dt>体重</dt>
          <dd>{{ weight }}</dd>
        </dl>
      </div>
    </el-card>
  </div>
</template>

<style lang="scss">
.v-degu-card {
  .image-wrappter {
    position: relative;
    height: 300px;
    img {
      position: absolute;
      max-height: 300px;
      width: 100%;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      margin: auto;
    }
  }
}
</style>

<script>
export default {
  props: {
    // 名前
    name: {
      type: String,
      required: true,
    },
    // 性別がオスであるか
    isMale: {
      type: Boolean,
      required: false,
      default: false,
    },
    // 生年月日文字列
    // yyyy-mm-dd
    birthday: {
      type: String,
      required: true,
    },
    // 体重
    weight: {
      type: Number,
      required: true,
    },
    // 画像URL
    image: {
      type: String,
      required: false,
    },
  }
}
</script>
