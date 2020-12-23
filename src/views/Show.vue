<template>
  <div id="show">
    <Hander></Hander>
    <!-- 头部标签开始 -->

    <div id="imgx" style="display: none" @click="imgc">
      <img :src="`${imgm}`" alt="" style="width: 100%; border-radius: 5px" />
    </div>

    <!--头部标签结束  -->
    <!-- 中间图片开始 -->

    <ul class="cd-hero-slider">
      <!-- Page 1 Gallery One -->
      <li class="selected">
        <div class="cd-full-width">
          <div
            class="container-fluid js-tm-page-content"
            data-page-no="1"
            data-page-type="gallery"
          >
            <div class="tm-img-gallery-container">
              <div class="tm-img-gallery gallery-one">
                <!-- Gallery One pop up connected with JS code below -->
                <div
                  class="tm-img-gallery-info-container"
                  style="margin-top: 30px"
                >
                  <h2 class="tm-text-title tm-gallery-title tm-white">
                    <span class="tm-white">书亦店面</span>
                  </h2>
                  <p class="tm-text">
                   书亦烧仙草奶茶的设计在形象上贯彻“立足时尚诠释经典”的理念。<br>
                  抛开浮夸的造型，给你一片舒适清净之地，不是大片留白的冰冷，没有大肆鲜红的灼人。<br>
                  原木纹理氤氲出自然纯净的气息，柔化了城市的冷硬，轻快又不失温度。整体呈现出简约时尚的个性。<br>
                  设计师将这份简约的都市时尚之美，挥洒在书亦烧仙草奶茶加盟店的每一处设计上，将品牌设计连锁化，借时尚之美表达书亦经典。
                  </p>
                </div>
                <div class="grid-item" v-for="(v, k) of imgs" :key="k">
                  <figure class="effect-bubba">
                    <img
                      :src="`${v.img}`"
                      alt="Image"
                      class="img-fluid tm-img"
                    />
                    <figcaption @click="xz" :data-img="v.img">
                      <h2 class="tm-figure-title">书亦烧仙草</h2>
                      <p class="tm-figure-description">
                        半杯都是料
                      </p>
                      <!-- <a href="images/img1/tm-img-01.jpg">View more</a> -->
                    </figcaption>
                  </figure>
                </div>
              </div>
            </div>
          </div>
        </div>
      </li>
    </ul>
    
    <!-- 中间图片结束 -->
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
  data() {
    return {
      imgm: "",
      imgs: [
        {img:"images/imgs/100.jpg"},
        {img:"images/imgs/101.jpg"},
        {img:"images/imgs/102.jpg"},
        {img:"images/imgs/103.jpg"},
        {img:"images/imgs/104.jpg"},
        {img:"images/imgs/105.jpg"},
        {img:"images/imgs/106.jpg"},
        {img:"images/imgs/107.jpg"},
      ],
    };
  },
  methods: {
    xz(e) {
      this.imgm = e.target.dataset.img;
      // console.log(e.target.dataset.data-img)
      document.getElementById("imgx").style = "";
    },
    imgc() {
      console.log(1);
      document.getElementById("imgx").style = "display:none";
    },
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
.show #imgx {
  width: 500px;
  height: 500px;
  /* background: red; */
  position: fixed;
  left: 400px;
  z-index: 999;
  cursor: pointer;
  /* display: none; */
}

.show .cd-hero-slider div {
  background-color: #fff;
}

.show .cd-hero-slider span {
  color: #000;
  text-align: center;
}

.show .cd-hero-slider p {
  color: #000;
  text-align: center;
}
</style>
