<template>
  <div class="information">
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
    <News v-if="on == 0"></News>
    <Dynamic v-else></Dynamic>
    <Footer></Footer>
  </div>
</template>

<script>
import Hander from "@/components/Hander";
import Footer from "@/components/Footer";
import News from "@/components/News";
import Dynamic from "@/components/Dynamic";
export default {
  components: {
    Hander,
    Footer,
    News,
    Dynamic,
  },
  data() {
    return {
      menu: ["新闻咨询", "行业动态"],
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
    // 获取地址栏中的参数
    let id = this.$route.query.id;
    if (!id)
      document
        .getElementsByClassName("list-unstyled data-ul row")[0]
        .getElementsByTagName("li")[0].className =
        "col-sm-6 col-md-4 col-lg-2 active";
    else {
      this.on = id;
      for (let i in this.menu) {
        document
          .getElementsByClassName("list-unstyled data-ul row")[0]
          .getElementsByTagName("li")[i].className =
          "col-sm-6 col-md-4 col-lg-2";
      }
      document
        .getElementsByClassName("list-unstyled data-ul row")[0]
        .getElementsByTagName("li")[id].className =
        "col-sm-6 col-md-4 col-lg-2 active";
    }
  },
};
</script>

<style>
.information .bg {
  background: #44a23d;
  color: #fff;
}
.information .data-ul > li {
  padding: 12px 44px;
  text-align: center;
  color: #fff;
}
.information .data-ul > li:hover {
  padding: 12px 44px;
  background-color: #177210;
  cursor: pointer;
}
.information .data-ul .active {
  background-color: #177210;
}
@media (min-width: 768px) {
  .information .bg > .container > .row {
    margin-left: 0;
    margin-right: 0;
  }
}
</style>
