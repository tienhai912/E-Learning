module Supports
  class RelationshipSupports
    attr_reader :relationship_build, :relationship_destroy

    def initialize args = {}
      active_relationships = args[:current_user].active_relationships
      @relationship_build = active_relationships.build
      @relationship_destroy = active_relationships.find_by following_id: args[:user_id]
    end
  end
end
