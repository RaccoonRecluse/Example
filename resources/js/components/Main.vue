<template>
    <div>
        <div class="header">
            <link rel="stylesheet" href="/css/index.css" />
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
        <div class="about">
            <div class="about_text">
                <h1>О нас</h1>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Aliquet sagittis justo, sit elementum, eu sed. Augue aliquam
                    donec eget turpis at lacinia massa, feugiat. Sagittis ut
                    feugiat diam adipiscing ac, libero. Convallis commodo enim
                    integer mi tortor eu sed.
                </p>
                <button>Подробнее</button>
            </div>
            <div class="about_img">
                <img src="/media/about.png" alt="" />
            </div>
        </div>
        <div class="gallery_cont">
            <h2>Галерея</h2>
            <div class="gallery">
                <div class="galleryGrid">
                    <img src="/media/gallery1.png" class="gallery1" alt="" />
                    <img src="/media/gallery2.png" alt="" />
                    <img src="/media/gallery3.png" class="gallery3" alt="" />
                    <img src="/media/gallery4.png" class="gallery4" alt="" />
                    <img src="/media/gallery5.png" alt="" />
                    <img src="/media/gallery6.png" class="gallery6" alt="" />
                    <img src="/media/gallery7.png" alt="" />
                </div>
                <img
                    class="galleryPlant"
                    src="/media/galleryPlant.png"
                    alt=""
                />
            </div>
        </div>
        <div class="popular">
            <h3>Популярные товары</h3>
            <div class="pop_cont">
                <div v-for="prod in products" :key="prod.id" class="pop_prod">
                    <router-link :to="'/product/' + prod.id">
                        <button></button>
                        <div class="img_pop_cont">
                            <img :src="'/media' + prod.img" alt="" />
                        </div>
                    </router-link>
                </div>
            </div>
        </div>
        <div class="catalog_a">
            <router-link to="/catalog">
                <button>Каталог</button>
            </router-link>
        </div>

    </div>
</template>

<script>
export default {
    name: "Main",
    data() {
        return {
            products: [],
            test: 0,
        };
    },
    created() {
        axios
            .get("http://127.0.0.1:8000/api/getAllPopulars")
            .then((response) => {
                this.products = response.data;
                this.slep();
            })
            .catch((error) => {
                console.log(error);
            });
    },
    methods: {
       
    },
};
</script>

<style>
* {
    margin: 0;
    font-family: "Montserrat Alternates", sans-serif;
}
body {
    background-color: #ebdcc8;
}
</style>
<style scoped>
.popular {
    background-image: url("/media/popularBack.svg");
    background-size: 100% auto;
    background-position: center bottom;
    background-repeat: no-repeat;
}
.popular h3 {
    font-size: 3.33vw;
    text-align: center;
    margin: 5.57vw 0 6.67vw;
    font-weight: 400;
}
.popular button:not(.catalog_a) {
    bottom: 0;
    right: 0;
    height: 4.06vw;
    width: 9.01vw;
    background-color: transparent;
    border: none;
    background-image: url("/media/allbuttonBack.svg");
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
    cursor: pointer;
    margin: 1vw 0;
}
.pop_prod {
    text-align: center;
    margin-bottom: -1.8vw;
}
.pop_cont {
    display: flex;
    width: 74.38vw;
    justify-content: space-between;
    margin: auto;
}
.img_pop_cont {
    height: 19.32vw;
    width: 15.52vw;
    overflow: hidden;
}
.img_pop_cont img {
    height: auto;
    width: 100%;
}
.catalog_a button {
    width: 26.88vw;
    height: 7.66vw;
    background-image: url("/media/popularbuttonBack.svg");
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
    border: none;
    background-color: transparent;
    margin: 8.85vw auto 0;
    color: white;
    font-size: 1.88vw;
    cursor: pointer;
}
.catalog_a a {
    text-decoration: none;
    cursor: pointer;
    margin: auto;
}
.catalog_a {
    text-align: center;
}
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
/* начало о компании */
.about {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 79.38vw;
    margin: auto;
    margin-bottom: 11.56vw;
}
.about_text h1 {
    text-align: left;
    font-size: 2.5vw;
    font-weight: 500;
}
.about_text p {
    text-align: left;
    font-size: 1.88vw;
    text-align: justify;
    margin: 2.5vw 0 4.01vw 0;
}
.about_text button {
    background: none;
    background-image: url("/media/button_back.svg");
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
    border: none;
    height: 7.71vw;
    width: 26.88vw;
    color: white;
    font-size: 1.88vw;
}
.about_text {
    text-align: center;
    width: 38.9vw;
}
.about_img {
    height: 43.33vw;
    width: 32.4vw;
    background-image: url("/media/about_back.svg");
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
    border: none;
    display: flex;
    align-items: center;
    justify-content: center;
}
.about_img img {
    height: 40.6vw;
    width: 26.77vw;
}
/* конец о компании */
/* начало галереи */
.gallery_cont h2 {
    font-size: 3.33vw;
    text-align: center;
    font-weight: 500;
    margin-bottom: 5.57vw;
}
.gallery {
    position: relative;
    background-image: url("/media/galleryBack.svg");
    background-position: bottom;
    background-repeat: no-repeat;
    background-size: 100%;
    display: flex;
    justify-content: center;
    height: 39.06vw;
}
.galleryGrid {
    display: grid;
    grid-template-columns: 15.42vw 14.53vw 17.45vw 14.27vw;
    grid-template-rows: 11.56vw 10.52vw 6.67vw;
    gap: 1.04vw;
    width: 64.79vw;
}
.galleryGrid img {
    height: 100%;
    width: 100%;
}
.gallery1 {
    grid-row: 1/3;
}
.gallery3 {
    grid-column: 3/4;
    grid-row: 1/4;
}
.gallery4 {
    grid-column: 4/5;
    grid-row: 1/3;
}
.gallery6 {
    grid-row: 2/4;
}
.galleryPlant {
    position: absolute;
    right: 0;
    bottom: 0;
    height: 37.97vw;
}
/* конец галереи */

</style>
