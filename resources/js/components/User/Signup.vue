<template>
<div>
    <div>
        <index/>

        <div class="row">

            <div class="col-5">
                <Sidebar/>
            </div>
            <form @submit.prevent="signup" method="post" class="rounded ">
                <input class="rounded" type="text" name="name" placeholder="Name" v-model="items.name"><br><br><br>
                <input class="rounded" type="email" name="email" placeholder="User name" v-model="items.email"><br><br><br>
                <input class="rounded" type="password" name="password" placeholder="Password" v-model="items.password"> <br><br><br>
                <input class="rounded" type="password" name="cpassword" placeholder="Confirm Password" v-model="items.cpassword"> <br><br><br>
                <input class="btn btn-outline-warning" type="submit" name="signup" value="Sign Up"> <br><br>
                <span>Already Signed Up? <router-link to="/">Log in</router-link></span>


            </form>

        </div>
        <Footer/>

    </div>


</div>
</template>

<script>
import index from '../index';
import Sidebar from "../Sidebar";
import Footer from "../Footer";
 import axios from "axios";

export default {
name: "Signup",
    components:{
        index,
        Sidebar,
        Footer
    },
    data(){
    return{
        items:{
          name:null,
          email:null,
          password:null,
          cpassword:null,
        },
    }
    },
    methods:{
    signup(){
        axios.post( '/api/signup', this.items).then((result)=>{

            if(result.data.status == 'success')
            {
                this.seen = true
                this.data = result.data.data
            }

            else {
                alert(result.data.message)
            }
                // alert('Valid')
        });

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
