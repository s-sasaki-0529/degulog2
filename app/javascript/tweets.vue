<template>
  <div class="container tweets">
    <h1>ツイート一覧</h1>
    <div class="right">
      <button class="btn btn-primary" v-bind:disabled="synchronizing" v-on:click="getLatestTweets">
        {{ this.synchronizing ? '同期中' : '同期' }}
      </button>
    </div>
    <table class="table table-hover pointer">
      <thead>
        <tr>
          <th class="date" v-bind:class="{sorted: sort_key === 'datetime'}"  v-on:click="sort('datetime')">日付</th>
          <th class="tweet">ツイート</th>
          <th class="picture">画像</th>
          <th class="like nowrap" v-bind:class="{sorted: sort_key === 'like_count'}" v-on:click="sort('like_count')">いいね</th>
          <th class="retweet nowrap" v-bind:class="{sorted: sort_key === 'retweet_count'}" v-on:click="sort('retweet_count')">リツイート</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="tweet in tweets" v-on:click="move(tweet)">
          <td class="nowrap">{{ tweet.date }}</td>
          <td>{{ tweet.text }}</td>
          <td><img class="picture" v-bind:src="tweet.pictures[0]"></td>
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
        sort_key: 'datetime',
        synchronizing: false,
      }
    },
    methods: {
      // APIからツイート一覧を取得(キャッシュ版)
      getTweets() {
        http.getTweets((err, data) => {
          this.tweets = data.body;
        });
      },
      // APIからツイート一覧を取得(同期版)
      getLatestTweets() {
        this.synchronizing = true;
        http.getLatestTweets((err, data) => {
          this.tweets = data.body;
          this.synchronizing = false;
          this.sort_key = 'datetime';
        });
      },
      // 対象の元ツイートを開く
      move(tweet) {
        const url = 'https://twitter.com/HousouP/status/' + tweet.origin_id;
        window.open(url);
      },
      // ツイートの並び順を変更
      sort(key) {
        this.tweets = this.tweets.sort((a, b) => a[key] <= b[key] ? 1 : -1);
        this.sort_key = key;
      }
    },
    created: function() {
      this.getTweets();
    },
  }
</script>
