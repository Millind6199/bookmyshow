<template>
    <nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark rounded">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Book My Show</a>
            <div v-if="!isAuth">
                <button class="btn btn-light" v-on:click="logout">Log Out</button>

            </div>
       </div>
    </nav>

</template>

<script>
export default {
    name: "index",
    data(){
        return{
            isAuth:false,
            seen:false
        }
    },
    methods:{
        logout(){
            if(localStorage.getItem('isAuth') == "true")
            {
                 this.seen = true
                localStorage.removeItem('isAuth')
                this.$router.push('/')
            }

        },


    }
}
</script>

<style scoped>

</style>
