<template>
  <div class="login">
    <div class="content">
      <div class="form sign-in">
        <h2>欢迎回来</h2>
        <label>
          <span>用户名</span>
          <input type="text" v-model="username" @blur="checkUsername" />
          <span class="color">{{ uname }}</span>
        </label>
        <label>
          <span>密码</span>
          <input type="password" v-model="password" @blur="checkPassword" />
          <span class="color">{{ pawd }}</span>
        </label>
        <p class="forgot-pass"><a href="javascript:">忘记密码？</a></p>
        <button type="button" class="submit" @click="login">登 录</button>
        <div class="img__btn" @click="tag">
          <span class="m--up">注 册</span>
          <span class="m--in">登 录</span>
        </div>
      </div>
      <div class="sub-cont">
        <div class="img">
          <div class="img__text m--up">
            <h2>还未注册？</h2>
            <p>立即注册，尊享书亦烧仙草美味！</p>
          </div>
          <div class="img__text m--in">
            <h2>已有帐号？</h2>
            <p>有帐号就登录吧，好久不见了！</p>
          </div>
          <div class="img__btn" @click="tag">
            <span class="m--up">注 册</span>
            <span class="m--in">登 录</span>
          </div>
        </div>
        <div class="form sign-up">
          <h2>立即注册</h2>
          <label>
            <span>用户名</span>
            <input type="text" v-model="regusername" @blur="checkregUsername" />
            <span class="color">{{ reguname }}</span>
          </label>
          <label>
            <span>密码</span>
            <input
              type="password"
              v-model="regpassword"
              @blur="checkregPassword"
            />
            <span class="color">{{ regpawd }}</span>
          </label>
          <label>
            <span>手机号</span>
            <input type="text" v-model="phone" @blur="checkPhone" />
            <span class="color">{{ ph }}</span>
          </label>
          <label>
            <span>昵称</span>
            <input type="text" v-model="nickname" @blur="checkNickname" />
            <span class="color">{{ nname }}</span>
          </label>
          <button type="button" class="submit" @click="handle">注 册</button>
          <div class="img__btn" @click="tag">
            <span class="m--up">注 册</span>
            <span class="m--in">登 录</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: "",
      password: "",
      regusername: "",
      regpassword: "",
      phone: "",
      nickname: "",
      uname: "",
      pawd: "",
      reguname: "",
      regpawd: "",
      ph: "",
      nname: "",
    };
  },
  methods: {
    tag() {
      document.querySelector(".content").classList.toggle("s--signup");
    },
    login() {
      if (this.checkUsername() && this.checkPassword()) {
        this.axios
          .post(
            "/login",
            "username=" + this.username + "&password=" + this.password
          )
          .then((res) => {
            //登录失败
            if (res.data.code == 201) {
              alert("用户名或者密码错误");
            }
            // 登录成功 -- 后续还需要继续调整
            if (res.data.code == 200) {
              // 提交Mutations,以改变用户的登录状态及信息
              this.$store.commit("loginMutation", res.data.info);
              // 将用户登录状态的相关信息存储到WebStorage中
              localStorage.setItem("isLogin", 1);
              //因为在webStorage中,键值只能为字符串,所以
              //需要通过JSON.stringify()将服务器返回对象数据转换为字符串类型,然后再通过setItem()方法添加到WebStorage中
              localStorage.setItem("info", JSON.stringify(res.data.info));
              // 跳转到首页
              this.$router.push("/");
            }
          });
      }
    },
    handle() {
      if (
        this.checkregUsername() &&
        this.checkregPassword() &&
        this.checkPhone() &&
        this.checkNickname()
      ) {
        let obj = {
          username: this.regusername,
          password: this.regpassword,
          phone: this.phone,
          nickname: this.nickname,
          create_time: this.moment(new Date()).format('YYYY-MM-DD hh:mm:ss'),
          update_time: this.moment(new Date()).format('YYYY-MM-DD hh:mm:ss')
        };
        this.axios
          .post(
            "/register",this.qs.stringify(obj))
          .then((res) => {
            //注册失败
            if (res.data.code == 201) {
              alert("注册失败");
            }
            //注册成功
            if (res.data.code == 200) {
              this.tag();
            }
          });
      }
    },
    checkUsername() {
      let usernameRegExp = /^[0-9A-Za-z]{6,12}$/;
      if (usernameRegExp.test(this.username)) {
        return true;
      } else {
        this.uname = "×用户名长度为6~12位×";
        return false;
      }
    },
    checkPassword() {
      let passwordRegExp = /^[0-9A-Za-z]{6,12}$/;
      if (passwordRegExp.test(this.password)) {
        return true;
      } else {
        this.pawd = "×密码长度为6~12位×";
        return false;
      }
    },
    checkregUsername() {
      let regusernameRegExp = /^[0-9A-Za-z]{6,12}$/;
      if (regusernameRegExp.test(this.regusername)) {
        this.reguname = "";
        return true;
      } else {
        this.reguname = "×用户名长度为6~12位×";
        return false;
      }
    },
    checkregPassword() {
      let regpasswordRegExp = /^[0-9A-Za-z]{6,12}$/;
      if (regpasswordRegExp.test(this.regpassword)) {
        return true;
      } else {
        this.regpawd = "×密码长度为6~12位×";
        return false;
      }
    },
    checkPhone() {
      let phoneRegExp = /^1[3-9][0-9]{9}$/;
      if (phoneRegExp.test(this.phone)) {
        this.ph = "";
        return true;
      } else {
        this.ph = "×手机号码长度为11位×";
        return false;
      }
    },
    checkNickname() {
      let nicknameRegExp = /^[\u4e00-\u9fa5]+$/;
      if (nicknameRegExp.test(this.nickname)) {
        this.nname = "";
        return true;
      } else {
        this.nname = "×昵称长度为2~6位×";
        return false;
      }
    },
  },
};
</script>

<style>
@media (min-width: 378px) {
  .login .img:after {
    display: none;
  }
  .login .sub-cont {
    padding-left: 0 !important;
  }
  .login .img__btn:nth-of-type(1) {
    color: #d4af7a !important;
    border: 1px solid #d4af7a;
    border-radius: 100px;
  }
  .login .content {
    top: 44%;
  }
}
@media (min-width: 768px) {
  .login .img:after {
    display: block;
  }
  .login .sub-cont {
    padding-left: 350px !important;
  }
  .login .form {
    width: 75% !important;
  }
  .login .form .sign-up {
    margin-right: 0 !important;
  }
  .login .img__btn:nth-of-type(1) {
    display: none;
  }
}
.login {
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
}

.login input,
.login button {
  border: none;
  outline: none;
  background: none;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
}

.login .tip {
  font-size: 20px;
  margin: 40px auto 50px;
  text-align: center;
}
.login .color {
  color: tomato;
}
.login .content {
  overflow: hidden;
  position: absolute;
  left: 50%;
  top: 50%;
  width: 900px;
  height: 640px;
  margin: -300px 0 0 -450px;
  background: #fff;
}

.login .form {
  position: relative;
  width: 100%;
  height: 100%;
  transition: -webkit-transform 0.6s ease-in-out;
  transition: transform 0.6s ease-in-out;
  transition: transform 0.6s ease-in-out, -webkit-transform 0.6s ease-in-out;
  padding: 50px 30px 0;
}

.login .sub-cont {
  overflow: hidden;
  position: absolute;
  left: 640px;
  top: 0;
  width: 100%;
  height: 100%;
  padding-left: 260px;
  background: #fff;
  transition: -webkit-transform 0.6s ease-in-out;
  transition: transform 0.6s ease-in-out;
  transition: transform 0.6s ease-in-out, -webkit-transform 0.6s ease-in-out;
}

.login .content.s--signup .sub-cont {
  -webkit-transform: translate3d(-640px, 0, 0);
  transform: translate3d(-640px, 0, 0);
}

.login button {
  display: block;
  margin: 0 auto;
  width: 260px;
  height: 36px;
  border-radius: 30px;
  color: #fff;
  font-size: 15px;
  cursor: pointer;
}

.login .img {
  overflow: hidden;
  z-index: 2;
  position: absolute;
  left: 0;
  top: 0;
  width: 260px;
  height: 100%;
  padding-top: 360px;
}

.login .img:before {
  content: "";
  position: absolute;
  right: 0;
  top: 0;
  width: 900px;
  height: 100%;
  background-image: url(/images/bg.jpg);
  background-size: cover;
  transition: -webkit-transform 0.6s ease-in-out;
  transition: transform 0.6s ease-in-out;
  transition: transform 0.6s ease-in-out, -webkit-transform 0.6s ease-in-out;
}

.login .img:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6);
}

.login .content.s--signup .img:before {
  -webkit-transform: translate3d(640px, 0, 0);
  transform: translate3d(640px, 0, 0);
}

.login .img__text {
  z-index: 2;
  position: absolute;
  left: 0;
  top: 50px;
  width: 100%;
  padding: 0 20px;
  text-align: center;
  color: #fff;
  transition: -webkit-transform 0.6s ease-in-out;
  transition: transform 0.6s ease-in-out;
  transition: transform 0.6s ease-in-out, -webkit-transform 0.6s ease-in-out;
}

.login .img__text h2 {
  margin-bottom: 10px;
  font-weight: normal;
}

.login .img__text p {
  font-size: 14px;
  line-height: 1.5;
}

.login .content.s--signup .img__text.m--up {
  -webkit-transform: translateX(520px);
  transform: translateX(520px);
}
.login .img__text.m--in {
  -webkit-transform: translateX(-520px);
  transform: translateX(-520px);
}

.login .content.s--signup .img__text.m--in {
  -webkit-transform: translateX(0);
  transform: translateX(0);
}

.login .img__btn {
  overflow: hidden;
  z-index: 2;
  position: relative;
  width: 100px;
  height: 36px;
  margin: 0 auto;
  background: transparent;
  color: #fff;
  text-transform: uppercase;
  font-size: 15px;
  cursor: pointer;
}
.login .img__btn:after {
  content: "";
  z-index: 2;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border: 2px solid #fff;
  border-radius: 30px;
}

.login .img__btn span {
  position: absolute;
  left: 0;
  top: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  transition: -webkit-transform 0.6s;
  transition: transform 0.6s;
  transition: transform 0.6s, -webkit-transform 0.6s;
}

.login .img__btn span.m--in {
  -webkit-transform: translateY(-72px);
  transform: translateY(-72px);
}

.login .content.s--signup .img__btn span.m--in {
  -webkit-transform: translateY(0);
  transform: translateY(0);
}

.login .content.s--signup .img__btn span.m--up {
  -webkit-transform: translateY(72px);
  transform: translateY(72px);
}

.login h2 {
  width: 100%;
  font-size: 26px;
  text-align: center;
}

.login label {
  display: block;
  width: 260px;
  margin: 25px auto 0;
  text-align: center;
}

.login label span {
  font-size: 12px;
  color: #909399;
  text-transform: uppercase;
}

.login input {
  display: block;
  width: 100%;
  margin-top: 5px;
  padding-bottom: 5px;
  font-size: 16px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.4);
  text-align: center;
}

.login .forgot-pass {
  margin-top: 15px;
  text-align: center;
  font-size: 12px;
  color: #cfcfcf;
}

.login .forgot-pass a {
  color: #cfcfcf;
}

.login .submit {
  margin-top: 40px;
  margin-bottom: 20px;
  background: #d4af7a;
  text-transform: uppercase;
}
.login .sign-in {
  transition-timing-function: ease-out;
}
.login .content.s--signup .sign-in {
  transition-timing-function: ease-in-out;
  transition-duration: 0.6s;
  -webkit-transform: translate3d(640px, 0, 0);
  transform: translate3d(640px, 0, 0);
}

.login .sign-up {
  -webkit-transform: translate3d(-900px, 0, 0);
  transform: translate3d(-900px, 0, 0);
}
.login .content.s--signup .sign-up {
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}
.login .center {
  background-color: salmon;
}
</style>