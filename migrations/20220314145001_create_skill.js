/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.schema.createTable('skill', (table) => {
    table.increments('id', { primaryKey: true })
    table.string('title_position')
    table.string('skill')
    table.string('tools')
    table.string('plan')
    table.timestamp(true, true)
  })
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
  return knex.schema.dropTable('skill');
};
