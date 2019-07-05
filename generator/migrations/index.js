
module.exports = {
  name: 'DB Migrations',
  async write() {
    // TODO - this file needs user-supplied `User` attributes
    await this.renderComponent({
      src: 'schema.rb',
      dest: `db/schema.rb`
    });
  },
  async forEachSchema({ schema }) {
    if (schema.identifier === 'user') return
    await this.renderComponent({
      src: 'create_schema.rb',
      dest: `db/migrate/create_${schema.identifier_plural}.rb`,
      data: { schema }
    });
  }
}
