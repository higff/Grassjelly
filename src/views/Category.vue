<template>
  <div>
    <Hander></Hander>
    <!-- 面包渣导航 -->
    <div class="breadcrumbs">
      <div class="container">
        <div class="row">
          <div class="col-xs-12">
            <ul>
              <li class="home">
                <router-link to="/">首页</router-link>
                <span>/</span>
              </li>
              <li><strong>商品详情</strong></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- 面包渣导航结束 -->

    <!-- 详情页开始 -->
    <section class="main-container col1-layout">
      <div class="main">
        <div class="container">
          <div class="row">
            <div class="col-main">
              <div class="product-view">
                <div class="product-essential">
                  <form action="#" method="post" id="product">
                    <div class="product-img-box col-lg-5 col-sm-6 col-xs-12">
                      <div class="new-label new-top-left">New</div>
                      <div class="product-image">
                        <div class="product-full">
                          <img
                            id="product-zoom"
                            :src="`images/products/${info.pro_img}`"
                          />
                        </div>
                      </div>
                      <!-- end: more-images -->
                    </div>
                    <div class="product-shop col-lg-7 col-sm-6 col-xs-12">
                      <div class="product-name">
                        <h2>{{ info.pro_name }}</h2>
                      </div>
                      <div class="rating">
                        <i class="fa fa-star" v-for="(v, i) of 5" :key="i"></i>
                        <!-- <i class="fa fa-star-o"></i> -->
                        <p class="rating-links">5星好评</p>
                      </div>
                      <div class="price-block">
                        <div class="price-box">
                          <p class="special-price">
                            <span class="price-label">价格</span>
                            <span id="product-price-48" class="price">
                              ￥{{ info.pro_price }}元
                            </span>
                          </p>
                        </div>
                      </div>
                      <div class="short-description">
                        <span>商品介绍 ：</span>
                        <p>{{ info.pro_detail }}</p>
                      </div>
                      <div class="short-description">
                        <span>商品数量 ：</span>
                        <span>{{ info.pro_stock }}</span>
                      </div>
                      <div class="short-description">
                        <span>是否在售 ：</span>
                        <span>{{ info.pro_status }}</span>
                      </div>
                      <div class="form-option">
                        <div class="add-to-box">
                          <div class="add-to-cart">
                            <div class="pull-left">
                              <div class="custom pull-left">
                                <label>数量 :</label>
                                <button
                                  onclick="var result = document.getElementById('qty'); var qty = result.value; if( qty>1 ) result.value--;return false;"
                                  class="reduced items-count"
                                  type="button"
                                >
                                  <i class="fa fa-minus">&nbsp;</i>
                                </button>
                                <input
                                  type="text"
                                  class="input-text qty"
                                  title="Qty"
                                  value="1"
                                  maxlength="12"
                                  id="qty"
                                  name="qty"
                                />
                                <button
                                  onclick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;"
                                  class="increase items-count"
                                  type="button"
                                >
                                  <i class="fa fa-plus">&nbsp;</i>
                                </button>
                              </div>
                            </div>
                            <button
                              class="button btn-cart"
                              type="button"
                              @click="addcart"
                            >
                              添加到购物车
                            </button>
                          </div>
                          <div class="email-addto-box">
                            <ul class="add-to-links">
                              <li>
                                <router-link class="link-wishlist" to="/"
                                  ><span>添加到心愿单</span></router-link
                                >
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <hr />
    <!-- 详情页结束 -->
    <!-- 底部图片1开始 -->
    <div class="container" @click="dj">
      <div class="upsell-section">
        <div class="slider-items-products">
          <div class="upsell-block">
            <div class="jtv-block-inner">
              <div class="block-title">
                <h3>其他商品</h3>
              </div>
            </div>
            <div
              id="upsell-products-slider"
              class="product-flexslider hidden-buttons"
            >
              <div class="row products-grid block-content">
                <div
                  class="item col-md-3 col-sm-6 col-xs-12"
                  v-for="(v, k) of picture"
                  :key="k"
                >
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="item-img-info">
                        <router-link
                          class="product-image"
                          :to="`/category?id=${v.id}`"
                          ><img :src="`images/products/${v.pro_img}`"
                        /></router-link>
                        <div class="jtv-box-hover">
                          <ul class="add-to-links">
                            <li>
                              <router-link
                                class="link-quickview"
                                :to="`/category?id=${v.id}`"
                                ><i class="icon-magnifier-add icons"></i
                                ><span class="hidden"
                                  >快速查看</span
                                ></router-link
                              >
                            </li>
                            <li>
                              <router-link class="link-wishlist" to="/"
                                ><i class="icon-heart icons"></i
                                ><span class="hidden"
                                  >意愿清单</span
                                ></router-link
                              >
                            </li>
                            <li>
                              <router-link class="link-compare" to="/"
                                ><i class="icon-shuffle icons"></i
                                ><span class="hidden"
                                  >比较</span
                                ></router-link
                              >
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title">
                          <h6>
                            <router-link :to="`/category?id=${v.id}`">{{
                              v.pro_name
                            }}</router-link>
                          </h6>
                        </div>
                        <div class="item-content">
                          <div class="rating">
                            <i
                              class="fa fa-star"
                              v-for="(v, i) of 5"
                              :key="i"
                            ></i>
                            <!-- <i class="fa fa-star-o"></i> -->
                          </div>
                          <div class="item-price">
                            <div class="price-box">
                              <span class="regular-price">
                                <span class="price">￥{{ v.pro_price }}元</span>
                              </span>
                            </div>
                          </div>
                          <div class="action">
                            <button
                              class="button btn-cart"
                              type="button"
                              data-original-title="Add to Cart"
                              @click="addCart(v.id,1)"
                            >
                              <span>添加到购物车</span>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 底部图片1结束 -->
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
      picture: [],
      info: {},
    };
  },
  methods: {
    dj(e) {
      console.log(e.target.nodeName);
      if (e.target.nodeName == "I" || e.target.nodeName == "A" || e.target.nodeName == "IMG") {
        location.reload();
      }
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
    addcart() {
      // 获取地址栏中的参数
      let id = this.$route.query.id;
      let count = document.getElementById('qty').value;
      this.addCart(id, parseInt(count));
    }
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
    this.axios.get("/pro", { params: { id: id } }).then((res) => {
      this.info = res.data.pro;
      this.info.pro_status = this.info.pro_status == 1 ? "在售" : "售罄";
    });
    this.axios
      .get("/product", {
        params: {
          id: 1,
          page: 1,
          pagesize: 4,
        },
      })
      .then((res) => {
        this.picture.push(...res.data.pros);
      });
  },
};
</script>