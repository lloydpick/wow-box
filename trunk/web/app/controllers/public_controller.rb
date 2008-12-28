# Public access control:
#
# This class provides a visibility mechanism to make it easy to allow/deny
# access to actions generated by using map.resource in the routes file.
#
# By default, visibility is controlled by a hash of action name/value pairs.
# Possible values for each action are:
#  :hide -> pretend this doesn't exist - give a 404
#  :allow -> this action can be accessed freely
#  :login -> this action can only be accessed by logged in users
#
# The defaults given in this file hide all actions apart from :index and :show
# To override this in a controller, use the visibility function to set groups
# of actions with a common visibility, eg:
#
# MyController < PublicController
#   visibility :hide => [:index, :new], :login => [:edit, :update]
#   ...
#
# The visibility function accepts 2 special keys:
#
#   :inherit - Pass :inherit => false to avoid picking up the default
#              visibilities set by this controller.
#
#   :default - Pass :default => <visibility> to change the default visibility
#              for actions that are not explicitly listed.
#
class PublicController < ApplicationController
  before_filter :default_visibility_control

  # The minimum admin levels required by default to access the 7 rest actions
  # for controllers that don't provide any customisation.
  DEFAULT_ACTION_VISIBILITY = :hide
  ACTION_VISIBILITY = { :show => :allow, :index => :allow }


  # ----- ACTION VISIBILITY -----

  # This function is used as a before filter by default.  If you need to do
  # something different in your controller, just subclass it or the visibility
  # method.
  def default_visibility_control
    vis = get_action_visibility(action_name)
    case vis
      when :hide  then respond_with_404
      when :login then login_required
      when :allow then true
      else raise "Unknown visibility #{vis} for #{self} #{action_name}"
    end
  end

  # Return the visibility value (:hide, :allow, :login) for the given action
  def get_action_visibility(action, controller_class = nil)
    vishash = (controller_class || self.class).action_visibility
    default = (controller_class || self.class).default_action_visibility
    vishash.fetch(action.to_sym, default)
  end

  # Return the classes visibility hash
  def self.action_visibility
    self::ACTION_VISIBILITY
  end

  # Allow override of the default :hide visibility session for a controller
  def self.default_action_visibility
    self::DEFAULT_ACTION_VISIBILITY
  end

  # ----- PRIVATE METHODS -----
  private

  def self.visibility(values)
    # Override default for actions not explicitly names
    if default = values.delete(:default)
      const_set :DEFAULT_ACTION_VISIBILITY, default
    end
    # If :inherit => false is given, don't pull defaults from our superclass
    if values.delete(:inherit) {|if_not_found_return| true}
      vishash = superclass.action_visibility
    else
      vishash = {}
    end

    # convert from :vis => [:action1, :action2, ...] into { :action1 => :vis,
    # :action2 => :vis, ... }
    values.each { |visibility, actions|
      actions.each { |action| vishash[action] = visibility }
    }
    const_set :ACTION_VISIBILITY, vishash
  end

end