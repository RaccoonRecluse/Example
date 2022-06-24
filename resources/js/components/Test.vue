<template>
    <div class="container">
         
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">TESTTTTTTTTTTTTTTTTT Component</div>
                    <router-link to="/test">LINK</router-link>
                    <router-link to="/test2">LINK2</router-link>
                    <div class="card-body">
                        I'm an example component.
                      
                    </div>
                </div>
            </div>
        </div>
        <router-view></router-view>
    </div>
    
</template>

<script>
    export default {
        name: "Test"
    }
</script>
