<template>
  <div>

    <v-col cols="12" sm="8" offset-xs="3" xs="8" offset-md="3" md="9" offset-lg="0" lg="12">
      <v-card color=#fef6e4>
        <v-card-title primary-title class="justify-center">
          <v-icon x-large color=#e53170>
            mdi-chevron-double-right
          </v-icon>
          <v-card-title class="display">タビマエ</v-card-title>
          <v-icon x-large color=#e53170>
            mdi-chevron-double-left </v-icon>
        </v-card-title>
        <v-card-text color=#001858>
          <p>旅行のスケジュール管理、持ち物チェック管理ができます。<br>
            出発日までの残りの日数を計算し「いつ」「何を」準備すれば良いかをお知らせします。</p>
        </v-card-text>
        <v-card-text>
          <p>思い込みにより時間を間違えて旅行の計画が台無しに・・・。「あれ何時に出発だっけ？」正確な時間は忘れてしまいがち。<br>
            目的地に着いてから「あれ忘れた！」と焦った経験はありませんか。旅行の準備段階で何を持って行けば良いのか分からなくなる事は多いもの。</p>
        </v-card-text>
        <v-card-text>
          <p>旅行は行く前から始まっています。<br>
            旅行後（タビアト）に後悔のない素敵な旅行を”タビマエ”と創造しましょう！</p>
        </v-card-text>
      </v-card>
    </v-col>

  </div>
</template>
<script>
export default {
};
</script>


<style lang="scss" scoped>
  .v-card {
    width: 100%;
    text-align: center;
    margin-bottom: 40px;
    font-family: 'TabimaeFont';
    padding: 30px 0 30px 0;
    margin-top: 40px;

  }

  .v-card-title {
    text-align: center;
    font-weight: bolder;
    font-family: 'TabimaeFont';
  }

  .display {
    color: #001858;
    text-align: center;
    font-size: 32px;
    font-family: 'TabimaeFont';

  }

  p {
    color: #001858;
    text-align: center;
    font-size: 16px;
    line-height: 2.0em;
    font-family: 'TabimaeFont';
  }

</style>
