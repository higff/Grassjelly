<template>
  <div class="hander" @click="dj">
    <div class="cms-index-index cms-home-page">
      <!-- mobile menu -->
      <div id="jtv-mobile-menu">
        <ul>
          <li>
            <div class="jtv-search-mob">
              <form id="search1" name="search">
                <div class="input-group">
                  <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                      <i class="fa fa-search"></i>
                    </button>
                  </div>
                  <input
                    type="text"
                    class="form-control simple"
                    placeholder="搜索商品"
                    name="srch-term"
                    id="srch-term"
                  />
                </div>
              </form>
            </div>
          </li>
          <li v-for="(nav, i) of navs" :key="i">
            <router-link :to="nav.link">{{ nav.nav_name }}</router-link>
            <ul v-if="nav.items">
              <li v-for="(item, i) of nav.items" :key="i">
                <router-link :to="item.link"
                  ><span>{{ item.nav_item_name }}</span></router-link
                >
              </li>
            </ul>
          </li>
        </ul>
        <div class="jtv-top-link-mob">
          <ul class="links">
            <li style="visibility: hidden"></li>
            <li v-for="(s, i) of small_nav" :key="i">
              <router-link :to="s.link">{{ s.nav_name }}</router-link>
            </li>
            <li class="last" v-if="!isLogin">
              <router-link to="/login">登录</router-link>
            </li>
            <li class="last" v-else>
              <span class="user"
                >你好,{{ info.nickname || info.username }}</span
              >
              <router-link to="/" @click.native.capture="logout"
                >注销</router-link
              >
            </li>
          </ul>
        </div>
      </div>
      <!---->
      <div id="page">
        <!-- Header -->
        <header>
          <div class="header-container">
            <div class="header-top">
              <div class="container">
                <div class="row">
                  <div class="col-xs-12 col-sm-6">
                    <div class="welcome-msg">欢迎来到 佩奇书亦烧仙草 !</div>
                  </div>
                  <div class="col-xs-6 hidden-xs">
                    <!-- Header Top Links -->
                    <div class="jtv-top-links">
                      <div class="links">
                        <ul>
                          <li
                            class="hidden-xs"
                            v-for="(s, i) of small_nav"
                            :key="i"
                          >
                            <router-link :to="s.link">{{
                              s.nav_name
                            }}</router-link>
                          </li>
                          <li>
                            <div
                              class="dropdown block-company-wrapper hidden-xs"
                            >
                              <a
                                role="button"
                                data-toggle="dropdown"
                                data-target="#"
                                class="block-company dropdown-toggle"
                                href="javascript:;"
                                >更多<span class="caret"></span
                              ></a>
                              <ul class="dropdown-menu">
                                <li v-for="(m, i) of dropdown_menu" :key="i">
                                  <router-link :to="m.link">{{
                                    m.menu_name
                                  }}</router-link>
                                </li>
                              </ul>
                            </div>
                          </li>
                          <li class="hidden-xs" v-if="!isLogin">
                            <router-link to="/login">登录</router-link>
                          </li>
                          <li class="hidden-xs" v-else>
                            <span class="user"
                              >你好,{{ info.nickname || info.username }}</span
                            >
                            <router-link to="/" @click.native.capture="logout"
                              >注销</router-link
                            >
                          </li>
                        </ul>
                      </div>
                    </div>
                    <!-- End Header Top Links -->
                  </div>
                </div>
              </div>
            </div>

            <div class="container">
              <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                  <div class="jtv-top-cart-box">
                    <!-- Top Cart -->
                    <div class="mini-cart">
                      <div
                        data-toggle="dropdown"
                        data-hover="dropdown"
                        class="basket dropdown-toggle"
                      >
                        <router-link
                          :to="isLogin ? '/cart' : '/login'"
                        ></router-link>
                      </div>
                      <div></div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 col-md-4 col-sm-4 col-xs-12 jtv-logo-box">
                  <!-- Header Logo -->
                  <div class="logo">
                    <h1>
                      <router-link to="/">
                        <img alt="eCommerce" src="images/logo.png" />
                      </router-link>
                    </h1>
                  </div>
                  <!-- End Header Logo -->
                </div>
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 hidden-xs">
                  <div class="search-box">
                    <form
                      action="cat"
                      method="POST"
                      id="search_mini_form"
                      name="Categories"
                    >
                      <input
                        type="text"
                        placeholder="搜索商品"
                        value=""
                        maxlength="70"
                        name="search"
                        id="search"
                      />
                      <button type="button" class="search-btn-bg">
                        <span class="glyphicon glyphicon-search"></span>&nbsp;
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </header>
        <!-- end header -->
        <!-- Navigation -->
        <nav>
          <div class="container">
            <div class="mm-toggle-wrap">
              <div class="mm-toggle">
                <i class="fa fa-align-justify"></i
                ><span class="mm-label">Menu</span>
              </div>
            </div>
            <div class="nav-inner">
              <!-- BEGIN NAV -->
              <ul id="nav" class="hidden-xs">
                <li class="drop-menu">
                  <router-link to="/" class="level-top"
                    ><span>网站首页</span></router-link
                  >
                </li>
                <li class="mega-menu">
                  <router-link to="/product" class="level-top"
                    ><span>经典推荐</span></router-link
                  >
                  <div class="jtv-menu-block-wrapper">
                    <div class="jtv-menu-block-wrapper2">
                      <div class="nav-block jtv-nav-block-center">
                        <div class="col-1">
                          <ul class="level0">
                            <li
                              class="parent item"
                              v-for="(c, i) of classical"
                              :key="i"
                            >
                              <router-link to="/product"
                                ><span>{{ c.cate_name }}</span></router-link
                              >
                              <ul class="level1">
                                <li v-for="(p, i) of c.pros" :key="i">
                                  <router-link :to="`/category?id=${p.id}`"
                                    ><span>{{ p.pro_name }}</span></router-link
                                  >
                                </li>
                              </ul>
                            </li>
                          </ul>
                        </div>
                        <div class="col-2">
                          <div class="jtv-nav-image1">
                            <router-link to="/product"
                              ><img alt="menu_image" src="images/menu-img1.jpg"
                            /></router-link>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="mega-menu">
                  <router-link to="/product" class="level-top"
                    ><span>特色饮品</span></router-link
                  >
                  <div class="jtv-menu-block-wrapper">
                    <div class="jtv-menu-block-wrapper2">
                      <div class="nav-block jtv-nav-block-center">
                        <ul class="level0">
                          <li
                            class="parent item"
                            v-for="(b, i) of beverage"
                            :key="i"
                          >
                            <router-link to="/product"
                              ><span>{{ b.cate_name }}</span></router-link
                            >
                            <ul class="level1">
                              <li v-for="(p, i) of b.pros" :key="i">
                                <router-link :to="`/category?id=${p.id}`"
                                  ><span>{{ p.pro_name }}</span></router-link
                                >
                              </li>
                            </ul>
                          </li>
                        </ul>
                      </div>
                      <div class="jtv-nav-banner">
                        <div
                          class="jtv-banner-box"
                          v-for="(v, i) of 3"
                          :key="i"
                        >
                          <div class="jtv-nav-banner-img">
                            <router-link to="/product">
                              <img :src="`images/menu-img${v + 1}.jpg`" />
                            </router-link>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="mega-menu">
                  <router-link to="/show" class="level-top"
                    ><span>店面风采</span></router-link
                  >
                </li>
                <li class="mega-menu">
                  <router-link to="/information" class="level-top"
                    ><span>新闻资讯</span></router-link
                  >
                  <div class="jtv-menu-block-wrapper">
                    <div class="jtv-menu-block-wrapper2">
                      <div
                        class="nav-block jtv-nav-block-center jtv-menu-box-left"
                      >
                        <ul class="level0">
                          <li
                            class="parent item"
                            v-for="(t, i) of information"
                            :key="i"
                          >
                            <router-link to="/information"
                              ><span>{{ t.nav_item_name }}</span></router-link
                            >
                            <ul class="level1">
                              <li v-for="(msg, i) of t.msgs" :key="i">
                                <router-link to="/information"
                                  ><span
                                    ><i>>></i> {{ msg.title }}</span
                                  ></router-link
                                >
                              </li>
                            </ul>
                          </li>
                        </ul>
                      </div>
                      <div
                        class="nav-block nav-block-right std jtv-menu-box-right"
                      >
                        <img src="images/menu-img5.jpg" alt="menu img" />
                      </div>
                    </div>
                  </div>
                </li>
                <li class="mega-menu">
                  <router-link to="/message" class="level-top"
                    ><span>在线留言</span></router-link
                  >
                </li>
                <li class="drop-menu">
                  <router-link to="/about" class="level-top"
                    ><span>关于我们</span></router-link
                  >
                  <ul>
                    <li v-for="(a, i) of about" :key="i">
                      <router-link to="/">{{ a.nav_item_name }}</router-link>
                    </li>
                  </ul>
                </li>
                <li class="mega-menu">
                  <router-link to="/join" class="level-top"
                    ><span>加盟合作</span></router-link
                  >
                </li>
                <li class="nav-custom-link mega-menu">
                  <router-link to="/contact" class="level-top"
                    ><span>联系我们</span></router-link
                  >
                  <div class="jtv-menu-block-wrapper custom-menu">
                    <div class="header-nav-dropdown-wrapper">
                      <div
                        class="jtv-custom-box"
                        v-for="(r, i) of relation"
                        :key="i"
                      >
                        <i class="fa fa-home"></i>
                        <h6 class="heading">{{ r.title }}</h6>
                        <p>{{ r.content }}</p>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <!-- end nav -->
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
export default {
  data() {
    return {
      // 一级导航栏
      navs: [
        { nav_name: "网站首页", link: "/" },
        {
          nav_name: "经典推荐",
          link: "/product",
          items: [
            { nav_item_name: "热销", link: "/product" },
            { nav_item_name: "推荐", link: "/product" },
            { nav_item_name: "烧仙草系列", link: "/product" },
            { nav_item_name: "特调奶茶系列", link: "/product" },
            { nav_item_name: "益菌多系列", link: "/product" },
            { nav_item_name: "鲜果茶系列", link: "/product" },
          ],
        },
        {
          nav_name: "特色饮品",
          link: "/product",
          items: [
            { nav_item_name: "奶昔系列", link: "/product" },
            { nav_item_name: "烧仙草系列", link: "/product" },
            { nav_item_name: "特调奶茶系列", link: "/product" },
            { nav_item_name: "益菌多系列", link: "/product" },
            { nav_item_name: "鲜果茶系列", link: "/product" },
            { nav_item_name: "小料", link: "/product" },
          ],
        },
        { nav_name: "店面风采", link: "/show" },
        {
          nav_name: "新闻资讯",
          link: "/information",
          items: [
            { nav_item_name: "公司动态", link: "/" },
            { nav_item_name: "行业资讯", link: "/" },
          ],
        },
        { nav_name: "在线留言", link: "/message" },
        { nav_name: "关于我们", link: "/about" },
        { nav_name: "加盟合作", link: "/join" },
        { nav_name: "联系我们", link: "/contact" },
      ],
      // 二级级导航栏
      nav_items: [],
      // 小导航
      small_nav: [
        { nav_name: "我的账户", link: "/" },
        { nav_name: "购物清单", link: "/" },
        { nav_name: "结账", link: "/" },
      ],
      // 下拉选项
      dropdown_menu: [
        { menu_name: "关于我们", link: "/about" },
        { menu_name: "售后服务", link: "/" },
        { menu_name: "隐私政策", link: "/" },
        { menu_name: "网站导航", link: "/" },
      ],
      // 商品类别
      category: [],
      // 经典推荐
      classical: [],
      // 特色饮品
      beverage: [],
      // 商品列表
      pro_list: [],
      // 新闻资讯
      information: [],
      // 资讯
      infos: [],
      // 关于我们
      about: [],
      // 联系我们
      relation: [
        {
          title: "成都总部地址",
          content: "成都武侯区长华路19号万科汇智中心6楼",
        },
        {
          title: "长沙分公司地址",
          content: "湖南省长沙市长沙县科技新城B28-2栋",
        },
        { title: "武汉分公司地址", content: "武汉市硚口区越秀财富中心7楼713" },
        {
          title: "广东分公司地址",
          content: "广东省佛山市南海区友邦金融中心二座3楼",
        },
      ],
      // 店铺优点
      features: [
        { icon_class: "icon-plane icons", content: "准时送达" },
        {
          icon_class: "icon-earphones-alt icons",
          content: "为客户提供全天候的支持",
        },
        { icon_class: "icon-like icons", content: "100% 满意度保证" },
        { icon_class: "icon-tag icons", content: "每日优惠折扣" },
      ],
    };
  },
  methods: {
    ...mapMutations(["logoutMutation"]),
    getInfo(id, page, pagesize) {
      this.axios
        .get("/information", {
          params: {
            id: id,
            page: page,
            pagesize: pagesize,
          },
        })
        .then((res) => {
          // 将得到的资讯添加到infos中去
          this.infos.push(...res.data.infos);
          // 将获取的资讯添加到对象标题下中去
          this.information.forEach((nav) => {
            nav.msgs = [];
            this.infos.forEach((info) => {
              if (info.info_id == nav.id) nav.msgs.push(info);
            });
          });
          // 更新界面
          this.$forceUpdate();
        });
    },
    getPro(id, page, pagesize, arr) {
      this.axios
        .get("/product", {
          params: {
            id: id,
            page: page,
            pagesize: pagesize,
          },
        })
        .then((res) => {
          this.pro_list.push(...res.data.pros);
          arr.forEach((nav) => {
            nav.pros = [];
            this.pro_list.forEach((pro) => {
              if (pro.cate_id == nav.id) nav.pros.push(pro);
            });
          });
          // 更新界面
          this.$forceUpdate();
        });
    },
    logout() {
      this.logoutMutation();
    },
    dj(e) {
      if (e.target.nodeName == "SPAN") {
        if (
          e.target.className != "expand fa fa-minus open" &&
          e.target.className != "expand fa fa-plus"
        )
          location.reload();
      }
    },
  },
  mounted() {
    // 获取一级导航栏
    // this.axios.get("/nav").then((res) => {
    //   this.navs.push(...res.data.menu);
    // });
    // 获取二级导航栏
    this.axios.get("/navItem").then((res) => {
      this.nav_items.push(...res.data.navItems);
      // 将二级导航栏对应的导航栏添加到新闻资讯
      this.nav_items.forEach((n) => {
        if (n.navid == 5) this.information.push(n);
      });
      // 将二级导航栏对应的导航栏添加到关于我们
      this.nav_items.forEach((n) => {
        if (n.navid == 7) this.about.push(n);
      });
      // 获取资讯文章
      // 1.公司动态
      this.getInfo(13, 1, 5);
      // 2.行业资讯
      this.getInfo(14, 1, 5);
    });

    // 获取商品类别
    this.axios.get("/category").then((res) => {
      this.category = res.data.cates;
      // 将商品类别对应的类别添加到经典推荐和特色饮品的二级导航栏
      this.category.forEach((cate) => {
        if (cate.id <= 6) this.classical.push(cate);
        if (cate.id >= 3) this.beverage.push(cate);
      });
      // 经典推荐
      for (let i = 1; i <= 6; i++) {
        this.getPro(i, 1, 4, this.classical);
      }
      // 特色饮品
      for (let i = 7; i <= 8; i++) {
        this.getPro(i, 1, 4, this.beverage);
      }
    });
    // 监听浏览器后退事件，执行页面刷新
    // window.addEventListener(
    //   "popstate",
    //   (e) => {
    //     // 刷新页面
    //     location.reload();
    //   },
    //   false
    // );
  },
  // 计算属性
  computed: {
    // ...打散，相当于
    // isLogin(){return this.$store.state.isLogin}
    // info(){return this.$store.state.info}
    ...mapState(["isLogin", "info"]),
  },
};
</script>
<style>
.hander .user {
  display: inline-block;
  padding: 0px;
  color: #fff;
  font-size: 12px;
  padding-left: 15px;
  font-weight: normal;
  text-decoration: none;
}
</style>
