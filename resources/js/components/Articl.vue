<template>
    <div>
        <div class="product">
            <div class="product_label">
                <div class="img_cont">
                    <img :src="'/media' + data.img" alt="" />
                    <img
                        v-if="role == 2"
                        src="/media/krest.svg"
                        class="krest"
                        v-on:click="deletep"
                        alt=""
                    />
                    <img
                        v-if="role == 2"
                        src="/media/pencil.svg"
                        class="pencil"
                        v-on:click="edit"
                        alt=""
                    />
                    <img
                        src="/media/heart.svg"
                        class="favorite"
                        v-bind:class="{ favorite: favorite }"
                        v-on:click="addToFavorite"
                        alt=""
                    />
                </div>
            </div>
            <div class="text">
                <div>
                    <h2>{{ this.data.title }}</h2>
                </div>
                <p>
                    {{ data.text }}
                </p>
            </div>
        </div>
        <div class="edit">
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
    </div>
</template>

<script>
export default {
    name: "Articl",
    data() {
        return {
            data: [],
            start: this.$route.params.id,
            favorite: false,
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
        const article = {
            id: this.$route.params.id,
        };
        axios
            .post("http://127.0.0.1:8000/api/getArticl", article)
            .then((response) => {
                this.data = response.data;
                const instance = axios.create({
                    baseURL: "http://127.0.0.1:8000/api",
                });
                const article = {
                    articles_id: this.data.id,
                };
                instance.defaults.headers.common["Authorization"] = `Bearer ${
                    JSON.parse(localStorage.getItem("token")).access_token
                }`;
                instance
                    .post("/checkFavoriteArticle", article)
                    .then((res) => {
                        if (!res.data)
                            document.querySelector(".favorite").src =
                                "/media/heart.svg";
                        else
                            document.querySelector(".favorite").src =
                                "/media/heartRed.svg";
                    })
                    .catch((err) => {
                        console.log(err);
                    });
            })
            .catch((error) => {
                console.log(error);
            });
    },

    methods: {
        edit: function () {
            document.querySelector(".edit").style.display = "block";
        },
        close: function () {
            document.querySelector(".edit").style.display = "none";
        },
        deletep: function () {
            var formData = new FormData();
            formData.append("id", this.data.id);
            axios
                .post("http://127.0.0.1:8000/api/deleteArticle", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                })
                .then(() => {
                    this.$router.push("/articles");
                    alert("Статья удалена.");
                })
                .catch((error) => {
                    console.log(error.response);
                });
        },
        save: function () {
            var formData = new FormData();
            formData.append(
                "img",
                document.getElementById("img_file").files[0]
            );
            formData.append("title", this.title);
            formData.append("text", this.text);
            formData.append("id", this.data.id);
            axios
                .post("http://127.0.0.1:8000/api/editArticle", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                })
                .then(() => {
                    alert("Товар изменён");
                })
                .catch((error) => {
                    console.log(error.response.data);
                });
        },
        addToFavorite: function () {
            const instance = axios.create({
                baseURL: "http://127.0.0.1:8000/api",
            });
            const article = {
                articles_id: this.data.id,
            };
            instance.defaults.headers.common["Authorization"] = `Bearer ${
                JSON.parse(localStorage.getItem("token")).access_token
            }`;
            instance
                .post("/addToFavoriteArticle", article)
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
                .catch((err) => {
                    console.log(err);
                });
        },
    },
};
</script>
<style scoped>
.pencil {
    position: absolute;
    width: 2.34vw;
    height: 2.34vw;
    top: 0.78vw;
    right: 4.22vw;
}
.krest {
    position: absolute;
    width: 2.34vw;
    height: 2.34vw;
    top: 0.78vw;
    right: 7.86vw;
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
.product_label {
    display: flex;
    width: 53.13vw;
    height: 33.7vw;
    margin: auto;
    background-repeat: no-repeat;
    background-image: url("/media/articlImgBack.svg");
    background-size: 100% auto;
    background-position: center;
    align-items: center;
    justify-content: space-between;
}
.img_cont {
    width: 25.42vw;
    height: 31.61vw;
    overflow: hidden;
    align-self: flex-start;
    margin: auto;
    position: relative;
}
.img_cont img:not(.favorite, .krest, .pencil) {
    width: 100%;
    height: auto;
}
.product_label h2 {
    font-weight: 400;
    font-size: 2.08vw;
    margin-top: -9.91vw;
}
.product_label p {
    font-size: 1.67vw;
    margin-top: 1.88vw;
}
.product_label p,
.product_label h2 {
    margin-left: 3.91vw;
}
.text p {
    padding: 6.96vw 9.38vw 9.96vw;
    width: 55.11vw;
    margin: auto;
    background-color: #cca76e;
    font-size: 1.67vw;
    text-align: justify;
}
.text h2 {
    font-size: 2.08vw;
    font-weight: 300;
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
    text-align: center;
    width: 64.06vw;
    margin: 7.19vw auto 2.6vw;
}
.product {
    width: fit-content;
    margin: auto;
}
.favorite {
    position: absolute;
    width: 2.34vw;
    height: 2.34vw;
    top: 0.78vw;
    right: 0.78vw;
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
