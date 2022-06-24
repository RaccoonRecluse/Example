<template>
    <div class="container">
        <div class="logo">
            <router-link to="/"
                ><img src="/media/logo.svg" alt=""
            /></router-link>
        </div>
        <div class="nav_text">
            <router-link to="/catalog"
                ><a href="#"><p>Каталог</p></a></router-link
            >
            <router-link to="/articles"
                ><a href="#"><p>Статьи</p></a></router-link
            >
            <router-link to="/"
                ><a href="#"><p>Подбор растений</p></a></router-link
            >
        </div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div class="nav_img">
            <router-link to="/registration">
                <img
                    src="media/account.svg"
                    alt=""
                    v-bind:class="{ hide: this.show, show: !this.show }"
                />
            </router-link>
            <router-link to="/">
                <img
                    src="media/Logout.svg"
                    alt=""
                    v-on:click="logout()"
                    v-bind:class="{ show: this.show, hide: !this.show }"
                />
            </router-link>

            <router-link to="/favorite"
                ><img src="/media/heart.svg" alt=""
            /></router-link>
            <router-link to="/chat"
                ><img src="/media/chat.svg" alt=""
            /></router-link>
        </div>
    </div>
</template>

<script>
export default {
    name: "Podval",
    data() {
        return {
            show: localStorage.getItem("token") ? true : false,
        };
    },
    methods: {
        logout() {
            const instance = axios.create({
                baseURL: "http://127.0.0.1:8000/api",
            });

            instance.defaults.headers.common["Authorization"] = `Bearer ${
                JSON.parse(localStorage.getItem("token")).access_token
            }`;
            instance
                .post("/auth/logout")
                .then((res) => {
                    window.location.href = "http://127.0.0.1:8000/";
                    localStorage.clear();
                })
                .catch((err) => {
                    console.log(err);
                    window.location.href = "http://127.0.0.1:8000/";
                    localStorage.clear();
                });
        },
    },
};
</script>

<style scoped>
.container {
    position: relative;
    padding: 0 6.15vw 0 4.17vw;
    height: 13.85vw;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #3b3a37;
    margin-top: 13.02vw;
}
.logo {
    width: 10vw;
    height: 9.79vw;
    text-align: center;
}
.logo img {
    height: 9.79vw;
}

.nav_img {
    height: 2.6vw;
    text-align: center;
    display: flex;
}
.nav_img img {
    height: 2.6vw;
    padding: 0 0.81vw;
}
.nav_text {
    display: flex;
}
.nav_text a {
    text-decoration: none;
    color: white;
    font-size: 1.67vw;
    padding: 0 1.25vw;
}
.hide {
    display: none;
}
.show {
    display: block;
}
</style>
<style>
* {
    margin: 0;
    font-family: "Montserrat Alternates", sans-serif;
}
body {
    background-color: #ebdcc8;
}

</style>
