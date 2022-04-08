const knex = require('knex')({
    client: process.env.CLIENT,
    connection: { 
        database: process.env.DB,
        user: process.env.USER_DB,
        password: process.env.PASSWORD_DB
    }
})

export default knex;