/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.schema.createTable('personal_data', (table) => {
      table.increments
      table.string('name')
      table.string('desc')
      table.string('desc_short')
      table.timestamp(true, true)
  })
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
  return knex.schema.dropTable('personal_data');
};
