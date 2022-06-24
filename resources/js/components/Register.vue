<template>
    <div class="header">
        <link rel="stylesheet" href="/css/register.css" />
        <div class="left">
            <img src="/media/header_left.png" alt="" />
        </div>
        <div class="register">
            <h1>Регистрация</h1>
            <p>
                Уже есть аккаунт? <router-link to="/login">Войти</router-link>
            </p>
            <form action="" @submit.prevent="created()">
                <input type="text" name="" placeholder="Имя" v-model="name" />
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
                <input
                    type="password"
                    name=""
                    placeholder="Повтор пароля"
                    v-model="password_confirmation"
                />
                <button type="submit">Зарегестрироваться</button>
            </form>
        </div>
    </div>
</template>

<script>
import route from "../route";
export default {
    name: "Register",
    data() {
        return {
            name: "",
            email: "",
            password: "",
            password_confirmation: "",
        };
    },
    methods: {
        created() {
            const article = {
                name: this.name,
                email: this.email,
                password: this.password,
                password_confirmation: this.password_confirmation,
            };
            const headers = {
                "Content-Type": "application/x-www-form-urlencoded",
                "Accept": "application/json",
                // Authorization: "JWT fefege...",
            };
            axios
                .post(
                    "http://127.0.0.1:8000/api/auth/registration",
                    article,
                    headers
                )
                .then((response) => route.push("/login"))
                .catch((error) => {
                    this.name = article["name"];
                    this.email = article["email"];
                    this.password = article["password"];
                    this.password_confirmation =
                        article["password_confirmation"];
                    let textAlert = "";
                    let errors = Object.keys(error.response.data.errors).map(
                        (key) => error.response.data.errors[key]
                    );
                    errors.forEach((element) => {
                        textAlert += element[0] + "\n";
                    });
                    alert(textAlert);
                });
        },
    },
};
</script>
