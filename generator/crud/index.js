
module.exports = {
  name: 'CRUD Model + Controllers',
  async forEachSchema({ blueprint, configuration, schema }) {
    if (schema.identifier === 'user') return

    const attributeParams = schema.attributes.map(a => ':' + a.identifier)
    const relationParams = schema.relations.map(rel => ':' + rel.schema.identifier + '_id') // TODO - should be alias.identifier
    const allowedParams = [...attributeParams, ...relationParams].join(', ')

    // app/controllers/schema_controller.rb
    await this.renderComponent({
      src: 'schema-controller.rb',
      dest: `app/controllers/${schema.identifier_plural}_controller.rb`,
      data: { schema, allowedParams }
    })

    // app/models/schema.rb
    await this.renderComponent({
      src: 'schema-model.rb',
      dest: `app/models/${schema.identifier}.rb`,
      data: { schema }
    })

  }
};
