<template>

    <div>
        <index/>

        <div class="row">

            <div class="col-5">
                    <Sidebar/>
            </div>
            <form @submit.prevent="login" method="post" class="rounded">
                <input class="rounded" type="email" name="email" placeholder="User name" v-model="items.email"><br><br><br>
                <input class="rounded" type="password" name="password" placeholder="Abc@123" v-model="items.password"> <br><br><br>
                <input class="btn btn-outline-warning" type="submit" name="login" value="Login"> <br><br>
                <span>New user? <router-link to="/signup">Sign up</router-link></span>


            </form>

        </div>
        <Footer/>

    </div>


</template>

<script>
import index from './index';
import Sidebar from "./Sidebar";
import Footer from "./Footer";
import axios from "axios";
export default {
    name: "Login",
    components:{
        index,
        Sidebar,
        Footer
    },
    data(){
        return{

            items:{
               email:null,
               password:null,

            },
        }
    },
    methods:{
        login(){
            // alert('hi')
          axios.post('/api/login',this.items).then((result)=>{

              if(result.data.isAdmin == 'true') {
                  alert(result.data.message)
                  this.seen = true
                  this.data = result.data.data
                  localStorage.setItem('isAuth', true)
                  localStorage.setItem('token', result.data.token)
                  this.$router.push('/dashboard')
              }
              else
              {
                  alert(result.data.message)
                  this.seen = true
                  this.data = result.data.data
                  localStorage.setItem('isAuth', true)
                  localStorage.setItem('token', result.data.token)
                  this.$router.push('/user/home')

              }
              })
        },

    }
}
</script>

<style scoped>
form{
    border: #1d68a7;
    background-color: #1b4b72;
    padding: 50px;
    margin-top:200px;
    font-family: "Nunito", sans-serif;
}
input{
    width:400px;
    height: 50px;
}
span{
    float: right;
    color: white;
}
</style>
