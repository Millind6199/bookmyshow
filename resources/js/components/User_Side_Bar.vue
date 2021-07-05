<template>
    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" style="color:#cc0000" href="#"><strong>Book My Show</strong></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/#/user/home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">My Bookings</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Contact Us</a>
                        </li>
                        </ul>
                    <div style="margin-left: 350px">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div v-if="!isAuth">
                        <button class="btn btn-dark" v-on:click="logout">Log Out</button>

                    </div>


                </div>
            </div>
        </nav>
    </div>
</template>

<script>
export default {
    name: "User_Side_Bar",
    data(){
      return{
          isAuth: ''
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
