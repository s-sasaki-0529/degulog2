<template>
  <div class="container tweets">
    <h1>ツイート一覧</h1>
    <table class="table table-hover pointer">
      <thead>
        <tr>
          <th class="date" v-on:click="sort('date')">日付</th>
          <th class="tweet" v-on:click="sort('text')">ツイート</th>
          <th class="like nowrap" v-on:click="sort('like_count')">いいね</th>
          <th class="retweet nowrap" v-on:click="sort('retweet_count')">リツイート</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="tweet in tweets" v-on:click="move(tweet)">
          <td class="nowrap">{{ tweet.date }}</td>
          <td>{{ tweet.text }}</td>
          <td>{{ tweet.like_count }}</td>
          <td>{{ tweet.retweet_count }}</td>
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
        tweets: [
        ],
      }
    },
    methods: {
      // APIからツイート一覧を取得
      getTweets() {
        http.getTweets((err, data) => {
          this.tweets = data.body;
        })
      },
      // 対象の元ツイートを開く
      move(tweet) {
        const url = 'https://twitter.com/HousouP/status/' + tweet.origin_id;
        window.open(url);
      },
      // ツイートの並び順を変更
      sort(key) {
        this.tweets = this.tweets.sort((a, b) => a[key] <= b[key] ? 1 : -1);
      }
    },
    created: function() {
      this.getTweets();
    },
  }
</script>
