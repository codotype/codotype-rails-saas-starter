module.exports = {
  name: 'ModuleStore',
  async forEachSchema({ blueprint, configuration, schema }) {
    if (schema.identifier === 'user') return

    function getLeadAttr(rel) {
      const schema = blueprint.schemas.find(s => s.id === rel.related_schema_id);
      const attr = schema.attributes[0]
      if (attr) return attr.identifier
      return 'id'
    }

    // Ensures presence of requisite views directory
    await this.ensureDir('app/views/' + schema.identifier_plural)

    // views/schemas/index.html.erb
    await this.renderComponent({
      src: 'index.html.erb',
      dest: 'app/views/' + schema.identifier_plural + '/index.html.erb',
      data: { schema }
    });

    // views/schemas/edit.html.erb
    await this.renderComponent({
      src: 'edit.html.erb',
      dest: 'app/views/' + schema.identifier_plural + '/edit.html.erb',
      data: { schema }
    });

    // views/schemas/_form.html.erb
    await this.renderComponent({
      src: '_form.html.erb',
      dest: 'app/views/' + schema.identifier_plural + '/_form.html.erb',
      data: { schema, getLeadAttr }
    });

    // views/schemas/new.html.erb
    await this.renderComponent({
      src: 'new.html.erb',
      dest: 'app/views/' + schema.identifier_plural + '/new.html.erb',
      data: { schema }
    });

    // views/schemas/show.html.erb
    await this.renderComponent({
      src: 'show.html.erb',
      dest: 'app/views/' + schema.identifier_plural + '/show.html.erb',
      data: { schema }
    });
  }
};
