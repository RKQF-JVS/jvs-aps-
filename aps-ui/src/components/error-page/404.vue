<template>
  <div class="error404">
    <div class="error404-body-con">
      <el-card class="box-card page-404-box">
        <!-- <div class="error404-body-con-title">4
          <span>0</span>4</div>
        <p class="error404-body-con-message">YOU&nbsp;&nbsp;LOOK&nbsp;&nbsp;LOST</p> -->
        <!-- <div class="error404-btn-con">
          <el-button @click="goHome" size="large" style="width: 200px;" text>返回首页</el-button>
          <el-button @click="backPage" size="large" style="width: 200px;margin-left: 40px;" type="primary">返回上一页</el-button>
        </div> -->
      </el-card>
    </div>
  </div>
</template>

<script>
export default {
  name: "Error404",
  methods: {
    backPage() {
      this.$router.go(-1);
    },
    goHome() {
      this.$router.push({
        path: "/"
      });
    }
  }
};
</script>
<style lang="scss" scoped>
@keyframes error404animation {
  0% {
    transform: rotateZ(0deg);
  }
  20% {
    transform: rotateZ(-60deg);
  }
  40% {
    transform: rotateZ(-10deg);
  }
  60% {
    transform: rotateZ(50deg);
  }
  80% {
    transform: rotateZ(-20deg);
  }
  100% {
    transform: rotateZ(0deg);
  }
}
.error404 {
  position: relative;
  width: 100%;
  height: 100%;
  &-body-con {
    width: 450px;
    height: 300px;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    &-title {
      text-align: center;
      font-size: 240px;
      font-weight: 700;
      color: #2d8cf0;
      height: 260px;
      line-height: 260px;
      margin-top: 40px;
      span {
        display: inline-block;
        color: #19be6b;
        font-size: 230px;
        animation: error404animation 3s ease 0s infinite alternate;
      }
    }
    &-message {
      display: block;
      text-align: center;
      font-size: 30px;
      font-weight: 500;
      letter-spacing: 12px;
      color: #dddde2;
    }
    .el-card {
      background-image: url("../error-page/404.png");
      height: 100%;
      background-repeat: no-repeat;
      background-size: contain;
    }
  }
  &-btn-con {
    text-align: center;
    padding: 20px 0;
    margin-bottom: 40px;
  }
  .error404-body-con{
    width: 384px;
    height: 316px;
    .box-card {
      background-color: transparent;
      box-shadow: none;
      border: 0;
    }
  }
}
</style>
