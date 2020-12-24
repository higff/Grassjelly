<template>
  <div class="join">
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
    <Notice v-if="on == 0"></Notice>
    <Flow v-else-if="on == 1"></Flow>
    <Advantage v-else-if="on == 2"></Advantage>
    <Support v-else-if="on == 3"></Support>
    <Analyse v-else></Analyse>
    <Footer></Footer>
  </div>
</template>

<script>
import Hander from "@/components/Hander";
import Footer from "@/components/Footer";
import Notice from "@/components/Notice";
import Flow from "@/components/Flow";
import Advantage from "@/components/Advantage";
import Support from "@/components/Support";
import Analyse from "@/components/Analyse";
export default {
  components: {
    Hander,
    Footer,
    Notice,
    Flow,
    Advantage,
    Support,
    Analyse,
  },
  data() {
    return {
      menu: ["合作须知", "合作流程", "合作优势", "合作支持", "投资分析"],
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
  mounted() {
    document
      .getElementsByClassName("list-unstyled data-ul row")[0]
      .getElementsByTagName("li")[0].className =
      "col-sm-6 col-md-4 col-lg-2 active";
  },
};
</script>

<style>
.join .bg {
  background: #44a23d;
  color: #fff;
}
.join .data-ul > li {
  padding: 12px 44px;
  text-align: center;
  color: #fff;
}
.join .data-ul > li:hover {
  padding: 12px 44px;
  background-color: #177210;
  cursor: pointer;
}
.join .data-ul .active {
  background-color: #177210;
}
@media (min-width: 768px) {
  .join .bg > .container > .row {
    margin-left: 0;
    margin-right: 0;
  }
}
</style>
