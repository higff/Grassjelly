<template>
  <div class="index">
    <Hander></Hander>
    <div id="page">
      <!-- end header -->
      <!-- end nav -->
      <div class="our-features-box hidden-xs">
        <div class="container">
          <div class="row">
            <div
              class="col-md-3 col-xs-12 col-sm-6"
              v-for="(f, i) of features"
              :key="i"
            >
              <div class="feature-box">
                <i :class="f.icon_class"></i>
                <div class="content">
                  <h6>{{ f.content }}</h6>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- JTV Home Slider -->
      <!-- 轮播图div -->
      <div class="jtv-slideshow">
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-sm-12">
              <div
                id="jtv-rev_slider_wrapper"
                class="rev_slider_wrapper fullwidthbanner-container"
              >
                <div id="jtv-rev_slider" class="rev_slider fullwidthabanner">
                  <ul>
                    <li
                      data-transition="random"
                      data-slotamount="7"
                      data-masterspeed="1000"
                      data-thumb="/images/slider/slide-img1.jpg"
                    >
                      <img
                        src="/images/slider/slide-img1.jpg"
                        alt="slide-img"
                        data-bgposition="left top"
                        data-bgfit="cover"
                        data-bgrepeat="no-repeat"
                      />
                      <div class="info">
                        <div
                          class="tp-caption jtv-sub-title sft tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1100"
                          data-easing="Linear.easeNone"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 2;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                          "
                        >
                          <span>成长 OrganicTogether</span>
                        </div>
                        <div
                          class="tp-caption jtv-large-title sfl tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1300"
                          data-easing="Linear.easeNone"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 3;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                          "
                        >
                          <span>100% 品质保障</span>
                        </div>
                        <div
                          class="tp-caption Title sft tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1450"
                          data-easing="Power2.easeInOut"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 4;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                          "
                        >
                          品质 新鲜 保证! 好的 健康.
                        </div>
                        <div
                          class="tp-caption sfb tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1500"
                          data-easing="Linear.easeNone"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 4;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                          "
                        >
                          <router-link to="/product" class="jtv-shop-now-btn"
                            >shop new</router-link
                          >
                        </div>
                      </div>
                    </li>
                    <li
                      data-transition="random"
                      data-slotamount="7"
                      data-masterspeed="1000"
                      data-thumb="/images/slider/slide-img2.jpg"
                    >
                      <img
                        src="/images/slider/slide-img2.jpg"
                        alt="slide-img"
                        data-bgposition="left top"
                        data-bgfit="cover"
                        data-bgrepeat="no-repeat"
                      />
                      <div class="info">
                        <div
                          class="tp-caption jtv-sub-title sft slide2 tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1100"
                          data-easing="Linear.easeNone"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 2;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                            padding-right: 0px;
                          "
                        >
                          <span>每日新鲜有机食品</span>
                        </div>
                        <div
                          class="tp-caption jtv-large-title sfl tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1300"
                          data-easing="Linear.easeNone"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 3;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                          "
                        >
                          Fresh Vegetables
                        </div>
                        <div
                          class="tp-caption Title sft tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1500"
                          data-easing="Power2.easeInOut"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 4;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                          "
                        >
                          最大的健康益处!清爽美味!
                        </div>
                        <div
                          class="tp-caption sfb tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1500"
                          data-easing="Linear.easeNone"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 4;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                          "
                        >
                          <router-link to="/product" class="jtv-shop-now-btn"
                            >Find out more</router-link
                          >
                        </div>
                      </div>
                    </li>
                    <li
                      data-transition="random"
                      data-slotamount="7"
                      data-masterspeed="1000"
                      data-thumb="/images/slider/slide-img3.jpg"
                    >
                      <img
                        src="/images/slider/slide-img3.jpg"
                        alt="slide-img"
                        data-bgposition="left top"
                        data-bgfit="cover"
                        data-bgrepeat="no-repeat"
                      />
                      <div class="info">
                        <div
                          class="tp-caption jtv-sub-title sft slide2 tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1100"
                          data-easing="Linear.easeNone"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 2;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                            padding-right: 0px;
                          "
                        >
                          <span>Save up to 35% off</span>
                        </div>
                        <div
                          class="tp-caption jtv-large-title sfl tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1300"
                          data-easing="Linear.easeNone"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 3;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                          "
                        >
                          Fruit Flavoured
                        </div>
                        <div
                          class="tp-caption Title sft tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1500"
                          data-easing="Power2.easeInOut"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 4;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                          "
                        >
                          Most Popular Ecommerce HTML Template.
                        </div>
                        <div
                          class="tp-caption sfb tp-resizeme"
                          data-endspeed="500"
                          data-speed="500"
                          data-start="1500"
                          data-easing="Linear.easeNone"
                          data-splitin="none"
                          data-splitout="none"
                          data-elementdelay="0.1"
                          data-endelementdelay="0.1"
                          style="
                            z-index: 4;
                            max-width: auto;
                            max-height: auto;
                            white-space: nowrap;
                          "
                        >
                          <router-link to="/product" class="jtv-shop-now-btn"
                            >Order now</router-link
                          >
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- end JTV Home Slider -->
          </div>
        </div>
      </div>
      <!-- jtv bottom banner section -->
      <div class="jtv-bottom-banner-section">
        <div class="container">
          <div class="row">
            <div class="col-sm-4" v-for="(v, k) of imgsq" :key="k">
              <div class="jtv-img-box">
                <router-link to="/">
                  <img :src="`images/${v.img}`" alt="bottom banner" />
                  <div class="jtv-banner-info">
                    <span>Natural 100% Organic</span>
                    <h3>Organic Food</h3>
                  </div>
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Special Product slider -->

      <section class="special-products">
        <div class="container">
          <div class="slider-items-products">
            <div class="jtv-special-block">
              <div class="jtv-block-inner">
                <div class="block-title">
                  <h3 style="">最畅销</h3>
                </div>
                <div class="jtv-decs-text" style="visibility: hidden">
                  洛雷姆·伊普苏姆·多洛尔（Lorem ipsum
                  dolor）坐立不安，奉献高尚，温和的精力和活力，使劳动和悲伤成为eiusmod要做的一些重要事情。这些年来，我会来的。杜伊斯（Duis）因想要成为邪教而在铜杯中遭受痛苦而受到批评。
                </div>
                <router-link to="/" class="jtv-more-bnt">更多产品</router-link>
                <div class="jtv-box-timer">
                  <div class="countbox_1 timer-grid"></div>
                </div>
              </div>
              <div
                id="special-slider"
                class="product-flexslider hidden-buttons"
              >
                <div class="products-grid block-content">
                  <div
                    class="item col-lg-4 col-md-4 col-sm-12"
                    v-for="(c, k) of classical"
                    :key="k"
                  >
                    <div class="item-inner">
                      <div class="item-img">
                        <div class="item-img-info">
                          <router-link
                            class="product-image"
                            :to="`/category?id=${c.id}`"
                          >
                            <img :src="`images/products/${c.pro_img}`" />
                          </router-link>
                          <div class="jtv-box-hover">
                            <ul class="add-to-links">
                              <li>
                                <router-link
                                  class="link-quickview"
                                  :to="`/category?id=${c.id}`"
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
                                  ><span class="hidden">比较</span></router-link
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
                              <router-link :to="`/category?id=${c.id}`">{{
                                c.pro_name
                              }}</router-link>
                            </h6>
                          </div>
                          <div class="item-content">
                            <div class="rating">
                              <i
                                class="fa fa-star"
                                v-for="(n, i) of 5"
                                :key="i"
                              ></i>
                            </div>
                            <div class="item-price">
                              <div class="price-box">
                                <span class="regular-price">
                                  <span class="price"
                                    >￥{{ c.pro_price }}元</span
                                  >
                                </span>
                              </div>
                            </div>
                            <div class="action">
                              <button
                                class="button btn-cart"
                                type="button"
                                data-original-title="Add to Cart"
                                @click="addCart(c.id, 1)"
                              >
                                <span>加入到购物车</span>
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
      </section>
      <div class="content-page">
        <div class="container">
          <!-- Product Tabs-->
          <div class="category-product">
            <div class="navbar nav-menu">
              <div class="navbar-collapse">
                <div class="jtv-title">
                  <h3>特色产品</h3>
                </div>
                <ul class="nav navbar-nav">
                  <li v-for="(p, i) of pros" :key="i">
                    <router-link data-toggle="tab" :to="p.to">{{
                      p.title
                    }}</router-link>
                  </li>
                </ul>
              </div>
              <!-- /.navbar-collapse -->
            </div>
            <div class="tab-container">
              <!-- tab product -->
              <!-- 四层第一楼 -->
              <div v-for="(p, i) of pros" :key="i" class="tab-panel" :id="p.id">
                <div class="category-products">
                  <ul class="products-grid">
                    <li
                      class="item col-lg-3 col-md-3 col-sm-4 col-xs-6"
                      v-for="(v, k) of p.list"
                      :key="k"
                    >
                      <div class="item-inner">
                        <div class="item-img">
                          <div class="item-img-info">
                            <router-link
                              :to="`/category?id=${v.id}`"
                              class="product-image"
                            >
                              <img :src="`images/products/${v.pro_img}`" />
                            </router-link>
                            <div class="jtv-box-hover">
                              <ul class="add-to-links">
                                <li>
                                  <router-link
                                    :to="`/category?id=${v.id}`"
                                    class="link-quickview"
                                  >
                                    <i class="icon-magnifier-add icons"></i
                                    ><span class="hidden">快速查看</span>
                                  </router-link>
                                </li>
                                <li>
                                  <router-link to="/" class="link-wishlist">
                                    <i class="icon-heart icons"></i
                                    ><span class="hidden">意愿清单</span>
                                  </router-link>
                                </li>
                                <li>
                                  <router-link to="/" class="link-compare">
                                    <i class="icon-shuffle icons"></i
                                    ><span class="hidden">比较</span>
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
                                <router-link :to="`/category?id=${v.id}`">
                                  {{ v.pro_name }}
                                </router-link>
                              </h6>
                            </div>
                            <div class="item-content">
                              <div class="rating">
                                <i
                                  class="fa fa-star"
                                  v-for="(n, i) of 5"
                                  :key="i"
                                ></i>
                              </div>
                              <div class="item-price">
                                <div class="price-box">
                                  <span class="regular-price">
                                    <span class="price"
                                      >￥{{ v.pro_price }}元</span
                                    >
                                  </span>
                                </div>
                              </div>
                              <div class="action">
                                <button
                                  class="button btn-cart"
                                  type="button"
                                  data-original-title="Add to Cart"
                                  @click="addCart(v.id)"
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
              </div>
              <!-- tab product -->
            </div>
          </div>
        </div>
      </div>
      <!-- 五楼 -->
      <div class="jtv-top-banner">
        <div class="container">
          <div class="imgbox"><img src="images/banner1.jpg" alt="" /></div>
          <div class="jtv-cont-box">
            <h3>
              100% <br />
              天然
            </h3>
            <div class="jtv-line-bg"></div>
            <p>优雅</p>
          </div>
          <div class="imgbox"><img src="images/banner2.jpg" alt="" /></div>
          <div class="jtv-cont-box2">
            <h3>
              永远<br />
              新鲜
            </h3>
            <div class="jtv-line-bg"></div>
            <p>美观</p>
          </div>
          <div class="imgbox"><img src="images/banner3.jpg" alt="" /></div>
          <div class="jtv-cont-box3">
            <h3>
              健康<br />
              烹饪
            </h3>
            <div class="jtv-line-bg"></div>
            <p>美味</p>
          </div>
        </div>
      </div>
      <!-- 六楼 -->
      <div class="jtv-testimonial-block">
        <div class="container">
          <div class="row">
            <div class="col-md-12" data-wow-delay="0.2s">
              <div class="block-title">
                <h3>我们的成员</h3>
              </div>
              <div
                class="carousel slide"
                data-ride="carousel"
                id="quote-carousel"
              >
                <!-- Bottom Carousel Indicators -->
                <ol class="carousel-indicators">
                  <li
                    data-target="#quote-carousel"
                    v-for="(v, k) of portrait"
                    :key="k"
                    :data-slide-to="k"
                    class="data-mmm"
                  >
                    <img
                      class="img-responsive"
                      :src="`images/${v.img}`"
                      alt=""
                    />
                  </li>
                </ol>

                <!-- Carousel Slides / Quotes -->
                <div class="carousel-inner text-center">
                  <!-- Quote 1 -->
                  <div class="item" v-for="(v, k) of portrait" :key="k">
                    <blockquote>
                      <div class="row">
                        <div class="col-sm-8 col-sm-offset-2">
                          <p>
                            {{ v.particulars }}
                          </p>
                          <div class="holder-info">
                            <strong class="name">{{ v.name }}</strong>
                            <strong class="designation">{{
                              v.position
                            }}</strong>
                          </div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </div>

                <!-- Carousel Buttons Next/Prev -->
                <router-link
                  data-slide="prev"
                  to="#quote-carousel"
                  class="left carousel-control"
                  ><i class="fa fa-chevron-left"></i
                ></router-link>
                <router-link
                  data-slide="next"
                  to="#quote-carousel"
                  class="right carousel-control"
                  ><i class="fa fa-chevron-right"></i
                ></router-link>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Latest Blog -->
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="blog-outer-container">
              <div class="jtv-title">
                <h3>最新资讯</h3>
              </div>
              <div class="blog-inner">
                <div class="col-sm-4" v-for="(v, k) of blogs" :key="k">
                  <div class="entry-thumb">
                    <router-link to="/">
                      <img alt="Blog" :src="`images/blog-img${v.id}.jpg`" />
                    </router-link>
                  </div>
                  <div class="blog-preview_info">
                    <h4>
                      <router-link to="/">{{ v.title }}</router-link>
                    </h4>
                    <ul class="post-meta">
                      <li>
                        <i class="fa fa-user"></i
                        ><router-link to="/">{{ v.author_name }}</router-link>
                      </li>
                      <li>
                        <i class="fa fa-comments"></i
                        ><router-link to="/">评论</router-link>
                      </li>
                      <li><i class="fa fa-calendar"></i>{{ v.create_time }}</li>
                    </ul>
                    <div class="blog-preview_desc">
                      {{ v.description }}
                    </div>
                    <router-link class="blog-preview_btn" to="/"
                      >阅读更多<i class="fa fa-long-arrow-right"></i
                    ></router-link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End Latest Blog -->
    </div>
    <Footer></Footer>

    <!-- <router-view/> -->
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
      pros: [
        { title: "烧仙草系列", to: "#tab-1", id: "tab-1", pro_id: 3 },
        { title: "特调奶茶系列", to: "#tab-2", id: "tab-2", pro_id: 4 },
        { title: "益菌多系列", to: "#tab-3", id: "tab-3", pro_id: 5 },
        { title: "鲜果茶系列", to: "#tab-4", id: "tab-4", pro_id: 6 },
        { title: "奶昔系列", to: "#tab-5", id: "tab-5", pro_id: 7 },
      ],
      imgsq: [
        { img: "jtv-banner1.jpg" },
        { img: "jtv-banner2.jpg" },
        { img: "jtv-banner3.jpg" },
      ],
      pro_list: [],
      classical: [],
      recommend: [],
      // 四层第一楼
      recommend1: [
        { title: "标题1", price: 155.0, img: "01.jpg" },
        { title: "标题2", price: 255.0, img: "02.jpg" },
        { title: "标题3", price: 355.0, img: "03.jpg" },
        { title: "标题4", price: 455.0, img: "04.jpg" },
      ],
      // 五层第一楼
      portrait: [
        {
          img: "testimonials-img1.jpg",
          particulars:
            "作为一个程序员，郁闷的事情是，面对一个代码块，却不敢去修改。更糟糕的是，这个代码块还是自己写的。",
          name: "张明彪",
          position: "No.1",
        },
        {
          img: "testimonials-img2.jpg",
          particulars:
            "世上只有两种编程语言：一种是总是被人骂的，一种是从来没人用的。",
          name: "林可",
          position: "No.2",
        },
        {
          img: "testimonials-img3.jpg",
          particulars:
            "任何傻瓜都能写出计算机可以理解的代码。好的程序员能写出人能读懂的代码。",
          name: "熊杰",
          position: "No.3",
        },
        {
          img: "testimonials-img4.jpg",
          particulars:
            "用代码行数来评估程序的开发进度，就好比是拿重量来评估一个飞机的建造进度。",
          name: "袁学平",
          position: "No.4",
        },
        {
          img: "testimonials-img5.jpg",
          particulars:
            "如果建筑工人盖房子的方式跟程序员写程序一样，那第一只飞来的啄木鸟就将毁掉人类文明。",
          name: "周鑫",
          position: "No.5",
        },
      ],
      // 最新资讯
      blogs: [],
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
    getPro(id, page, pagesize) {
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
          this.pro_list.forEach((pro) => {
            if (pro.cate_id == 1 && this.pro_list.length == 3)
              this.classical.push(pro);
            if (pro.cate_id >= 3 && this.pro_list.length == 23)
              this.recommend.push(pro);
          });
          this.pros.forEach((p) => {
            p.list = [];
            this.recommend.forEach((r) => {
              if (r.cate_id == p.pro_id) p.list.push(r);
            });
          });
          // 更新界面
          this.$forceUpdate();
        });
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
  },
  beforeMount() {
    if (location.href.indexOf("#reloaded") == -1) {
      location.href = location.href + "#reloaded";
      location.reload();
    }
  },
  mounted() {
    document
      .getElementsByClassName("nav navbar-nav")[0]
      .getElementsByTagName("li")[0].className = "active";
    document
      .getElementsByClassName("tab-container")[0]
      .getElementsByClassName("tab-panel")[0].className = "tab-panel active";
    document
      .getElementsByClassName("carousel-inner text-center")[0]
      .getElementsByClassName("item")[2].className = "item active";
    document
      .getElementsByClassName("carousel-indicators")[0]
      .getElementsByClassName("data-mmm")[2].className = "active";
    // 获取商品列表
    this.getPro(1, 1, 3);
    for (let i = 3; i <= 7; i++) {
      this.getPro(i, 1, 4);
    }
    // 获取资讯
    this.axios
      .get("/information", {
        params: {
          id: 13,
          page: 1,
          pagesize: 3,
        },
      })
      .then((res) => {
        // 将得到的资讯添加到infos中去
        this.blogs.push(...res.data.infos);
        // 更新界面
        this.$forceUpdate();
      });
  },
};
</script>