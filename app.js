// 加载Express模块
const express = require('express');
// 加载CORS模块
const cors = require('cors');
// 加载body-parser模块
const bodyParser = require('body-parser');
// 加载md5模块
const md5 = require('md5');
// 加载MySQL模块
const mysql = require('mysql');

// 创建WEB服务器
const server = express();

// 为所有的HTTP请求使用CORS模块
server.use(cors({
    origin: ['http://127.0.0.1:8080', 'http://localhost:8080']
}));

// 为所有的HTTP请求使用body-parser模块
server.use(bodyParser.urlencoded({
    extended: false
}));

//创建MySQL连接池
const pool = mysql.createPool({
    // 数据库服务器的地址
    host: '127.0.0.1',
    // 数据库服务器的端口号
    port: 3306,
    // 数据库用户的用户名
    user: 'root',
    // 数据库用户的密码
    password: '',
    // 数据库名称
    database: 'pqmt',
    // 最大连接数
    connectionLimit: 15
});

// 用户注册接口
server.post('/register', (req, res) => {
    // 获取用户名和电话信息
    let username = req.body.username;
    let phone = req.body.phone;
    // 将密码进行md5加密
    req.body.password = md5(req.body.password);
    // 先需要以uname为条件进行用户的查找操作
    let sql = 'SELECT COUNT(id) AS count FROM pq_user WHERE username=? OR phone=?';
    // 执行SQL查询
    pool.query(sql, [username, phone], (error, results) => {
        if (error) throw error;
        if (results[0].count)
            res.send({
                code: 201,
                message: '用户已存在，注册失败'
            });
        else {
            sql = 'INSERT INTO pq_user SET ?';
            pool.query(sql, [req.body], (error, results) => {
                if (error) throw error;
                res.send({
                    code: 200,
                    message: '用户注册成功'
                });
            });
        }
    });
});

// 用户注册信息验证接口
server.get('/res', (req, res) => {
    let name = req.query.name;
    let value = req.query.value;
    let sql = 'SELECT COUNT(id) AS count FROM pq_user WHERE ?=?';
    pool.query(sql, [name, value], (error, results) => {
        if (error) throw error;
        results[0].count == 0 ? res.send({
            code: 200,
            message: name == 'username' ? '此用户可以注册' : '此号码可以注册'
        }) : res.send({
            code: 201,
            message: name == 'username' ? '此用户已注册' : '此号码已注册'
        });
    });
});

// 用户登录接口
server.post('/login', (req, res) => {
    // 获取用户名和密码信息
    let username = req.body.username;
    let password = md5(req.body.password);
    // SQL查询语句
    let sql = 'SELECT id,username,nickname FROM pq_user WHERE username=? AND password=?';
    // 执行SQL查询
    pool.query(sql, [username, password], (error, results) => {
        if (error) throw error;
        results.length == 0 ?
            res.send({
                code: 201,
                message: '登录失败'
            }) :
            res.send({
                code: 200,
                message: '登录成功',
                info: results[0]
            });
    });
});

// 获取一级导航栏接口
server.get('/nav', (req, res) => {
    // SQL查询语句
    let sql = 'SELECT id,nav_name,link FROM pq_nav';
    pool.query(sql, (error, menu) => {
        if (error) throw error;
        res.send({
            code: 200,
            message: '查询成功',
            menu: menu
        });
    });
});

// 获取二级级导航栏接口
server.get('/navItem', (req, res) => {
    // SQL查询语句
    let sql = 'SELECT id,nav_item_name,navid FROM pq_nav_item';
    pool.query(sql, (error, results) => {
        if (error) throw error;
        res.send({
            code: 200,
            message: '查询成功',
            navItems: results
        });
    });
});

// 获取商品类别接口
server.get('/category', (req, res) => {
    // SQL查询语句
    let sql = 'SELECT id,cate_name FROM pq_category ORDER BY id ASC';
    pool.query(sql, (error, results) => {
        if (error) throw error;
        res.send({
            code: 200,
            message: '查询成功',
            cates: results
        });
    });
});

// 获取指定类别的商品列表接口
server.get('/product', (req, res) => {
    // 获取地址栏URL参数 -- 文章分类ID
    let id = req.query.id;
    // 获取地址栏URL参数 -- 页码
    let page = req.query.page;
    // 每页显示的记录数量
    let pagesize = parseInt(req.query.pagesize);
    // 根据当前页码，并且结合LIMIT语句的标准公式来计算出offset参数值
    let offset = (page - 1) * pagesize;
    // 执行SQL语句，获取总记录数
    let sql = `SELECT COUNT(id) AS count FROM pq_product WHERE cate_id=?`;
    // 执行SQL查询
    pool.query(sql, [id], (error, results) => {
        if (error) throw error;
        // 计算出总页数
        let pagecount = Math.ceil(results[0].count / pagesize);
        // 查找特定分类下包含的文章数据
        sql = 'SELECT id,cate_id,pro_name,pro_detail,pro_img,pro_price,pro_stock,pro_status FROM pq_product WHERE cate_id=? LIMIT ?,?';
        // 执行SQL查询
        pool.query(sql, [id, offset, pagesize], (error, pros) => {
            if (error) throw error;
            res.send({
                code: 200,
                message: "查询成功",
                pros: pros,
                pagecount: pagecount
            });
        });
    });
});

// 获取所有商品信息接口
server.get('/proAll', (req, res) => {
    let sql = 'SELECT id,cate_id,pro_name,pro_detail,pro_img,pro_price,pro_stock,pro_status FROM pq_product';
    pool.query(sql, [id], (error, proAll) => {
        if (error) throw error;
        res.send({
            code: 200,
            message: "查询成功",
            proAll: proAll
        });
    });
});

// 获取单个商品信息接口
server.get('/pro', (req, res) => {
    let id = req.query.id;
    let sql = 'SELECT COUNT(id) AS count FROM pq_product WHERE id=?';
    pool.query(sql, [id], (error, results) => {
        if (error) throw error;
        if (!results[0].count)
            res.send({
                code: 201,
                message: "查询失败",
            });
        else {
            sql = 'SELECT id,cate_id,pro_name,pro_detail,pro_img,pro_price,pro_stock,pro_status FROM pq_product WHERE id=?';
            pool.query(sql, [id], (error, pro) => {
                if (error) throw error;
                res.send({
                    code: 200,
                    message: "查询成功",
                    pro: pro[0]
                });
            });
        }
    });

});

// 获取指定类别的新闻资讯接口
server.get('/information', (req, res) => {
    // 获取地址栏URL参数 -- 文章分类ID
    let id = req.query.id;
    // 获取地址栏URL参数 -- 页码
    let page = req.query.page;
    // 每页显示的记录数量
    let pagesize = parseInt(req.query.pagesize);
    // 根据当前页码，并且结合LIMIT语句的标准公式来计算出offset参数值
    let offset = (page - 1) * pagesize;
    // 执行SQL语句，获取总记录数
    let sql = `SELECT COUNT(id) AS count FROM pq_info WHERE info_id=?`;
    // 执行SQL查询
    pool.query(sql, [id], (error, results) => {
        if (error) throw error;
        // 计算出总页数
        let pagecount = Math.ceil(results[0].count / pagesize);
        // 查找特定分类下包含的文章数据
        sql = 'SELECT id,title,description,content,image,author_name,info_id,create_time FROM pq_info WHERE info_id=? LIMIT ?,?';
        // 执行SQL查询
        pool.query(sql, [id, offset, pagesize], (error, infos) => {
            if (error) throw error;
            res.send({
                code: 200,
                message: "查询成功",
                infos: infos,
                pagecount: pagecount
            });
        });
    });
});

// 添加购物车接口
server.post('/cart/add', (req, res) => {
    let userid = req.body.userid;
    let pname = req.body.pname;
    let sql = 'SELECT COUNT(id) AS count FROM pq_cart WHERE userid=? AND pname=?';
    // 执行SQL查询
    pool.query(sql, [userid, pname], (error, results) => {
        if (error) throw error;
        if (results[0].count)
            res.send({
                code: 201,
                message: '此商品已添加，请在购物车里查看'
            });
        else {
            sql = 'INSERT INTO pq_cart SET ?';
            pool.query(sql, [req.body], (error, results) => {
                if (error) throw error;
                res.send({
                    code: 200,
                    message: '商品添加成功'
                });
            });
        }
    });
});

// 删除指定购物车接口
server.delete('/cart/delete', (req, res) => {
    let id = req.query.id;
    let sql = 'DELETE FROM pq_cart WHERE id=?';
    pool.query(sql, [id], (error, results) => {
        if (error) throw error;
        res.send({
            code: 200,
            message: '此商品已删除'
        });
    });
});

// 查询指定用户下的所有购物车接口
server.get('/cart/select', (req, res) => {
    let id = req.query.userid;
    let sql = 'SELECT id,pname,img,price,count,is_checked FROM pq_cart WHERE userid=?';
    pool.query(sql, [id], (error, carts) => {
        if (error) throw error;
        res.send({
            code: 200,
            message: '查询成功',
            carts: carts
        });
    });
});

// 修改指定购物车接口
server.put('/cart/update', (req, res) => {
    let obj = req.body;
    let sql = 'UPDATE pq_cart SET ? WHERE id=?';
    pool.query(sql, [obj, obj.id], (error, results) => {
        if (error) throw error;
        if (!results.affectedRows) {
            res.send({
                code: 201,
                message: '更新失败',
            });
            return;
        }
        res.send({
            code: 200,
            message: '更新成功',
        });
    });
});

// 指定 WEB服务器监听的端口
server.listen(5050);