class Create<%= schema.class_name_plural %> < ActiveRecord::Migration[5.2]
  def change
    create_table :<%= schema.identifier_plural %> do |t|

      <%_ schema.attributes.forEach((attr, index) => { _%>
      <%_ if (attr.datatype === DATATYPE_STRING) { _%>
      t.string :<%= attr.identifier %>
      <%_ } else if (attr.datatype === DATATYPE_TEXT) { _%>
      t.string :<%= attr.identifier %>
      <%_ } else if (attr.datatype === DATATYPE_INTEGER) { _%>
      t.integer :<%= attr.identifier %>
      <%_ } else if (attr.datatype === DATATYPE_FLOAT) { _%>
      t.float :<%= attr.identifier %>
      <%_ } else if (attr.datatype === DATATYPE_DECIMAL) { _%>
      t.decimal :<%= attr.identifier %>
      <%_ } else if (attr.datatype === DATATYPE_BOOLEAN) { _%>
      t.boolean :<%= attr.identifier %>
      <%_ } else if (attr.datatype === DATATYPE_DATE) { _%>
      t.date :<%= attr.identifier %>
      <%_ } else if (attr.datatype === DATATYPE_TIME) { _%>
      t.time :<%= attr.identifier %>
      <%= attr.identifier %>: '17:04:14 GMT-0400',
      <%_ } else if (attr.datatype === DATATYPE_TIMESTAMP) { _%>
      t.timestamp :<%= attr.identifier %>
      <%_ } _%>
      <%_ }) _%>
      <%_ schema.relations.forEach((rel, index) => { _%>
      <%_ if (rel.type === RELATION_TYPE_BELONGS_TO) { _%>
      t.belongs_to :<%= rel.alias.identifier %>, foreign_key: :true
      <%_ } else if (rel.type === RELATION_TYPE_HAS_ONE) { _%>
      <%_ } else if (rel.type === RELATION_TYPE_HAS_MANY) { _%>
      <%_ } _%>
      <%_ }) _%>

      t.timestamps
    end
  end
end
