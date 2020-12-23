<template>
  <div class="product">
    <Hander></Hander>
    <div id="category-page">
      <div id="page">
        <!-- Main Container  主体容器 -->
        <section class="main-container col2-left-layout">
          <div class="container">
            <div class="row">
              <!-- 右侧 -->
              <div class="col-sm-9 col-sm-push-3">
                <!-- 轮播图 -->
                <div class="category-description std">
                  <div class="slider-items-products">
                    <div
                      id="category-desc-slider"
                      class="product-flexslider hidden-buttons"
                    >
                      <div
                        class="slider-items slider-width-col1 owl-carousel owl-theme"
                      >
                        <!-- Item -->
                        <div class="item">
                          <router-link to=""
                            ><img alt="" src="images/category-img1.jpg"
                          /></router-link>
                          <div class="cat-img-title cat-bg cat-box">
                            <div class="small-tag">烧仙草</div>
                            <h1 class="cat-heading">最新系列</h1>
                            <p>给你不一样的体验</p>
                          </div>
                        </div>
                        <!-- End Item -->

                        <!-- Item -->
                        <div class="item">
                          <router-link to=""
                            ><img alt="" src="images/category-img2.jpg"
                          /></router-link>
                          <div class="cat-img-title cat-bg cat-box">
                            <div class="small-tag">特调奶茶</div>
                            <h1 class="cat-heading">新口味</h1>
                            <p>多种口味，任君挑选</p>
                          </div>
                          <!-- End Item -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 轮播图结束 -->

                <article class="col-main">
                  <h3 class="page-heading">
                    <span class="page-heading-title">水果奶茶</span>
                  </h3>
                  <div class="toolbar">
                    <!-- 导航弹性 -->
                    <div class="row">
                      <div class="col-md-4 col-sm-8">
                        <div class="btn-group">
                          <!-- 格子显示 -->
                          <div
                            id="grid-view"
                            class="btn btn-default active"
                            data-toggle="tooltip"
                            title="Grid"
                          >
                            <router-link to="shop_grid.html"
                              ><i class="fa fa-th"></i
                            ></router-link>
                          </div>

                          <!-- 目录显示 -->
                          <div
                            id="list-view"
                            class="btn btn-default"
                            data-toggle="tooltip"
                            title="List"
                          >
                            <router-link to=""
                              ><i class="fa fa-th-list"></i
                            ></router-link>
                          </div>
                        </div>
                        <router-link to="" id="compare-total"
                          >产品查看</router-link
                        >
                      </div>
                      <div class="col-sm-2 text-right sort-by hidden-sm">
                        <label class="control-label" for="input-sort"
                          >产品分类:</label
                        >
                      </div>
                      <div class="col-md-3 col-sm-6 text-right">
                        <select
                          id="input-sort"
                          class="form-control col-sm-3"
                          v-model="active"
                        >
                          <!-- <option value="1" selected="selected">默认</option> -->
                          <option
                            v-for="(item, index) of category"
                            :value="item.id"
                            :key="index"
                          >
                            {{ item.cate_name }}
                          </option>
                        </select>
                      </div>
                      <div class="col-sm-1 text-right show-limit hidden-sm">
                        <label class="control-label" for="input-limit"
                          >显示:</label
                        >
                      </div>
                      <div class="col-md-2 col-sm-6 text-right">
                        <select
                          id="input-limit"
                          class="form-control"
                          v-model="pagesize"
                        >
                          <!-- <option value="15" selected="selected">15</option> -->
                          <option value="3">3</option>
                          <option value="5">5</option>
                        </select>
                      </div>
                    </div>
                  </div>

                  <!-- 商品动态加载区 -->
                  <!-- 商品动态加载区 -->
                  <div class="category-products">
                    <ul class="products-grid">
                      <li
                        class="item col-lg-4 col-md-4 col-sm-4 col-xs-6"
                        v-for="(v, i) of pq_product"
                        :key="i"
                      >
                        <div class="item-inner">
                          <div class="item-img">
                            <div class="item-img-info">
                              <router-link
                                class="product-image"
                                title="Product Title Here"
                                :to="`/category?id=${v.id}`"
                              >
                                <img :src="`images/products/${v.pro_img}`" />
                              </router-link>
                              <div class="jtv-box-hover">
                                <ul class="add-to-links">
                                  <li>
                                    <router-link
                                      class="link-quickview"
                                      :to="`/category?id=${v.id}`"
                                    >
                                      <i class="icon-magnifier-add icons"></i>
                                      <span class="hidden">快速查看</span>
                                    </router-link>
                                  </li>
                                  <li>
                                    <router-link class="link-wishlist" to="/">
                                      <i class="icon-heart icons"></i>
                                      <span class="hidden">意愿清单</span>
                                    </router-link>
                                  </li>
                                  <li>
                                    <router-link class="link-compare" to="/">
                                      <i class="icon-shuffle icons"></i>
                                      <span class="hidden">比较</span>
                                    </router-link>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                          <div class="item-info">
                            <div class="info-inner">
                              <div class="item-title">
                                <h6>
                                  <router-link
                                    title="Product Title Here"
                                    :to="`/category?id=${v.id}`"
                                  >
                                    {{ v.pro_name }}
                                  </router-link>
                                </h6>
                              </div>
                              <div class="item-content">
                                <div class="rating">
                                  <!-- fa-star-o就是获得星星 -->
                                  <i
                                    class="fa fa-star"
                                    v-for="i of star"
                                    :key="i"
                                  ></i>
                                  <i
                                    class="fa fa-star-o"
                                    v-for="i of 5 - star"
                                    :key="i + star"
                                  ></i>
                                </div>
                                <div class="item-price">
                                  <div class="price-box">
                                    <span class="regular-price">
                                      <span class="price"
                                        >￥:{{ v.pro_price.toFixed(2) }}</span
                                      >
                                    </span>
                                  </div>
                                </div>
                                <div class="action">
                                  <button
                                    class="button btn-cart"
                                    type="button"
                                    data-original-title="Add to Cart"
                                    @click="addCart(v.id, 1)"
                                  >
                                    <span>添加到购物车</span>
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>
                  <!-- 商品动态加载区 结束-->

                  <div class="toolbar">
                    <div class="row">
                      <div class="col-sm-12 text-left">
                        <ul class="pagination">
                          <!-- <li class="active"><span>1</span></li> -->
                          <li
                            v-for="i of pagecount"
                            :key="i"
                            @click="upPage(i)"
                          >
                            <router-link to="">{{ i }}</router-link>
                          </li>
                          <li @click="upPagePlus()">
                            <router-link to="">&gt;</router-link>
                          </li>
                          <li @click="upPageEnd()">
                            <router-link to="">&gt;|</router-link>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </article>
                <!--	///*///======    End article  ========= //*/// -->
              </div>

              <!-- 左侧 -->
              <div class="sidebar col-sm-3 col-xs-12 col-sm-pull-9">
                <aside class="sidebar">
                  <div class="block product-price-range">
                    <div class="block-title">
                      <h3>价格</h3>
                    </div>
                    <div class="block-content">
                      <div class="slider-range">
                        <div
                          data-label-reasult="Range:"
                          data-min="0"
                          data-max="500"
                          data-unit="$"
                          class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
                          data-value-min="50"
                          data-value-max="350"
                        >
                          <div
                            class="ui-slider-range ui-widget-header ui-corner-all"
                            style="left: 10%; width: 60%"
                          ></div>
                          <span
                            class="ui-slider-handle ui-state-default ui-corner-all"
                            tabindex="0"
                            style="left: 10%"
                          ></span
                          ><span
                            class="ui-slider-handle ui-state-default ui-corner-all"
                            tabindex="0"
                            style="left: 70%"
                          ></span>
                        </div>
                        <div class="amount-range-price">范围: ￥10 - $550</div>
                        <ul class="check-box-list">
                          <li>
                            <input type="checkbox" id="p1" name="cc" />
                            <label for="p1">
                              <span class="button"></span> ￥20 - $50<span
                                class="count"
                                >(0)</span
                              >
                            </label>
                          </li>
                          <li>
                            <input type="checkbox" id="p2" name="cc" />
                            <label for="p2">
                              <span class="button"></span> ￥50 - $100<span
                                class="count"
                                >(10)</span
                              >
                            </label>
                          </li>
                          <li>
                            <input type="checkbox" id="p3" name="cc" />
                            <label for="p3">
                              <span class="button"></span> ￥100 - $250<span
                                class="count"
                                >(0)</span
                              >
                            </label>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="block block-cart">
                    <div class="block-title">
                      <!--我的购物车  -->
                      <h3>我的购物车</h3>
                    </div>
                    <div class="block-content">
                      <div class="summary">
                        <p class="amount">
                          购物车里共有<router-link to="">{{
                            cartArr.length
                          }}</router-link
                          >件物品
                        </p>
                        <p class="subtotal">
                          <span class="label">合计:</span>
                          <span class="price">￥0</span>
                        </p>
                      </div>
                      <div class="ajax-checkout">
                        <button
                          class="button button-checkout"
                          title="Submit"
                          type="submit"
                        >
                          <span>立即购买</span>
                        </button>
                      </div>
                      <p class="block-subtitle">最近添加的商品</p>
                      <ul>
                        <li class="item" v-for="(v, i) of cartArr" :key="i">
                          <router-link
                            to=""
                            title="Product Title Here"
                            class="product-image"
                            ><img
                              :src="`images/products/${v.img}`"
                              alt="Product Title Here"
                          /></router-link>
                          <div class="product-details">
                            <div class="access">
                              <router-link
                                to=""
                                title="Remove This Item"
                                class="jtv-btn-remove"
                              >
                                <span class="icon"></span> Remove
                              </router-link>
                            </div>
                            <strong>{{ v.productCount }}</strong> x
                            <span class="price">{{ v.price }}</span>
                            <p class="product-name">
                              <a href="#">{{ v.productTitle }}</a>
                            </p>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>

                  <div class="custom-slider">
                    <div>
                      <div
                        id="carousel-example-generic"
                        class="carousel slide"
                        data-ride="carousel"
                      >
                        <ol class="carousel-indicators">
                          <li
                            class="active"
                            data-target="#carousel-example-generic"
                            data-slide-to="0"
                          ></li>
                          <li
                            data-target="#carousel-example-generic"
                            data-slide-to="1"
                            class=""
                          ></li>
                          <li
                            data-target="#carousel-example-generic"
                            data-slide-to="2"
                            class=""
                          ></li>
                        </ol>
                        <div class="carousel-inner">
                          <div class="item active">
                            <img src="images/slide3.jpg" alt="slide3" />
                            <div class="carousel-caption">
                              <h3>
                                <router-link title=" Sample Product" to=""
                                  >经典热销</router-link
                                >
                              </h3>
                              <p>给你最好的味觉体验</p>
                              <router-link class="link" to=""
                                >进入商铺</router-link
                              >
                            </div>
                          </div>
                          <div class="item">
                            <img src="images/slide1.jpg" alt="slide1" />
                            <div class="carousel-caption">
                              <h3>
                                <router-link title=" Sample Product" to=""
                                  >最新推荐</router-link
                                >
                              </h3>
                              <p>你不想来一杯奶茶吗?</p>
                            </div>
                          </div>
                          <div class="item">
                            <img src="images/slide2.jpg" alt="slide2" />
                            <div class="carousel-caption">
                              <h3>
                                <router-link title=" Sample Product" to=""
                                  >最新特价</router-link
                                >
                              </h3>
                              <p>现在购买有优惠</p>
                            </div>
                          </div>
                        </div>
                        <router-link
                          class="left carousel-control"
                          to=""
                          data-slide="prev"
                        >
                          <span class="sr-only">Previous</span>
                        </router-link>
                        <router-link
                          class="right carousel-control"
                          to=""
                          data-slide="next"
                        >
                          <span class="sr-only">Next</span>
                        </router-link>
                      </div>
                    </div>
                  </div>
                  <div class="block block-list block-viewed">
                    <div class="block-title">
                      <!-- 最近看过 -->
                      <h3>最近看过</h3>
                    </div>
                    <div class="block-content">
                      <ol id="recently-viewed-items">
                        <li class="item odd" v-for="(v, i) of seenArr" :key="i">
                          <p class="product-name">
                            <router-link to=""
                              ><i class="fa fa-angle-right"></i
                              >{{ v.productTitle }}</router-link
                            >
                          </p>
                        </li>
                      </ol>
                    </div>
                  </div>
                </aside>
              </div>
            </div>
          </div>
        </section>
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
      // 最近添加的商品
      cartArr: [],
      // 产品对比
      comparArr: [],
      // 最近看过的商品
      seenArr: [],
      // 商品评分
      star: 5,
      // 默认商品分类ID
      active: "1",
      // 存储指定分类下包含的商品数据
      pq_product: [],
      // 存储指定下包含的商品分类数据
      category: [],
      //初始化的页码
      page: 1,
      //存储总页数
      pagecount: 0,
      //商品单页显示的数量
      pagesize: 5,
    };
  },
  beforeMount() {
    if (location.href.indexOf("#reloaded") == -1) {
      location.href = location.href + "#reloaded";
      location.reload();
    }
  },

  methods: {
    // 加载数据的方法
    loadData(id, page, pagesize) {
      // let str = "?" + this.qs.stringify(object);
      this.axios
        .get("/product", {
          params: {
            id: id,
            page: page,
            pagesize: pagesize,
          },
        })
        .then((res) => {
          // 获取总页数
          this.pagecount = res.data.pagecount;
          // 获取商品数据
          this.pq_product = res.data.pros;
        });
    },
    // 页码加载数据的方法
    upPage(value) {
      // 清空之前的数据
      this.pq_product = [];
      // 调用loadData()方法,重新加载数据
      this.page = parseInt(value);
      // console.log(this.page,typeof(value));
      this.loadData(this.active, this.page, this.pagesize);
    },
    // 页码加1
    upPagePlus() {
      if (this.page < this.pagecount) {
        // 清空之前的数据
        this.pq_product = [];
        // 调用loadData()方法,重新加载数据
        this.page += 1;
        this.loadData(this.active, this.page, this.pagesize);
      }
    },
    // 最后一页
    upPageEnd() {
      // 清空之前的数据
      this.pq_product = [];
      // 调用loadData()方法,重新加载数据
      this.page = this.pagecount;
      this.loadData(this.active, this.page, this.pagesize);
    },
    // 将商品添加到购物车的事件
    addCart(id, count) {
      if (this.$store.state.isLogin)
        this.axios.get("/pro", { params: { id: id } }).then((res) => {
          let obj = {
            userid: this.$store.state.info.id,
            proid: id,
            pname: res.data.pro.pro_name,
            img: res.data.pro.pro_img,
            price: res.data.pro.pro_price,
            count: count,
            is_checked: 1,
            create_time: this.moment(new Date()).format("YYYY-MM-DD hh:mm:ss"),
            update_time: this.moment(new Date()).format("YYYY-MM-DD hh:mm:ss"),
          };
          this.axios.post("/cart/add", this.qs.stringify(obj)).then((res) => {
            if (res.data.code == 200)
              if (confirm("此商品已添加到购物车，是否前往购物车查看"))
                this.$router.push("/cart");
            if (res.data.code == 201)
              if (confirm("这个商品您已经填加过了，是否前往购物车查看"))
                this.$router.push("/cart");
          });
        });
      else {
        if (confirm("您还没有登录哟，是否跳转到登录页面"))
          this.$router.push("/login");
      }
    },
  },
  watch: {
    active(value) {
      // 清空之前的数据
      this.pq_product = [];
      // 将页码重置1
      this.page = 1;
      // 此时的value代表的切换后的顶部选项卡的ID
      // 既然id(分类ID)已经知道了,那么此时就需要发送请求以获取服务器的相关数据
      // 调用loadData()方法
      this.loadData(value, this.page, this.pagesize);
    },
    pagesize(value) {
      // 清空之前的数据
      this.pq_product = [];
      // 调用loadData()方法,重新加载数据
      this.loadData(this.active, this.page, value);
    },
  },
  mounted() {
    // 发送请求加载商品分类
    this.axios.get("/category").then((res) => {
      this.category = res.data.cates;
      // console.log(this.category);
    });
    this.loadData(this.active, this.page, this.pagesize);
  },
};
</script>