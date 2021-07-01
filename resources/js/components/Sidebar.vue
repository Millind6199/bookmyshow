<template>
    <div>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
              integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:15%">

            <h3 class="w3-bar-item"> <i class="fas fa-bars"></i> Menu</h3>


            <span><router-link to="/dashboard" class="nav-link">Dashboard</router-link></span><br>
            <router-link to="/addmovie" class="nav-link">Add Movie</router-link><br>
            <router-link to="/viewdata" class="nav-link">View Movies</router-link><br>
        </div>

    </div>
</template>

<script>
export default {
    name: "Sidebar"
}
</script>

<style scoped>

</style>
