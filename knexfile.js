// Update with your config settings.

/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */

require('dotenv').config({path: './.env'})
console.log(`DB : ${process.env.USER}`);
module.exports = {

  development: {
    client: process.env.CLIENT,
    connection: {
      database: process.env.DB,
      user: process.env.USER_DB,
      password: process.env.PASSWORD_DB
    }
  },

  production: {
    client: 'postgresql',
    connection: {
      database: process.env.DB,
      user: process.env.USER_DB,
      password: process.env.PASSWORD_DB
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  }
};
