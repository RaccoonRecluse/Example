<template>
    <div>
        <div class="container">
            <div class="logo">
                <router-link to="/">
                    <img src="/media/logo.svg" alt="" />
                </router-link>
            </div>
            <div></div>
            <div class="nav_text">
                <router-link to="/catalog">
                    <a href="#"><p>Каталог</p></a>
                </router-link>

                <router-link to="/articles"
                    ><a href="#"><p>Статьи</p></a></router-link
                >
                <router-link to="/"
                    ><a href="#"><p>Подбор растений</p></a></router-link
                >
            </div>
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
                <router-link to="/favorite">
                    <img src="/media/heart.svg" alt="" />
                </router-link>
                <router-link to="/chat">
                    <img src="/media/chat.svg" alt="" />
                </router-link>
            </div>
        </div>
        <div class="loader">
            <img src="/media/loader.svg" alt="" />
        </div>
        <router-view></router-view>
    </div>
</template>

<script>
export default {
    name: "Shapka",
    data() {
        return {
            show: localStorage.getItem("token") ? true : false,
            token: localStorage.getItem("token") ? true : false,
        };
    },
    mounted() {
        this.slep();
    },
    methods: {
        slep: async function() {
            document.querySelector(".loader").style.display = "flex";
            await this.sleep(1000);
            document.querySelector(".loader").style.display = "none";
            
        },
        sleep(ms) {
            return new Promise((resolve) => {
                setTimeout(resolve, ms);
            });
        },
        refreshToken() {
            const instance = axios.create({
                baseURL: "http://127.0.0.1:8000/api",
            });

            instance.defaults.headers.common["Authorization"] = `Bearer ${
                JSON.parse(localStorage.getItem("token")).access_token
            }`;
            instance
                .post("/auth/refresh")
                .then((response) => {
                    localStorage.setItem(
                        "token",
                        JSON.stringify(response.data)
                    );
                    this.logout();
                })
                .catch(() => {
                    localStorage.clear();
                    this.$router.push('/login');
                    
                });
        },
        logout() {
            
            const instance = axios.create({
                baseURL: "http://127.0.0.1:8000/api",
            });

            instance.defaults.headers.common["Authorization"] = `Bearer ${
                JSON.parse(localStorage.getItem("token")).access_token
            }`;
            instance
                .post("/auth/logout")
                .then(() => {
                    window.location.href = "http://127.0.0.1:8000/";
                    localStorage.clear();
                })
                .catch((err) => {
                    console.log(err);
                    this.refreshToken();
                });
        },
    },
    watch: {
        $route(to, from) {
            this.slep();
        },
    },
};
</script>

<style>
* {
    margin: 0;
    font-family: "Montserrat Alternates", sans-serif;
    user-select: none;
}
body {
    background-color: #ebdcc8;
}

::-webkit-scrollbar {
    position: absolute;
    z-index: 10;
    width: 0;
}
::-webkit-scrollbar-thumb {
    background-image: url("/media/shapka_back.svg");
    background-size: cover;
    background-position: center;
    background: none;
}
</style>
<style scoped>
.container {
    position: relative;
    padding: 0 6.15vw 0 4.17vw;
    height: 8.13vw;
    display: flex;
    justify-content: space-between;
    align-items: center;
    z-index: 1;
}
.logo {
    background-image: url("/media/logo_back.svg");
    background-repeat: no-repeat;
    background-position: center top;
    background-size: contain;
    width: 10vw;
    height: 21.93vw;
    text-align: center;
    align-self: flex-start;
}
.logo img {
    height: 9.79vw;
    margin-top: 1.41vw;
}
.nav_img {
    background-image: url("/media/shapka_back.svg");
    background-repeat: no-repeat;
    background-position: center top;
    background-size: contain;
    padding-top: 3.67vw;
    width: 4.64vw;
    height: 48.5vw;
    text-align: center;
    display: flex;
    align-self: flex-start;
    flex-direction: column;
}
.nav_img img {
    height: 1.82vw;
    padding: 0.81vw 0;
    margin: auto;
}
.nav_text {
    display: flex;
}
.nav_text a {
    text-decoration: none;
    color: black;
    font-size: 1.67vw;
    padding: 0 1.25vw;
}

.hide {
    display: none;
}
.show {
    display: block;
}
.loader {
    position: fixed;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: #ebdcc8;
    display: none;
    align-items: center;
    justify-content: center;
    z-index: 12;

}
</style>
