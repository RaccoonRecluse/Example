<template>
    <div class="header">
        <link rel="stylesheet" href="/css/register.css" />
        <div class="left">
            <img src="/media/header_left.png" alt="" />
        </div>
        <div class="register">
            <h1>Вход</h1>
            <p>
                Новый пользователь?
                <router-link to="/registration">Регистрация</router-link>
            </p>
            <form action="" @submit.prevent="created()">
                <input
                    type="email"
                    name=""
                    placeholder="E-mail"
                    v-model="email"
                />
                <input
                    type="password"
                    name=""
                    placeholder="Пароль"
                    v-model="password"
                />
                <button type="submit">Войти</button>
            </form>
        </div>
    </div>
</template>

<script>
import route from "../route";
export default {
    name: "Login",
    data() {
        return {
            email: "",
            password: "",
        };
    },
    methods: {
        created() {
            const article = {
                email: this.email,
                password: this.password,
            };
            const headers = {
                "Content-Type": "application/x-www-form-urlencoded",
                Accept: "application/json",
            };
            axios
                .post("http://127.0.0.1:8000/api/auth/login", article, headers)
                .then((response) => {
                    localStorage.setItem(
                        "token",
                        JSON.stringify(response.data)
                    );
                    window.location.href = "http://127.0.0.1:8000/";
                })
                .catch((error) => {
                    this.email = article["email"];
                    this.password = article["password"];
                    console.log(error.message);
                });
        },
    },
};
</script>
