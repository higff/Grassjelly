<template>
  <div class="message">
    <Hander></Hander>
    <div class="container">
      <div class="row">
        <div class="col-sm-12 content">
          <div class="text">
            <p class="h1">在线留言</p>
            <textarea
              class="textarea"
              placeholder="留下您的意见使我们提供更好的服务"
            ></textarea
            ><br />
            <button class="btn h1">提交</button>
          </div>
        </div>
      </div>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
import Hander from "@/components/Hander";
import Footer from "@/components/Footer";
export default {
  components: {
    Hander,
    Footer,
  },
  beforeMount() {
    if (location.href.indexOf("#reloaded") == -1) {
      location.href = location.href + "#reloaded";
      location.reload();
    }
  },
};
</script>

<style>
.message .content {
  width: 100%;
  padding: 40px 5%;
  background: url("/images/slider/slide-img3.jpg") no-repeat center top;
  color: #5b7977;
}
.message .btn {
  margin-top: 0;
  font-size: 14px;
  font-weight: 600;
  background: #fdae03;
  color: #fff;
  padding: 5px 30px;
}
.message .btn:hover {
  background: #5b7977;
}
.message .textarea {
  width: 100%;
  height: 300px;
}
@media (min-width: 768px) {
  .message > .container > .row {
    margin-left: 0;
    margin-right: 0;
  }
}
</style>