<template>
<div>
    <User_Side_Bar/>
</div>
</template>

<script>
import User_Side_Bar from "../User_Side_Bar";
export default {
    name: "BookTicket",
    components:{
        User_Side_Bar
    },
    data(){
        return{
            isAuth: '',

        }
    }

}
</script>

<style scoped>

</style>
