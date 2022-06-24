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
        <button class="add" v-if="role == 2" v-on:click="edit">
            Добавить товар
        </button>
        <div v-if="role == 2" class="edit">
            <div>
                <input
                    type="text"
                    name=""
                    v-model="title"
                    placeholder="Название товара"
                    maxlength="255"
                />
                <input
                    type="text"
                    name=""
                    v-model="price"
                    placeholder="Цена товара"
                    maxlength="255"
                />
                <input
                    type="text"
                    name=""
                    v-model="text"
                    placeholder="Описание товара"
                    maxlength="255"
                />
                <input id="img_file" type="file" name="" />
                <button v-on:click="savel">Сохранить</button>
                <button v-on:click="close">Отменить</button>
            </div>
        </div>
        <div class="catalog">
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
    </div>
</template>

<script>
export default {
    name: "Catalog",
    data() {
        return {
            products: [],
            start: 0,
            role: 0,
            title: "",
            price: "",
            text: "",
        };
    },
    created() {
        if (localStorage.getItem("token")) {
            const instance = axios.create({
                baseURL: "http://127.0.0.1:8000/api",
            });
            instance.defaults.headers.common["Authorization"] = `Bearer ${
                JSON.parse(localStorage.getItem("token")).access_token
            }`;
            instance
                .post("/auth/role")
                .then((res) => {
                    this.role = res.data;
                    this.slep();
                })
                .catch((err) => {
                    console.log(err);
                });
        }
        this.getProducts();
    },
    methods: {
        getProducts() {
            axios
                .get("http://127.0.0.1:8000/api/products")
                .then((response) => {
                    this.products = response.data;
                })
                .catch((error) => {
                    console.log(error);
                });
        },
        edit: function () {
            document.querySelector(".edit").style.display = "block";
        },
        close: function () {
            document.querySelector(".edit").style.display = "none";
        },
        save: function () {
            var formData = new FormData();
            formData.append(
                "img",
                document.getElementById("img_file").files[0]
            );
            formData.append("title", this.title);
            formData.append("text", this.text);
            formData.append("price", this.price);
            axios
                .post("http://127.0.0.1:8000/api/createProduct", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                })
                .then(() => {
                    this.getProducts();
                    // location.reload();
                    this.close();
                })
                .catch((error) => {
                    console.log(error.response.data);
                });
        },
        savel: function () {
            let data = new FormData();
            // data['surname']= this.surname;
            // data['age']= this.age;
            // data['staj'] = this.staj;
            // data['city'] = this.city;
            // data['napravlinia'] = this.napravlinia;
            // data['opisanie'] = this.opisanie;
            // data['cena'] = this.cena;
            // data['pol'] = this.pol;
            // data['file'] = this.file;
            // data.append("surname", this.surname);
            // data.append("age", this.age);
            // data.append("staj", this.staj);
            // data.append("city", this.city);
            // data.append("napravlinia", this.napravlinia);
            // data.append("opisanie", this.opisanie);
            // data.append("cena", this.cena);
            // data.append("pol", this.pol);
            // data.append("file", this.file);
            data.append("title", this.title);
            data.append("text", this.text);
            data.append("price", this.price);
            // const files = this.dropzone.getAcceptedFiles();
            // data["images"] = [];
            // files.forEach((file) => {
            //     data["images"].push(file);
            // });
            // data['_method'] = 'put'; // add this
            // axios.post('/api/user/updateAvatar',data)
            axios
                .post("/api/test", data, {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                })
                .then((res) => {
                    console.log(res);
                    console.log("Успешно добавлена");
                });
        },
    },
};
</script>
<style scoped>
/* начало шапк
.а */
.add {
    margin: 0 8.39vw 8.39vw 8.39vw;
    border: none;
    font-size: 1.67vw;
    border-radius: 0;
    width: 30vw;
    height: 5vw;
    color: white;
    background-color: #2d553e;
}
.edit {
    display: none;
    position: absolute;
    position: fixed;
    height: 100%;
    width: 100%;
    z-index: 10;
    top: 0;
    background-color: rgba(0, 0, 0, 0.5);
    text-align: center;
}
.block {
    display: block;
}
.edit div {
    width: fit-content;
    margin: auto;
    z-index: 10;
    background-color: #ebdcc8;
    padding: 7vw;
    display: flex;
    flex-direction: column;
}
.edit input {
    font-size: 1.67vw;
    border: none;
    border-bottom: 0.15vw solid #cca76e;
    border-radius: 0;
    color: black;
    padding: 0.67vw;
    margin: 1.67vw auto;
    width: 30vw;
    background-color: transparent;
}
.edit button {
    font-size: 1.67vw;
    border-radius: 0;
    color: black;
    padding: 0.67vw;
    margin: 1.67vw auto;
    width: 30vw;
    color: white;
    background-color: #2d553e;
}
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
