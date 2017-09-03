const util = {

  // 現在日時の文字列を取得
  getTodayString() {
    const today = new Date();
    const year  = today.getFullYear();
    const month = this.numberToZeroPaddingString(today.getMonth() + 1, 2);
    const day   = this.numberToZeroPaddingString(today.getDate(), 2);
    return [year, month, day].join('-');
  },

  // 数値を0詰めした文字列にする
  numberToZeroPaddingString(num, length) {
    return ('0000000000' + num).slice(-length);
  }
}
export default util;
