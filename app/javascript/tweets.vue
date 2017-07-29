<template>
  <div class="container tweets">
    <h1>ツイート一覧</h1>
    <table class="table table-hover pointer">
      <thead>
        <tr>
          <th class="date">日付</th>
          <th class="tweet">ツイート</th>
          <th class="like nowrap">いいね</th>
          <th class="retweet nowrap">リツイート</th>
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
      getTweets() {
        http.getTweets((err, data) => {
          this.tweets = data.body;
        })
      },
      move(tweet) {
        const url = 'https://twitter.com/HousouP/status/' + tweet.origin_id;
        window.open(url);
      },
    },
    created: function() {
      this.getTweets();
    },
  }
</script>
