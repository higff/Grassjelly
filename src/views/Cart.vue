<template>
  <div class="cart">
    <Hander></Hander>
    <section class="page-content-wrapper login-area ptb-100">
      <div class="container">
        <div @click="del">
          <div class="row title">
            <div class="col-md-1 col-sm-1 col-xs-1">选中</div>
            <div class="col-md-2 col-sm-2 col-xs-2">图片</div>
            <div class="col-md-2 col-sm-2 col-xs-2">产品名称</div>
            <div class="col-md-2 col-sm-2 col-xs-2">价格</div>
            <div class="col-md-2 col-sm-2 col-xs-2">数量</div>
            <div class="col-md-2 col-sm-2 col-xs-2">小计</div>
            <div class="col-md-1 col-sm-1 col-xs-1">删除</div>
          </div>
          <div class="row tab" v-for="(v, k) of carts" :key="k">
            <div class="col-md-1 col-sm-1 col-xs-1">
              <input id="lin" type="checkbox" v-model="v.is_checked" />
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2">
              <router-link to="/"
                ><img :src="`images/products/${v.img}`"
              /></router-link>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2">
              <router-link to="/" style="font-size: 17px">{{
                v.pname
              }}</router-link>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2">
              <span class="amount">￥{{ v.price.toFixed(2) }}</span>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2 product-quantity">
              <button class="but" @click="change(-1, k)">-</button
              ><input id="link" type="text" :value="`${v.count}`" /><button
                class="but"
                @click="change(+1, k)"
              >
                +
              </button>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2">
              <span>￥{{ v.price * v.count }}</span>
            </div>
            <div class="col-md-1 col-sm-1 col-xs-1">
              <span style="font-size: 20px; cursor: pointer" :data-k="k"
                >x</span
              >
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-9 col-sm-7 col-xs-12">
            <div class="buttons-cart">
              <input type="submit" value="更新购物车" />
              <router-link to="/">继续购物</router-link>
            </div>
            <div class="coupon">
              <h3>优惠券</h3>
              <p>输入优惠券代码（如果有）</p>
              <input type="text" placeholder="优惠券代码" />
              <input type="submit" value="申请优惠券" />
            </div>
          </div>
          <div class="col-md-3 col-sm-5 col-xs-12">
            <div class="cart_totals">
              <p>总计</p>
              <div class="order-total">
                <span class="amount">￥{{ total.toFixed(2) }}</span>
              </div>
              <router-link class="wc-proceed-to-checkout" to="/"
                >进行结算</router-link
              >
            </div>
          </div>
        </div>
      </div>
    </section>
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
      box: 1,
      carts: [
        {
          pid: 1,
          pname: "标题",
          price: 4599,
          count: 1,
          img: "01.jpg",
          is_checked: 1,
        },
      ],
    };
  },
  methods: {
    check() {
      for (let che of this.carts) {
        che.is_checked = this.box;
      }
    },
    change(n, k) {
      if (this.carts[k].count > 0) {
        this.carts[k].count += n;
      } else {
        this.carts.splice(k, 1);
      }
    },
    del(e) {
      if (e.target.nodeName == "SPAN" && e.target.innerHTML == "x") {
        let k = e.target.dataset.k;
        this.carts.splice(k, 1);
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

  },
  computed: {
    total() {
      let total = 0;
      for (let p of this.carts) {
        if (p.is_checked) {
          total += p.price * p.count;
        }
      }
      return total;
    },
  },
};
</script>
<style>
.cart .title div,
.cart .tab div {
  border: 1px solid #44a23d;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0;
}
.cart .title div:not(:first),
.cart .tab div:not(:first) {
  border-left: 0;
}
.cart .title div:not(:last-child),
.cart .tab div:not(:last-child) {
  border-right: 0;
}
.cart .title div {
  font-weight: bold;
}
.cart .tab div {
  border-top: 0;
}
@media (min-width: 378px) {
  .cart .title div {
    padding: 5px 0;
    font-size: 12px;
    background: #ffffff;
  }
  .cart .tab div {
    height: 55px;
    background: #ffffff;
    font-size: 14px;
  }
  .cart .tab div > a {
    font-size: 14px !important;
  }
  .cart #lin,
  .cart .but {
    width: 20px;
    height: 20px;
    line-height: 20px;
  }
  .cart .login-area input {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #eceff8;
    width: 20px;
    height: 20px;
    margin: 0 5px;
    text-align: center;
  }
  .cart .cart_totals {
    margin-top: 0;
  }
}

@media (min-width: 768px) {
  .cart .title,
  .cart .tab {
    margin-left: 0;
    margin-right: 0;
  }
  .cart .title div {
    padding: 10px 0;
    background: transparent;
    font-size: 16px;
  }
  .cart .tab div {
    height: 128px;
    background: transparent;
    font-size: 16px;
  }
  .cart .tab div > a {
    font-size: 16px !important;
  }
  .cart #lin,
  .cart .but {
    width: 30px;
    height: 30px;
    line-height: 28px;
  }
  .cart .login-area input {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #eceff8;
    width: 50px;
    height: 30px;
    margin: 0 10px;
    text-align: center;
  }
    .cart .cart_totals {
    margin-top: 30px;
  }
}

.cart .login-area select {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: 1px solid #eceff8;
}
.cart .login-area.pt-30 {
  background: #fff;
}
.cart .product-thumbnail img {
  width: 100%;
}
.cart .product-name a {
  color: #333333;
}
.cart .product-name a:hover {
  color: #8bc34a;
}
.cart .buttons-cart input,
.coupon input[type="submit"],
.buttons-cart a,
.coupon-info p.form-row input[type="submit"] {
  background: #252525 none repeat scroll 0 0;
  border: medium none;
  border-radius: 0;
  box-shadow: none;
  color: #fff;
  display: inline-block;
  /* float: left; */
  font-size: 12px;
  font-weight: 700;
  height: 40px;
  line-height: 40px;
  margin-right: 15px;
  padding: 0 15px;
  text-shadow: none;
  text-transform: uppercase;
  transition: all 0.3s ease 0s;
  white-space: nowrap;
  width: inherit;
  margin-top: 30px;
}
.cart .buttons-cart {
  margin-bottom: 30px;
  overflow: hidden;
}
.cart .buttons-cart input,
.cart .coupon input[type="submit"],
.cart .buttons-cart a,
.cart .coupon-info p.form-row input[type="submit"] {
  background: #252525 none repeat scroll 0 0;
  border: medium none;
  border-radius: 0;
  box-shadow: none;
  color: #fff;
  display: inline-block;
  /* float: left; */
  font-size: 12px;
  font-weight: 700;
  height: 40px;
  line-height: 40px;
  margin-right: 15px;
  padding: 0 15px;
  text-shadow: none;
  text-transform: uppercase;
  transition: all 0.3s ease 0s;
  white-space: nowrap;
  width: inherit;
}
.cart .coupon input[type="submit"] {
  margin-top: 0;
}
.cart .buttons-cart input:hover,
.cart .coupon input[type="submit"]:hover,
.cart .buttons-cart a:hover {
  background: #8bc34a none repeat scroll 0 0;
  color: #fff;
}
.cart .buttons-cart a {
  color: #fff;
  float: left;
  height: 40px;
  line-height: 40px;
}
.cart .coupon {
  overflow: hidden;
  padding-bottom: 5px;
}
.cart .coupon h3 {
  font-size: 14px;
  font-weight: 500;
  margin: 0 0 10px;
  text-transform: uppercase;
}
.cart .coupon input[type="text"] {
  background: #ffffff none repeat scroll 0 0;
  border: 1px solid #e5e5e5;
  float: left;
  height: 40px;
  margin: 0 6px 20px 0;
  max-width: 100%;
  padding: 0 0 0 10px;
  width: 170px;
}
.cart .cart_totals {
  float: left;
  text-align: right;
  width: 100%;
}
.cart .cart_totals h2 {
  border-bottom: 2px solid #333333;
  color: #333333;
  display: inline-block;
  font-size: 24px;
  margin: 0 0 30px;
  text-transform: uppercase;
}
.cart .cart_totals table {
  border: medium none;
  float: right;
  margin: 0;
  text-align: right;
}
.cart .cart_totals table th {
  border: medium none;
  font-size: 14px;
  font-weight: bold;
  padding: 0 20px 12px 0;
  text-align: right;
  text-transform: uppercase;
  vertical-align: top;
}
.cart .cart_totals table td {
  border: medium none;
  padding: 0 0 12px;
  vertical-align: top;
}
.cart .cart_totals table td .amount {
  color: #8bc34a;
  float: right;
  font-size: 13px;
  font-weight: bold;
  margin-left: 5px;
  text-align: right;
  text-transform: uppercase;
}
.cart .cart_totals table td ul#shipping_method {
  list-style: outside none none;
  margin: 0;
  padding: 0;
}
.cart .cart_totals table td ul#shipping_method li {
  float: left;
  margin: 0 0 10px;
  padding: 0;
  text-indent: 0;
  width: 100%;
}
.cart .cart_totals table td ul#shipping_method li input {
  margin: 0;
  position: relative;
  top: 2px;
}
.cart .cart_totals table tr.order-total th,
.cart_totals table tr.order-total .amount {
  font-size: 20px;
  text-transform: uppercase;
  white-space: nowrap;
}
.cart .your-order-table table .order-total th {
  border-bottom: medium none;
  font-size: 18px;
}
.cart .your-order-table table .order-total td {
  border-bottom: medium none;
}
.cart .your-order-table table tr.order-total td span {
  color: #8bc34a;
  font-size: 20px;
}
.cart .wc-proceed-to-checkout {
  clear: both;
  display: block;
}
.cart .wc-proceed-to-checkout {
  background: #8bc34a none repeat scroll 0 0;
  color: #fff;
  display: inline-block;
  font-size: 14px;
  font-weight: 700;
  height: 50px;
  line-height: 50px;
  margin-top: 20px;
  padding: 0 30px;
  text-transform: none;
}
.cart .wc-proceed-to-checkout a:hover {
  background: #252525 none repeat scroll 0 0;
  color: #fff;
}
</style>