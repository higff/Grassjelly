<template>
  <div class="footer">
    <!-- Brand Logo -->

    <div class="brand-logo">
      <div class="container">
        <div class="slider-items-products">
          <div id="brand-logo-slider" class="product-flexslider hidden-buttons">
            <div class="slider-items slider-width-col6">
              <!-- Item -->
              <div class="item" v-for="(v, k) of bottom" :key="k">
                <router-link to="/"
                  ><img :src="`images/${v.img}`" alt="Image" />
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer -->
    <footer>
      <div class="footer-top">
        <div class="container">
          <div class="row">
            <div style="text-align: center">
              <router-link to="/"
                ><img src="images/footer-logo.png" alt="logo" />
              </router-link>
            </div>
            <address>
              <p v-for="(v, k) of relation" :key="k">
                <i :class="`${v.font}`"></i>{{ v.site }}
              </p>
            </address>
          </div>
        </div>
      </div>
      <div class="footer-inner">
        <div class="container">
          <div class="row">
            <div class="col-sm-4 col-xs-4 col-md-2">
              <div class="footer-links">
                <h5>合作加盟</h5>
                <ul class="links">
                  <li v-for="(v, k) of connect" :key="k">
                    <router-link to="/" title="Product Recall">{{
                      v.con
                    }}</router-link>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-sm-4 col-xs-4 col-md-2">
              <div class="footer-links">
                <h5>优质服务</h5>
                <ul class="links">
                  <li v-for="(v, k) of serve" :key="k">
                    <router-link to="/">{{ v.ser }}</router-link>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-sm-4 col-xs-4 col-md-4">
              <div class="footer-links">
                <h5>最新信息</h5>
                <ul class="links">
                  <li v-for="(v, k) of message" :key="k">
                    <router-link to="/">{{ v.mess }}</router-link>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-4">
              <div class="footer-links">
                <div class="footer-newsletter">
                  <h5>订阅我们的新闻</h5>
                  <form
                    id="newsletter-validate-detail"
                    method="post"
                    action="/"
                  >
                    <div class="newsletter-inner">
                      <p>订阅成为第一个了解销售，活动和独家优惠的人！</p>
                      <input
                        class="newsletter-email"
                        name="Email"
                        placeholder="输入您的电子邮件"
                      />
                      <button
                        class="button subscribe"
                        type="submit"
                        title="Subscribe"
                      >
                        订阅
                      </button>
                    </div>
                  </form>
                </div>
                <div class="social">
                  <h5>跟着我们</h5>
                  <ul class="inline-mode">
                    <li :class="`${v.font}`" v-for="(v, k) of fontq" :key="k">
                      <router-link
                        title="Connect us on Facebook"
                        target="_blank"
                        to="/"
                        ><i :class="`${v.fontw}`"></i
                      ></router-link>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-bottom">
        <div class="container">
          <div class="row">
            <div class="col-sm-5 col-xs-12 coppyright">
              Copyright &copy; 2020.Company name All rights reserved.
            </div>
            <div class="col-sm-7 col-xs-12 payment-accept">
              <ul>
                <li v-for="(v, k) of imgq" :key="k">
                  <router-link to="/"
                    ><img :src="`images/${v.img}`" alt="Payment Card"
                  /></router-link>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!--Newsletter Popup Start-->
    <div id="myModal" class="modal fade">
      <div class="modal-dialog newsletter-popup">
        <div class="modal-content">
          <button
            type="button"
            class="close"
            data-dismiss="modal"
            aria-hidden="true"
          >
            &times;
          </button>
          <div class="modal-body">
            <h4 class="modal-title">NEWSLETTER SIGNUP</h4>
            <form id="newsletter-form" method="post" action="/">
              <div class="content-subscribe">
                <div class="form-subscribe-header">
                  <label
                    >Subscribe to be the first to know about Sales, Events, and
                    Exclusive Offers!</label
                  >
                </div>
                <div class="input-box">
                  <input
                    type="text"
                    class="input-text newsletter-subscribe"
                    title="Sign up for our newsletter"
                    name="email"
                    placeholder="Enter your email address"
                  />
                </div>
                <div class="actions">
                  <button
                    class="button-subscribe"
                    title="Subscribe"
                    type="submit"
                  >
                    Subscribe
                  </button>
                </div>
              </div>
            </form>
            <div class="subscribe-bottom">
              <input name="notshowpopup" id="notshowpopup" type="checkbox" />
              Don’t show this popup again
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--End of Newsletter Popup-->
  </div>
</template>
<script>
export default {
  data() {
    return {
      bottom: [
        { img: "brand1.png" },
        { img: "brand2.png" },
        { img: "brand3.png" },
        { img: "brand4.png" },
        { img: "brand5.png" },
        { img: "brand6.png" },
        { img: "brand5.png" },
        { img: "brand1.png" },
      ],
      relation: [
        { site: "重庆市渝北·嘉州·协信中心·A座-18楼", font: "fa fa-map-marker" },
        { site: "电话：+(800)8888888", font: "fa fa-mobile" },
        { site: "邮箱：xiaozhupeiqi163@.com", font: "fa fa-envelope" },
      ],
      connect: [
        { con: "网站首页" },
        { con: "店面风采" },
        { con: "行业资讯" },
        { con: "公司动态" },
        { con: "企业简介" },
        { con: "企业荣誉" },
      ],
      serve: [
        { ser: "我的订单" },
        { ser: "历史订单" },
        { ser: "品质购物" },
        { ser: "退货政策" },
        { ser: "佩奇仙草" },
        { ser: "问题解答" },
      ],
      message: [
        { mess: "网站地图" },
        { mess: "新闻动态" },
        { mess: "发展趋势" },
        { mess: "关于我们" },
        { mess: "联系我们" },
        { mess: "品牌介绍" },
      ],
      imgq: [
        { img: "payment-1.png" },
        { img: "payment-2.png" },
        { img: "payment-3.png" },
        { img: "payment-4.png" },
      ],
      fontq: [
        { font: "social-network fb", fontw: "fa fa-facebook" },
        { font: "social-network googleplus", fontw: "fa fa-google-plus" },
        { font: "social-network tw", fontw: "icon-social-twitter icons" },
        { font: "social-network linkedin", fontw: "fa fa-linkedin" },
        { font: "social-network rss", fontw: "fa fa-rss" },
        { font: "social-network instagram", fontw: "fa fa-instagram" },
      ],
    };
  },
};
</script>