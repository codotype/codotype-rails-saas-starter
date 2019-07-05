class <%= schema.class_name %> < ApplicationRecord
  <%_ schema.relations.forEach((rel, index) => { _%>
  <%_ if (rel.type === RELATION_TYPE_BELONGS_TO) { _%>
  belongs_to :<%= rel.alias.identifier %>, class_name: '<%= rel.schema.class_name %>'
  <%_ } else if (rel.type === RELATION_TYPE_HAS_ONE) { _%>
  <%_ } else if (rel.type === RELATION_TYPE_HAS_MANY) { _%>
  <%_ } _%>
  <%_ }) _%>
end
