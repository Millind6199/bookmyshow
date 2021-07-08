<template>

    <div>
        <User_Side_Bar/>
        <div v-for="ticket in tickets" :key="ticket.id">
        <div class="card mb-3 mt-5">
            <img :src="/uploads/+ticket.image" class="card-img-top" alt="...">
            <div class="card-body" >
                <h5 class="card-title">{{ticket.name}}</h5>
                <p class="card-text">Show Date:{{ticket.date}}</p>
                <p class="card-text ">Seats no:{{ticket.no}}</p>
                <p class="card-text"><small>Booked at:{{ticket.created_at}}</small></p>
            </div>
        </div>
        </div>
    </div>

</template>

<script>
import User_Side_Bar from "../User_Side_Bar";
export default {
    name: "MyBookedTicket",
    components:{
      User_Side_Bar
    },
    data(){
        return{
            tickets:[],
        }
    },
    methods:{
        getBookedTicketByUserId(){
            axios.get('/api/bookedtickets',{
                headers : {
                    'Authorization' : `Bearer ${localStorage.getItem('token')}`
                }
            }).then(ticket =>{
                console.warn('ticket',ticket)
                this.tickets = ticket.data.tickets
            })
        }
    },
    mounted(){
            this.getBookedTicketByUserId()
    }
}
</script>

<style scoped>
.card{
    width:1000px;
    margin-left:100px;
    background-color:2F4F4F;
    color:black;
}
img{
    height:300px;
}
</style>
