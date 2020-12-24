<template>
  <div class="contact">
    <Hander></Hander>
    <div class="bg">
      <div class="container">
        <ul class="list-unstyled data-ul row" @click="teg">
          <li
            class="col-sm-6 col-md-4 col-lg-2"
            v-for="(m, i) of menu"
            :key="i"
            :data-i="i"
          >
            {{ m }}
          </li>
        </ul>
      </div>
    </div>
    <div class="container">
      <div class="h3">
        <p>
          如果您通过了解后认可书亦烧仙草品牌，如您有任何疑问或加盟我们，请通过以下方式与我们联系或者您可以在线提交加盟表单，我们将尽快与您取得联系。
        </p>
      </div>
    </div>
    <div class="container">
      <div class="outer row">
        <div class="col-sm-10 col-lg-4" style="margin-top: 20px">
          唯一官方加盟热线 400-085-7085（免长途费）
        </div>
        <div class="col-sm-offset-11">
          <img src="/images/imgs/itel.png" />
        </div>
      </div>
      <div class="outer row">
        <div class="col-sm-10 col-lg-4" style="margin-top: 20px">
          邮箱地址<br /><br />xiaozhupeiqi@163.com
        </div>
        <div class="col-sm-offset-11">
          <img src="/images/imgs/imail.png" />
        </div>
      </div>
      <div class="outer row">
        <div
          class="col-sm-10 col-lg-6"
          style="margin-top: 20px; margin-bottom: 20px"
        >
          公司地址<br /><br />
          成都总部地址：四川省成都市武侯区长华路19号万科汇智中心6楼<br />
          长沙分公司地址：湖南省长沙市长沙县科技新城B28-2栋<br />
          武汉分公司地址：武汉市硚口区越秀财富中心7楼713<br />
          广东分公司地址：广东省佛山市南海区友邦金融中心二座3楼<br />
          河南分公司地址：郑州市管城区东风南路商鼎路升龙广场A座35楼
        </div>
        <div class="col-sm-offset-11">
          <img src="/images/imgs/iaddr.png" />
        </div>
      </div>
      <div class="outer row" style="margin-bottom: 40px">
        <div class="col-sm-10 col-lg-4" style="margin-top: 20px">
          客服QQ<br /><br />138888888 139999999
        </div>
        <div class="col-sm-offset-11">
          <img src="/images/imgs/iqq.png" />
        </div>
      </div>
    </div>
    <div class="container">
      <div style="text-align: center; margin-bottom: 30px">
        <div style="font-size: 2rem; color: #777777; margin: 20px 0">
          官方咨询微信
        </div>
        <img src="/images/imgs/erweima.jpg" />
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
  data() {
    return {
      menu: ["联系我们"],
      on: 0,
    };
  },
  methods: {
    teg(e) {
      if (e.target.nodeName == "LI") {
        for (let i in this.menu) {
          document
            .getElementsByClassName("list-unstyled data-ul row")[0]
            .getElementsByTagName("li")[i].className =
            "col-sm-6 col-md-4 col-lg-2";
        }
        e.target.className = "col-sm-6 col-md-4 col-lg-2 active";
        this.on = e.target.dataset.i;
      }
    },
  },
  beforeMount() {
    if (location.href.indexOf("#reloaded") == -1) {
      location.href = location.href + "#reloaded";
      location.reload();
    }
  },
  mounted() {
    document
      .getElementsByClassName("list-unstyled data-ul row")[0]
      .getElementsByTagName("li")[0].className =
      "col-sm-6 col-md-4 col-lg-2 active";
  },
};
</script>

<style>
.contact .h3 {
  text-align: center;
  padding: 3rem 0 3rem 0;
  font-family: inherit;
  font-weight: 500;
  line-height: 1.1;
  color: #777777;
}
.contact .h3 > p {
  font-size: 1.5rem;
  margin-top: 20px;
}
.contact .outer {
  border-radius: 5px;
  background-color: rgb(243, 243, 243);
  padding: 1rem;
  margin-bottom: 1rem;
}
.contact .bg {
  background: #44a23d;
  color: #fff;
}
.contact .data-ul > li {
  padding: 12px 44px;
  text-align: center;
  color: #fff;
}
.contact .data-ul > li:hover {
  padding: 12px 44px;
  background-color: #177210;
  cursor: pointer;
}
.contact .data-ul .active {
  background-color: #177210;
}
@media (min-width: 768px) {
  .contact .bg > .container > .row {
    margin-left: 0;
    margin-right: 0;
  }
}
</style>