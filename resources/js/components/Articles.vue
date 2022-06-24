<template>
    <div>
        <button class="add" v-if="role == 2" v-on:click="edit">
            Добавить статью
        </button>
        <div v-if="role == 2" class="edit">
            <div>
                <input
                    type="text"
                    name=""
                    v-model="title"
                    placeholder="Название статьи"
                    maxlength="255"
                />
                <input
                    type="text"
                    name=""
                    v-model="text"
                    placeholder="Текст статьи"
                    maxlength="255"
                />
                <input id="img_file" type="file" name="" />
                <button v-on:click="save">Сохранить</button>
                <button v-on:click="close">Отменить</button>
            </div>
        </div>
        <div v-for="art in data" class="article" :key="art.id">
            <div class="img_back">
                <img :src="'/media' + art.img" alt="" />
            </div>
            <div class="text">
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
    name: "Articles",
    data() {
        return {
            data: [],
            role: 0,
            title: "",
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
                })
                .catch((err) => {
                    console.log(err);
                });
        }
        if (!localStorage.getItem("token")) this.$router.push("login");
        else {
            this.getArticles()
        }
    },

    methods: {
        getArticles() {
            const instance = axios.create({
                baseURL: "http://127.0.0.1:8000/api",
            });

            instance.defaults.headers.common["Authorization"] = `Bearer ${
                JSON.parse(localStorage.getItem("token")).access_token
            }`;
            instance
                .get("/getAllArticles")
                .then((res) => {
                    this.data = res.data;
                })
                .catch((err) => {
                    console.log(err);
                });
        },
        addToFavorite: function () {
            if (!localStorage.getItem("token")) {
                alert("Авторизуйтесь для данного действия.");
                return;
            }
            const instance = axios.create({
                baseURL: "http://127.0.0.1:8000/api",
            });
            const article = {
                product_id: this.data.id,
            };
            instance.defaults.headers.common["Authorization"] = `Bearer ${
                JSON.parse(localStorage.getItem("token")).access_token
            }`;
            instance
                .post("/addToFavorite", article)
                .then((res) => {
                    if (
                        document.querySelector(".favorite").src ==
                        "http://127.0.0.1:8000/media/heartRed.svg"
                    )
                        document.querySelector(".favorite").src =
                            "/media/heart.svg";
                    else
                        document.querySelector(".favorite").src =
                            "/media/heartRed.svg";
                })
                .catch((err) => {});
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
            axios
                .post("http://127.0.0.1:8000/api/createArticle", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                })
                .then(() => {
                    this.getArticles();
                    // location.reload();
                    this.close();
                })
                .catch((error) => {
                    console.log(error.response.data);
                });
        },
    },
};
</script>
<style scoped>
.add {
    margin: 0 8.39vw 8.39vw 18vw;
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
.article a {
    text-decoration: none;
    color: black;
    cursor: pointer;
}
.article {
    display: flex;
    margin: auto;
    height: 30.26vw;
    width: 63.59vw;
    align-items: center;
    margin-bottom: 12.92vw;
    border: #cca76e solid 0.26vw;
}
.article:nth-child(2n) {
    flex-direction: row-reverse;
}
.article:first-child {
    margin-top: 4.92vw;
}
.img_back img:not(.article:nth-child(2n) img) {
    height: auto;
    width: 100%;
    margin-left: -1.04vw;
}
.img_back {
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
.article:nth-child(2n) .img_back {
    flex-direction: row-reverse;
    background-position: right center;
    margin-right: 5.57vw;
    margin-left: 6.77vw;
    position: relative;
}
.article:nth-child(2n) img {
    height: auto;
    width: 100%;
    position: absolute;
    right: -1.04vw;
}
.text h1 {
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
.text p {
    text-align: justify;
    font-size: 1.25vw;
    height: 9vw;
    width: 29.64vw;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 6;
    -webkit-box-orient: vertical;
    font-weight: 300;
}
.text {
    position: relative;
}
.text button {
    position: absolute;
    bottom: -5.56vw;
    border: none;
    background-color: transparent;
    right: 0;
    width: 6.93vw;
    height: 2.71vw;
    background-image: url("/media/allbuttonBack.svg");
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center;
    cursor: pointer;
}
.loader {
    position: fixed;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: #ebdcc8;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 12;
}
</style>
