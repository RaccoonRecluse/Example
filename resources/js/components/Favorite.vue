<template>
    <div>
        <div class="header">
            <link rel="stylesheet" href="/css/catalog.css" />
            <div class="left">
                <img src="/media/header_left.png" alt="" />
            </div>
            <div>
                <div class="head_cont">
                    <div class="middle">
                        <img src="/media/header_middle.png" alt="" />
                    </div>
                    <div class="right">
                        <img src="/media/header_right.png" alt="" />
                    </div>
                </div>
                <p>Trust the dream</p>
            </div>
        </div>
        <h1 class="hmain">Товары</h1>
        <div class="catalog" v-if="products != []">
            <ul>
                <li
                    v-for="product in products"
                    :key="product.id"
                    :id="product.id"
                >
                    <router-link :to="'/product/' + product.id">
                        <div class="img_cont">
                            <div class="img_back"></div>
                            <div class="img">
                                <img :src="'/media' + product.img" alt="" />
                            </div>
                        </div>
                        <div class="text">
                            <p>{{ product.label }}</p>
                            <p>{{ product.price }}</p>
                            <button></button>
                        </div>
                    </router-link>
                </li>
            </ul>
        </div>
        <h1 class="hmain">Статьи</h1>
        <div v-for="art in articles" class="article" :key="art.id">
        
            <div class="img_back_art">
                <img :src="'/media' + art.img" alt="" />
            </div>
            <div class="text_art">
                <h1>{{ art.title }}</h1>
                <p>{{ art.text }}</p>
                <router-link :to="'/articles/' + art.id">
                <button></button>
                </router-link>
            </div>
            
        </div>
    </div>
</template>

<script>
export default {
    name: "Favorite",
    data() {
        return {
            products: [],
            articles: [],
            start: 0,
        };
    },
    created() {
        if (!localStorage.getItem("token")) this.$router.push("login");
        const instance = axios.create({
            baseURL: "http://127.0.0.1:8000/api",
        });
        instance.defaults.headers.common["Authorization"] = `Bearer ${
            JSON.parse(localStorage.getItem("token")).access_token
        }`;
        instance
            .get("/getAllFavorite")
            .then((res) => {
                this.products = res.data;
            })
            .catch((err) => {
                console.log(err);
            });

        instance
            .get("/getAllFavoriteArticle")
            .then((res) => {
                this.articles = res.data;
            })
            .catch((err) => {
                console.log(err);
            });
    },
    methods: {},
};
</script>
<style scoped>
.hmain{
        text-align: center;
    font-size: 3.65vw;
    font-weight: 300;
    margin: 8vw 0;
}
.article a{
    text-decoration: none;
    color: black;
    cursor: pointer;
}
.article{
    display: flex;
    margin: auto;
    height: 30.26vw;
    width: 63.59vw;
    align-items: center;
    margin-bottom: 12.92vw;
    border: #CCA76E solid 0.26vw    ;
}
.article:nth-child(2n){
    flex-direction: row-reverse;
}
.article:first-child{
    margin-top: 4.92vw;
}
.img_back_art img:not(.article:nth-child(2n) img) {
    height: auto;
    width: 100%;
    margin-left: -1.04vw;
}
.img_back_art {
    height: 21.61vw;
    width: 16.2vw;
    overflow: visible;
    padding: 9.9vw 0;
    margin: -9.9vw 0;
    background-image: url("/media/articImgBacksvg.svg");
    background-size: contain;
    background-repeat: no-repeat;
    background-position: left center;
    margin-left: 5.57vw;
    margin-right: 6.77vw;
}
.article:nth-child(2n) .img_back_art{
    flex-direction: row-reverse;
    background-position: right center;
    margin-right: 5.57vw;
    margin-left: 6.77vw;
    position: relative;
}
.article:nth-child(2n)  img{
    height: auto;
    width: 100%;
    position: absolute;
    right: -1.04vw;
}
.text_art h1 {
    font-size: 1.88vw;
    font-weight: 400;
    width: 26.93vw;
    background-image: url("/media/articHBacksvg.svg");
    background-size: auto 100%;
    background-position: center right;
    background-repeat: no-repeat;
    height: 2.86vw;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    font-weight: 300;
    margin-bottom: 1.56vw;
}
.text_art p {
    text-align: justify;
    font-size: 1.25vw;
    height: 8.70vw;
    width: 29.64vw;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 6;
    -webkit-box-orient: vertical;
    font-weight: 300;

}
.text_art{
    position: relative;
}
.text_art button{
    position: absolute;
    bottom: -5.56vw;
    border: none;
    background-color: transparent;
    right: 0;
    width: 6.93vw;
    height: 2.71vw;
    background-image: url('/media/allbuttonBack.svg');
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center;
    cursor: pointer;
}</style>
<style scoped>
/* начало шапка */

.header {
    display: flex;
    position: relative;
    justify-content: space-between;
    width: 84.9vw;
    padding-left: 2.4vw;
    margin-bottom: 11.56vw;
}

.left {
    background-image: url("/media/header_left_back.svg");
    background-size: 22.03vw 46.82vw;
    background-repeat: no-repeat;
    background-position: left bottom;
    height: 51.72vw;
    width: 25.57vw;
    position: relative;
    margin-top: -8.13vw;
}

.left img {
    position: absolute;
    top: 0;
    right: 0;
    width: 23.39vw;
    height: 49.17vw;
}

.middle {
    background-image: url("/media/header_middle_back.svg");
    background-size: 29.01vw 17.29vw;
    background-repeat: no-repeat;
    background-position: center;
    height: 33.23vw;
    width: 29.01vw;
    position: relative;
    text-align: center;
}

.middle img {
    width: 26.56vw;
    height: 33.23vw;
}

.right {
    background-image: url("/media/header_right_back.svg");
    background-size: 22.86vw 32.92vw;
    background-repeat: no-repeat;
    background-position: right bottom;
    height: 35.05vw;
    width: 25.42vw;
    position: relative;
}

.right img {
    position: absolute;
    top: 0;
    left: 0;
    width: 24.17vw;
    height: 33.23vw;
}

.head_cont {
    display: flex;
    justify-content: space-between;
    width: 57.19vw;
}

.header p {
    text-align: center;
    font-size: 3.65vw;
    font-weight: 300;
}
/* конец шапка */
/* начало каталог */
.catalog ul {
    display: flex;
    flex-wrap: wrap;
    margin: auto;
    width: 83.33vw;
    padding: 0;
}
.catalog img {
    width: 100%;
}
.img {
    height: 23.59vw;
    width: 18.96vw;
    overflow: hidden;
    position: absolute;
    bottom: 0;
    z-index: 1;
}
.img_cont {
    position: relative;
    margin-bottom: 2.08vw;
}
.img_back {
    position: absolute;
}
.catalog li {
    list-style: none;
    margin-bottom: 5.99vw;
}
.catalog li:nth-child(3n + 4),
.catalog li:nth-child(1) {
    height: 39.48vw;
    width: 22.71vw;
    margin-right: 8.44vw;
}
.catalog li:nth-child(3n + 4) .img_cont,
.catalog li:nth-child(1) .img_cont {
    height: 27.34vw;
    width: 22.81vw;
}
.catalog li:nth-child(3n + 4) .img,
.catalog li:nth-child(1) .img {
    right: 0;
}
.catalog li:nth-child(3n + 4) .img_back,
.catalog li:nth-child(1) .img_back {
    height: 25.16vw;
    width: 20.83vw;
    z-index: 0;
    top: 0;
    left: 0;
    background-color: #2d553e;
}
.catalog li:nth-child(2n + 3),
.catalog li:nth-child(2) {
    height: 39.48vw;
    margin-right: 8.44vw;
    width: 20.83vw;
}
.catalog li:nth-child(2n + 3) .img,
.catalog li:nth-child(2) .img {
    right: 0.94vw;
    left: 0.94vw;
}
.catalog li:nth-child(2n + 3) .img_cont,
.catalog li:nth-child(2) .img_cont {
    width: 20.83vw;
    height: 27.34vw;
}
.catalog li:nth-child(2n + 3) .img_back,
.catalog li:nth-child(2) .img_back {
    height: 25.16vw;
    width: 20.83vw;
    z-index: 0;
    top: 0;
    margin: auto;
    background-color: #2d553e;
}
.catalog li:nth-child(3n + 3) {
    height: 39.48vw;
    margin-right: 0;
    width: 22.71vw;
}
.catalog li:nth-child(3n + 3) .img {
    left: 0;
}
.catalog li:nth-child(3n + 3) .img_cont {
    height: 27.34vw;
    width: 22.81vw;
}

.catalog li:nth-child(3n + 3) .img_back {
    height: 25.16vw;
    width: 20.83vw;
    z-index: 0;
    right: 0;
    background-color: #2d553e;
}
.catalog p {
    height: 2.55vw;
    font-size: 2.08vw;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    line-height: 1.3em;
    font-weight: 300;
    margin-bottom: 1.25vw;
}
li a {
    text-decoration: none;
    color: black;
}
.text {
    position: relative;
    height: 10.42vw;
}
.text button {
    position: absolute;
    bottom: 0;
    right: 0;
    height: 5.16vw;
    width: 11.3vw;
    background-color: transparent;
    border: none;
    background-image: url("/media/allbuttonBack.svg");
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
}
/* конец каталог */

</style>
